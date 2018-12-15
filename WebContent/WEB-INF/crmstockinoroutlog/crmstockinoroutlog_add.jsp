<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@ page import="java.text.*"%>
<%@ page import="java.lang.String"%>  
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.lw.crm.crmname.entity.CrmName" %>
<%@ page import="com.lw.crm.crmstocktype.entity.CrmStockType"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.UUID" %>
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
		<title>${appName}_进进出货记录管理</title>
		<style type="text/css">
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
		</style>
		<script>
			function IsNum(number) {
				//var reNum = /(^\+?|^\d?)\d*\.\d+$/; //正浮点数
				var reNum=/^[0-9]+(.[0-9]{2})?$/;
				return (reNum.test(number));
			}
		function isValid() {
			/* if (!IsNum(form1.price.value)) {
				LW.message.show("单价需为数字,且保留小数点后两位!")
				return false;
			}else{ */
				$("#form1").submit();
				
			//}
		}
	    </script>
		
	</head>
	<body>
		<%@ include file="../top.jsp"%>
   		<%@ include file="../left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li><a href="<%=basePath%>manage/index.html">首页</a></li>
	    		<li><a href="<%=basePath%>manage/crmstockinoroutlog/crmstockinoroutlog_list.html">进出货记录列表</a></li>
	    		<li>进出货记录</li>
    		</ul>
    	</div>
		<div class="rightContainer">
			<form class="form-horizontal" role="form" method="post" action="<%=basePath%>manage/crmstockinoroutlog/post.html" id="form1" name="form1" >
				<div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse" data-parent="#accordion" href="#panelInfo">新增进出货记录</div>				
				<div id="panelInfo" class="panel-collapse collapse in">
         			<div class="panel-body">
						<table class="table table-bordered">
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>单号:</td>
								<%
					            SimpleDateFormat sdf=new SimpleDateFormat("YYYYMMddhhmm");
					            Date now=new Date();
					            int random=(int)(Math.random()*10000+1);
					            String number=sdf.format(now)+random;
					            %>
						    	<td class="col-md-11"><label class="form-control"><%=number %></label></td>
						    	 <input type="hidden" name="number" id="number" value="<%=number %>">
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>名称:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="title" id="title"  value="" maxlength="50" nullmsg="名称不能为空" placeholder="请输入名称" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>总金额:</td>
						    	<td class="col-md-11">
						    		<input type="number" class="form-control" name="price" id="price"  value="" 
						    		maxlength="50" placeholder="请输入总金额" autocomplete="off" nullmsg="总金额不能为空" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    <tr>
							    <td class="info col-md-1 text-right"><span class="red">*</span>类型:</td>
							     <td class="col-md-11"><select name="type"
									class="form-control {required:true}">
										<option value="" selected="selected">请选择类型</option>
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
						    	<td class="info col-md-1 text-right"><span class="red">*</span>领取人员:</td>
						    	<td class="col-md-11">
						    		<label id="choose1" class="form-control" style="text-align: left;" data-toggle="modal" data-target="#myModaltakeuid">请选择人员</label>
									<input type="hidden" name="takeuid" id="takeuid"  value=""  >
								</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>地址:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="address" id="address"  value="" maxlength="300" autocomplete="off" datatype="*1-300" errormsg="至少1个字符,最多300个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>备注:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="note" id="note"  value="" maxlength="300" autocomplete="off" datatype="*1-300" errormsg="至少1个字符,最多300个字符！">
						    	</td>
						    </tr>
					    </table> 
					    <div class="alert alert-warning alert-dismissible" role="alert" style="display:none;" id="alert">
				            <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				            <strong>系统提示</strong> <span id="savemsg"></span>
				        </div><br />   			
					   <div class="col-md-12 text-center">
					      <button type="button" class="btn btn-primary btn-lg" onclick="isValid(this);">保 存</button>
					   </div>
				   </div>
			   	</div>
			</form>		
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
    	<div class="cls"></div>
    	<script type="text/javascript">
			$("#page_crmstockinoroutlog_list").parent().attr("class","active");
			$(function(){LW.form.validate("form1");});
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>