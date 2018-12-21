<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@ page import="java.text.*"%>
<%@ page import="java.lang.String"%>  
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="com.lw.crm.crmname.entity.CrmName" %>
<%@ page import="com.lw.crm.crmstocktype.entity.CrmStockType"%>
<%@ page import="java.util.ArrayList" %>
<%
     ArrayList<CrmName> crmNameList = (ArrayList)request.getAttribute("crmNameList");
	ArrayList<CrmStockType> crmStockTypeList = (ArrayList) request.getAttribute("crmStockTypeList");
     %>
<%
java.util.Date date = new java.util.Date();
DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
String Fordate="";
String Todate="";
try 
{
  Fordate = request.getParameter("Fordate").trim();
 Todate = request.getParameter("Todate").trim();
}
catch (Exception e)
{

}

if(Fordate == null || Fordate.equals("") || Todate == null || Todate.equals("")){
 pageContext.setAttribute("Fordate",formatter.format(date));
pageContext.setAttribute("Todate",formatter.format(date));
}else{
pageContext.setAttribute("Fordate",Fordate);
pageContext.setAttribute("Todate",Todate);
}

 try 
 {
   pageContext.setAttribute("id",request.getParameter("id").trim());
 }
catch (Exception e)
{
 
}


String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
	 	<base href="<%=basePath%>" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8;"/>
		<%@ include file="../tag.jsp" %>
		<title>${appName}_进出货记录管理</title>
		
		<script src="<%=basePath%>resources/js/jquery-ui.min.js"type="text/javascript"></script>
		 <link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
		<style type="text/css">
			.itemtable thead tr th,table tbody tr td{
				text-align: center;
			}
		</style>
		<style>
.modal {
	margin-top: 100px;
}

 .nav {
	width: auto;
 	height: 380px;
    overflow: auto; 
} 

ul {
	list-style: none;
	padding: 0px;
}

.center {
	width: 200px;
	height: auto;
	margin: 0px auto;
}

			.nav-takeuid  ul {
            list-style: none;
            padding:0px;
        }

         .nav-takeuid   ul li .btn {
                margin: 10px;
               
                height: 35px;
               
            }
			
			.nav-takeuid ul li p{
				 text-align:center;
				 font-family:Microsoft YaHei;
				 font-size:16px;
			}

table thead tr th,table tbody tr td{
				text-align: center;
			}
			
			.returnuser{
				display: none;
			}
			
			.modal-open{
			    overflow-y: scroll;
			}
			
			.stockitem{
				display: none; 
				width:100%;
			}
			.stockresult:hover{
				background-color:#d9edf7;
			}
			.stockresult-ed{
				background-color:#d9edf7;
			}
			
			
			.modal{
				position: fixed;
			    top: -10%;
			}
</style>
	</head>
	<body>
		<%@ include file="../top.jsp"%>
   		<%@ include file="../left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li><a href="<%=basePath%>manage/index.html">首页</a></li>
	    		<li><a href="<%=basePath%>manage/crmstockinoroutlog/crmstockinoroutlog_list.html">进出货记录列表</a></li>
	    		<li><a href="javascript:void(0);">编辑</a></li>
    		</ul>
    	</div>
		<div class="rightContainer">
		<div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse" data-parent="#accordion" href="#itemInfo">查看明细 收起/展开</div>				
			<div id="itemInfo" class="panel-collapse collapse in">
			<table fit="true" fitColumns="true" class="table  table-hover table-bordered itemtable" id="itemtable">
				<thead>
					<tr>
						<th>单号</th>
						<th>名称</th>
						<th>价格</th>
						<th>分类</th>
						<th>发布时间</th>
						<th>发布人</th>
						<th>pid</th>
						<th>数量</th>
						<th>备注</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${itemlist}" var="item" varStatus="status">
						 
							<tr id="s${item.id}" data-count="${item.price*item.num}">
								<td id="number${item.id}">${item.number}</td>
								<td id="title${item.id}">${item.title}</td>
								<td id="price${item.id}">${item.price}</td>
								<td id="type${item.id}" data-type="${item.type}">${item.crmName.name}</td>
								<td id="date${item.id}"><fmt:formatDate value="${item.date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td id="uid${item.id}"><lw:SysUserTag  style=""   htmltype="1"  value="${item.uid}" /></td>
								<td id="pid${item.id}">${item.pid}</td>
								<td id="num${item.id}">${item.num}</td>
								<td id="note${item.id}">${item.note}</td>
								<td>
								
								<a href="javascript:void(0)" data-toggle="modal" data-target="#myModaledit" onclick="editmodal(${item.id})">编辑&nbsp;</a>
					   			   <a href="javascript:void(0)" onclick="del(${item.id})">删除</a></td>
							</tr>
						 
					</c:forEach>
				</tbody>
			</table>
			<div id="nullitem"></div>
			<c:if test="${itemlist.size()<=0||itemlist.size()==null}">
			<div style="text-align: center;">
				<p>没有找到数据记录</p>
			</div>
		</c:if>
    	</div>
    		<div style="width: 100%;height: 5px; background-color: #fff;"></div>
			<form class="form-horizontal" role="form" method="post" action="manage/crmstockinoroutlog/edit.html" id="userForm">
				<div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse" data-parent="#accordion" href="#panelInfo">进出货记录信息</div>				
				<div id="panelInfo" class="panel-collapse collapse in">
         			<div class="panel-body">
         			<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
					<input type="hidden" name="id" value="${crmStockInorOutLog.id}">	
						<table class="table table-bordered">
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>>单号:</td>
						    	<td class="col-md-11">
						    		<label class="form-control" style="  text-align: left;">${crmStockInorOutLog.number}</label>
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>标题:</td>
						    	<td class="col-md-11">
							    	<label class="form-control" style="  text-align: left;">${crmStockInorOutLog.title}</label>
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>总金额:</td>
						    	<td class="col-md-11">
						    		<input type="number" class="form-control " style="  text-align: left;" name="price" id="price" value="${crmStockInorOutLog.price}" placeholder="${crmStockInorOutLog.price}" >
						    	</td>
						    </tr>
							 <tr>
							    <td class="info col-md-1 text-right"><span class="red">*</span>类型:</td>
							     <td class="col-md-11"><select name="type" id="selcrmStockTypeList"
									class="form-control {required:true}">
										<option value="${crmStockInorOutLog.type}" selected="selected">${crmStockInorOutLog.crmStockType.name}</option>
										<!--动态从数据库查数据并组合成option  -->
										<%
											for (int i = 0; i < crmStockTypeList.size(); i++) {
										%>
										<option value="<%=crmStockTypeList.get(i).getId()%>">
											<%=crmStockTypeList.get(i).getName()%>
										</option>
										<%
											}
										%>
								</select></td>
							</tr>
							 <tr>
						    	<td class="info col-md-1 text-right" id="case"><span class="red">*</span>相关人员:</td>
						    	<td class="col-md-11">
						    		<label id="choose1" class="form-control" style="text-align: left;" data-toggle="modal" data-target="#myModaltakeuid"><lw:SysUserTag  style=""   htmltype="1"  value="${crmStockInorOutLog.takeuid}" /></label>
									</label>
									<input type="hidden" name="takeuid" id="takeuid"  value="${crmStockInorOutLog.takeuid}"  >
								</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>地址:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="address" id="address"  value="${crmStockInorOutLog.address}" maxlength="300" autocomplete="off" datatype="*1-300" errormsg="至少1个字符,最多300个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>备注:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="note" id="note"  value="${crmStockInorOutLog.note}" maxlength="300" autocomplete="off" datatype="*1-300" errormsg="至少1个字符,最多300个字符！">
						    	</td>
						    </tr>
					    </table>    			
					   <div class="col-md-12 text-center">
					      <button type="submit" class="btn btn-primary btn-lg">保 存</button>
					   </div>
				   </div>
			   	</div>
			</form>	
		
		<script>
		$(function(){
			$("#selcrmStockTypeList").change(function(){
				var selval=$(this).find("option:selected").val();
				switch (selval) {

				case "1":
					$("#case").text("收货人:");
					break;

				case "2":
					$("#case").text("领货人:");
					break;

				case "3":
					$("#case").text("退货人:");
					break;
					
				case "4":
					$("#case").text("领货人:");
					break;

				case "5":
					$("#case").text("相关人员:");
					break;

				case "6":
					$("#case").text("相关人员:");
					break;
				 case "7":
					$("#case").text("相关人员:");
					break; 

				default:
					$("#case").text("相关人员:");
					break;
				}
				
			});
		});
	</script>	
			
    	<div class="cls"></div>
    	</div>
    	
    	
   	 <!--takeuid  -->
	 <!-- modal begin -->
		<div class="modal fade " id="myModaltakeuid" tabindex="-1" role="dialog"
		 aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel" style="text-align:center;font-weight: bold;">
                        指定人员
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="nav-takeuid" style="width:auto;height:300px;overflow:auto;">
                    
                    	<!--搜索框  -->
                    	<table class="table">
                    	<tr>
			                 <td><label for="user" class="form-control" style="border:0px">姓名:</label></td> 
			                 <td><input type="text" name="user" id="user" class="form-control"></td> 
			                 <td>
			              		 <button  class="form-control btn btn-default" onclick="select();">查询</button>
			                 </td>
                    	</tr>
                    	</table>
                    	<div class="returnuser" id="returnuser">
                    		
                    	</div>
                        <ul>
                            <li id="takeli">
							<c:choose>
								<c:when test="${shiroActionUsersGroupList.size() <=0}">
									<p>没有找到数据记录</p>
								</c:when>

								<c:otherwise>
									
										<c:forEach items="${dutyUsernameList}" var="dutyUsername">
											<div class="btn btn-default" id="u${dutyUsername.id}" data-id="${dutyUsername.id}" data-name="${dutyUsername.user}" onclick="addUser(${dutyUsername.id})">${dutyUsername.user}</div>
										</c:forEach>
									
								</c:otherwise>
							</c:choose>
                           
                            </li>
                           
                        </ul>
                    </div>
                </div>
                <div class="modal-footer" style="text-align:center">
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        关闭
                    </button>
                    <button type="button" class="btn btn-primary" id="saveuser" data-dismiss="modal">
                       确定
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
		</div>
		<!--tackeuid  -->
    	
    	
    	<!-- 模态框（Modal） -->
    	<!-- --------------------------编辑明细----------------------------- -->
    	
	<div class="modal fade " id="myModaledit" tabindex="-1" role="dialog" data-backdrop="false"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel"
						style="text-align: center;">编辑明细</h4>
				</div>
				<div class="modal-body">
					<div class="nav">
						<table class="table table-bordered" id="edittable">
							<input type="hidden" name="id" id="idedit" value="" />
							<tr>
								<td class="info col-md-2 text-right"><span class="red">*</span>单号:</td>

								<td class="col-md-11 "><label class="form-control text-left"
									id="numberedit"></label></td>

							</tr>
							<tr>
								<td class="info col-md-2 text-right"><span class="red">*</span>名称:</td>
								<td class="col-md-11">
								<label id="titleedit1" class="form-control text-left"></label>
								<input type="hidden"
									class="form-control" name="title" id="titleedit" value=""
									maxlength="50" placeholder="请输入名称" autocomplete="off"
									datatype="*1-50" errormsg="至少1个字符,最多50个字符！"></td>
							</tr>
							<tr>
								<td class="info col-md-2 text-right"><span class="red">*</span>价格:</td>
								<td class="col-md-11">
								<label id="priceedit1" class="form-control text-left"></label>
								<input type="hidden" step="0.01"
									class="form-control" name="price" id="priceedit" value=""
									maxlength="50" placeholder="请输入价格" autocomplete="off"
									datatype="*1-50" errormsg="至少1个字符,最多50个字符！"></td>
							</tr>
							<tr>
								<td class="info col-md-2 text-right"><span class="red">*</span>分类:</td>
								<td class="col-md-11"><select name="type" id="typeedit"
									class="form-control">
										<option value="" selected="selected"></option>
										<!--动态从数据库查数据并组合成option  -->
										<%
											for (int i = 0; i < crmNameList.size(); i++) {
										%>
										<option value="<%=crmNameList.get(i).getId()%>">
											<%=crmNameList.get(i).getName()%>
										</option>
										<%
											}
										%>
								</select></td>
							</tr>
							<tr>
								<td class="info col-md-2 text-right"><span class="red">*</span>出货数量:</td>
								<td class="col-md-11"><input type="number"
									class="form-control" name="num" id="numedit" value=""
									maxlength="50" nullmsg="出货数量" placeholder="出货数量"
									autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
								</td>
							</tr>
							<tr>
								<td class="info col-md-2 text-right"><span class="red">*</span>备注:</td>
								<td class="col-md-11">
								<textarea type="text" rows="3"
									class="form-control" name="note" id="noteedit" value=""
									maxlength="300" autocomplete="off" datatype="*1-300"
									errormsg="至少1个字符,最多300个字符！"></textarea>
							</tr>
						</table>
					</div>
				</div>
				<div class="modal-footer" style="text-align: center">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						关闭</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal" id="edit">
						提交</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		</div>
		<!-- /.modal -->
    	
   
   		<script type="text/javascript">
		   	$("#itemtable tbody>tr").click(function() {
			        window.trSeq = $(this).parent().find("tr").index($(this)[0])+1; //所获取的当前行的行号
				 });
			window.priceCount=[];
   			var rows = document.getElementById("itemtable").rows.length-1;
   			console.log(rows);
   			for(var i=0;i<rows;i++)
   			{
   				var count=$("#itemtable tr").eq(i+1).data("count");
   				priceCount.push(count);
   			}
   				//console.log("---"+$("#itemtable tr").eq(i+1).data("count"));
   				console.log(priceCount);
   		</script>
   
    	
    	<script>
    	
    	
    	function editmodal(id){
    		$("#idedit").val(id);
    		$("#numberedit").text($("#number"+id).text());
    		$("#titleedit1").text($("#title"+id).text());
    		$("#titleedit").val($("#title"+id).text());
    		$("#priceedit1").text($("#price"+id).text());
    		$("#priceedit").val($("#price"+id).text());
    		var type=$("#typeedit").val($("#type"+id).data("type"));
    		$("#numedit").val($("#num"+id).text());
    		$("#noteedit").val($("#note"+id).text());
    	}
    	
    	$("#edit").click(function(){
			var key=true;
			if($("#titleedit").val()==""){
				LW.message.show("请输入名称");
				key=false;
				return false;
			}
			if($("#priceedit").val()==""){
				LW.message.show("请输入价格");
				key=false;
				return false;
			}
			if($("#numedit").val()==""){
				LW.message.show("请输入出货数量");
				key=false;
				return false;
			}
			if($("#noteedit").val()==""){
				LW.message.show("请输入备注");
				key=false;
				return false;
			}
			if(key){
				var id=$("#idedit").val();
				console.log("得到的id为:"+id);
				$.ajax({
					url:"manage/crmstockinoroutlogitem/edititem?id="+id,
					data:{
						"number":$("#numberedit").text(),"title":$("#titleedit").val(),
						"price":$("#priceedit").val(),"type":$("#typeedit").val(),
						"num":$("#numedit").val(),"note":$("#noteedit").val()
						
						},
					type:"post",
					error : function() {
					        LW.message.show('提交失败 ');
					    },
				    success : function() {
				    	$("#myModaledit").hide();
				    	$.ajax({
							url:"manage/crmstockinoroutlogitem/getbyid?id="+id,
							type:"post",
							success:function(data){
								 var count=""; 
								 $("#id"+id).html(id);	
								 $("#title"+id).html(data.msg.title);
								 $("#price"+id).html(data.msg.price);
								 $("#type"+id).html(data.msg.crmName.name);
								 $("#pid"+id).html(data.msg.pid);
								 $("#num"+id).html(data.msg.num);
								 $("#inoroutlogno"+id).html(data.msg.inoroutlogno);
								 $("#address"+id).html(data.msg.address);
								 $("#note"+id).html(data.msg.note);
								 count=Number(Number(data.msg.price)*Number(data.msg.num));
								 //count="";
								 console.log("count为："+count);
								 console.log("当前行号为："+trSeq);
								 priceCount[trSeq-1]=count;
								 console.log(priceCount);
								 console.log(priceCount[trSeq-1]);
								 var price="";
								 for(var i=0;i<priceCount.length;i++)
									 {
									 price=Number(price)+Number(priceCount[i]);
									 }
								 console.log("price:"+price);
								 $("#price").val(price);
							}
						});
				    }
				});
			}
    	});
    	
		function del(id){
			var key=true;
			LW.message.confirm("id","您确认要继续删除吗?",function(r){
				if(r)
				{
					$.ajax({
						type:"post",
						url:"manage/crmstockinoroutlogitem/del?id="+id,
						error:function(){
							LW.message.show("删除失败");
						},
						success:function(){
						//	LW.message.show("删除成功");
							$("#s"+id).remove();
							var rows = document.getElementById("itemtable").rows.length;
							console.log("rows:"+rows);
							if(rows<=1){
								result="";
								result+="<div style='text-align: center;'>";
								result+="<p>没有找到数据记录</p>";
								result+="</div>";
								$("#nullitem").html(result);
							}
							var count="";
							 console.log("当前行号为："+trSeq);
							 priceCount[trSeq-1]=count;
							 console.log(priceCount[trSeq-1]);
							 var price="";
							 for(var i=0;i<priceCount.length;i++)
								 {
								 if(priceCount[i] == undefined || priceCount[i] == "")
								   {
									 priceCount.splice(i,1);
								      i = i - 1; // i - 1 ,因为空元素在数组下标 2 位置，删除空之后，后面的元素要向前补位，
								                       // 这样才能真正去掉空元素,觉得这句可以删掉的连续为空试试，然后思考其中逻辑
								    }
								 }
							 for(var i=0;i<priceCount.length;i++)
								 {
								 	price=Number(price)+Number(priceCount[i]);
								 }
							 	 console.log(priceCount);
								 console.log("price:"+price);
								 $("#price").val(price);
						}
					});
				}
			}); 
		 }
		</script>
		
		<!--tackeuid  -->
		<script>
		 function addUser(id) {  
			 $("li").children(".btn-primary").removeClass("btn-primary uid");
			 $("#returnuser").children(".btn-primary").removeClass("btn-primary uid");
            if ($("#u" + id).hasClass("btn-primary")) {
                $("#u" + id).removeClass("btn-primary uid");
            } else {
                $("#u" + id).addClass("btn-primary uid");
            }
        }
		
		$("#saveuser").click(function(){
    				uid="";user="";
    				$(".uid").each(function(){
    					uid+=$(this).data("id")+",";
    					user+=$(this).data("name")+",";
    				});
    				uid=uid.substring(0, uid.length - 1);
        			$("#choose1").html(user.substring(0, user.length - 1));
        			if(user==null ||user==""){
    				$("#choose1").html("请选择人员");
    			}
				$("#takeuid").attr("value", uid);
    			});
		
		function select() {
			var user=$("#user").val();
			if(user!=null &&user!="")
			{
				/* console.log(user); */
				$.ajax({
					url:"manage/crmstockinoroutlogitem/getuser?user="+user,
					type:"post",
					error:function(){
						LW.message.show("查询失败，请重新输入");
					},
					success:function(data){
						var result="";
						if(data.code!=404)
						{  //查询正常
							for(var i=0;i<data.msg.length;i++)
							{
								result+="<div class='btn btn-default' style='margin-left:20px;' id='u"+data.msg[i].id+"' data-id='"+data.msg[i].id+"' data-name='"+data.msg[i].user+"' onclick='addUser("+data.msg[i].id+")'>";
								result+=data.msg[i].user;
								result+="</div>";
							}
						}
						else
						{
							result+="<div style='text-align:center'>";
							result+="未找到数据记录";
							result+="</div>";
							$("#user").click(function(){
								$("#user").val("");
							});
						}
							$("#returnuser").html(result);
							$("#takeuid").val(data.msg.id);
							$("#returnuser").show();
							$("#takeli").remove(); //隐藏li
							
							
					}
				});
			}
		}
		</script>
		
		
			<script type="text/javascript">
	
			//拖动
			$(document).on("show.bs.modal", ".modal", function(){
			    $(this).draggable({
			//handle: ".modal-header"   // 只能点击头部拖动
			    });
			    $(this).css("overflow", "hidden"); // 防止出现滚动条，出现的话，你会把滚动条一起拖着走的
			});
		</script>
			
			
	    	<script type="text/javascript">
			$("#page_traceabilitypoint").parent().attr("class","active");
			$(function(){LW.form.validate("userForm");});
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>