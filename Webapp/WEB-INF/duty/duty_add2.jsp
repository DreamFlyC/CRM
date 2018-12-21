<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@ page import="java.text.*"%>
<%@ page import="java.lang.String"%>  
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.UUID" %>

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
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<%@ include file="../tag.jsp" %>
		<link rel="stylesheet" href="<%=basePath%>resources/ztree/zTreeStyle.css" type="text/css">
		<script src="<%=basePath %>resources/plugin/kindeditor/kindeditor-min.js"></script>
		<script src="<%=basePath %>resources/plugin/ajaxupload/ajaxfileupload.js"></script>
		<script type="text/javascript" src="<%=basePath%>resources/ztree/jquery.ztree.all-3.5.min.js"></script>
		<script src="<%=basePath%>resources/duty/js/type.js" type="text/javascript"></script>
		<title></title>
		<style>
			.btn{
				margin:10px;
				width:90px;
				height:35px;
			}
			.modal-footer .btn+.btn {
				 margin-bottom: 10px; 
				/* margin-left: 5px; */
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
	    		<li><a href="<%=basePath%>duty/duty_list.html">工单列表</a></li>
				<li><a href="javascript:void(0);">新建工单</a></li>
    		</ul>
    	</div>
		<div class="rightContainer">
		<script src="<%=basePath%>resources/duty/js/My97DatePicker/WdatePicker.js"></script>
			<form class="form-horizontal" role="form" method="post" action="<%=basePath%>duty/save" id="form1" name="form1" >
				<input type="hidden" name="ids" id="ids">
			 	<input type="hidden" name="users" id="users">
			 	<input type="hidden" name="groupid" id="groupid" />

				<div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse" data-parent="#accordion" href="#panelInfo">新增基本信息</div>			
				<div id="panelInfo" class="panel-collapse collapse in">
         			<div class="panel-body">
						<table class="table table-bordered">
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>工单编号:</td>
								<%
									SimpleDateFormat sdf = new SimpleDateFormat("YYYYMMddhhmm");
									Date now = new Date();
									int random = (int) (Math.random() * 10000 + 1);
									String number = sdf.format(now) + random;
								%>
						    	<td class="col-md-11"><label style="font-size: 16px;"><%=number %></label></td>
						    	 <input type="hidden" name="number" id="number" value="<%=number %>">
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>标题:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="title" id="title" required value="" value="" maxlength="50" placeholder="请输入名称" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>优先度:</td>
						    	<td class="col-md-11">
						    	<select name="level" id="level" class="form-control">
						    		<option value="1" selected="selected">普通</option>
						    		<option value="2">紧急</option>
						    	</select>
						    	</td>
						    </tr>

					        <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>执行部门:</td>
						    	<td class="col-md-11">
						    	   	<label id="choosedepart1"  class="form-control" style="text-align:left;" data-toggle="modal" data-target="#myModal">请选择部门</label> 
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>执行人员:</td>
						    	<td class="col-md-11">
								
						    	<label id="choose1" class="form-control" style="text-align: left;" data-toggle="modal" data-target="#myModalUser">请选择执行人</label>
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>开始时间:</td>
						    	<td class="col-md-11">
						    	<input type="text" name="startdate" id="sdate" style="text-align: left;"
									placeholder="请选择开始时间" autocomplete="off"
									onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" onchange=""
									class="form-control" required />
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>结束时间:</td>
						    	<td class="col-md-11">
								<input type="text" name="enddate" id="edate" style="text-align: left;"
									placeholder="请选择结束时间" autocomplete="off"
									onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" onchange=""
									class="form-control" required />						    	</td>
						    </tr>
						   
							<tr>
						    	<td class="info col-md-1 text-right">详细描述:</td>
						    	<td class="col-md-11">
								<textarea row="50" col="5" name="content"
									style="width: 100%; height: 200px; text-align: left;"
									placeholder="请填写描述。。。" class="form-control" ></textarea>
						    	
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right">状态:</td>
						    	<td class="col-md-11">
						    		<input type="radio" value="3" name="dkey" checked="checked" />未开始
						    	</td>
						    </tr>
						   <tr>
						    	<td class="info col-md-1 text-right">附件文档:</td>
						    	<td class="col-md-11">
						    	        <input type="file" name="file" id="titleFile" style="display:none" onchange="LW.util.uploadFile(this)">
			<img id="titleFilebig" src="<%=basePath%>resources/images/no_file.gif" width="145" height="136" style="cursor:pointer" onclick="$('#titleFile').click()">

			<input type="hidden" name="appendix" id="titleFilePath" value="">
						    	</td>


						    </tr> 
						   <tr>
						    	<td class="info col-md-1 text-right">问题类型(可填):</td>
						    	<td class="col-md-11">
						    	<select	name="type" class="form-control" id="tstype"></select>
						    	</td>
						    </tr>
					    </table> 
					    <div class="alert alert-warning alert-dismissible" role="alert" style="display:none;" id="alert">
				            <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				            <strong>系统提示</strong> <span id="savemsg"></span>
				        </div><br />   			
					   <div class="col-md-12 text-center">
					      <button type="button" class="btn btn-primary btn-lg" style="line-height: 10px;" onclick="isValid(this);">保 存</button>
					   </div>
				   </div>
			   	</div>
			</form>		
    	</div>

	 <div class="modal fade " id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel" style="text-align:center;font-weight: bold;">
                        添加执行部门
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="nav">
                        <ul>
                            <li>
							<c:choose>
								<c:when test="${shiroActionUsersGroupList.size() <=0}">
									<p>没有找到数据记录</p>
								</c:when>

								<c:otherwise>
									<c:forEach items="${shiroActionUsersGroupList}" var="dutyUsersGroup">
										
											 <div class="btn btn-default" data-id="${dutyUsersGroup.id}" data-name="${dutyUsersGroup.name}" id="s${dutyUsersGroup.id}" onclick="addClass(${dutyUsersGroup.id})">${dutyUsersGroup.name}</div>
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
                    <button type="button" class="btn btn-primary" id="savedepart" data-dismiss="modal">
                       确定
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
    
     <div class="modal fade " id="myModalUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabelUser" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabelUser" style="text-align:center;font-weight: bold;">
                        添加执行人
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="nav">
                        <ul>
                            <li class="sdv">
                           	 	<div id="showuser" class="showuser"></div>
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
            </div>
        </div>
        
    </div>
	

	</div>
    	<div class="cls"></div>
		
	<script>
        function addClass(id) {  
			//$("li").children(".btn-primary").removeClass("btn-primary sid");
            if ($("#s" + id).hasClass("btn-primary")) {
                $("#s" + id).removeClass("btn-primary sid");
            } else {
                $("#s" + id).addClass("btn-primary sid");
            }
        }
        
        function addUser(id) {  
            if ($("#u" + id).hasClass("btn-primary")) {
                $("#u" + id).removeClass("btn-primary uid");
            } else {
                $("#u" + id).addClass("btn-primary uid");
            }
        }
        $(function() {
    		var departId="";
			$("#savedepart").click(function() {
				departId="";departName = "";
    			$(".sid").each(function(){
    				departId+=$(this).attr("id").substr(1)+",";
    				departName+=$(this).data("name")+",";	
				});
					/* console.log(departId);
    				console.log(departName); */
    			departId=departId.substring(0, departId.length - 1);
    			$("#choosedepart1").html(departName.substring(0, departName.length - 1));
    			if(departName==null ||departName==""){
    				$("#choosedepart1").html("请选择部门");
    			}
    			$("#choose1").html("请选择执行人");
				$.get("<%=basePath %>duty/getuser?ids="+ departId,function(data){	
					var temp="";					
					for(var m=0;m<departId.split(',').length;m++)
					{						
						temp+="<p style='text-align:center;font-size:20px;font-weight:bold;'>";
						temp+=departName.split(',')[m];
						temp+="</p>";
						for(var k=0;k<data.msg.length;k++)
						{
							if(data.msg[k].groupid==departId.split(',')[m])
							{
								temp+="<div class=\"btn btn-default\" onclick=\"addUser("+data.msg[k].id+")\" id='u"+data.msg[k].id+"' data-id='"+data.msg[k].id+"' data-name='"+data.msg[k].user+"'>";	
								temp+=data.msg[k].user;
								temp+="</div>";
							}
						}				
					}
					$(".showuser").html(temp);
				});
			});
				
    		
    			$("#saveuser").click(function(){
    				uid="";user="";
    				$(".uid").each(function(){
    					uid+=$(this).data("id")+",";
    					user+=$(this).data("name")+",";
    				});
    				uid=uid.substring(0, uid.length - 1);
        			$("#choose1").html(user.substring(0, user.length - 1));
        			if(user==null ||user==""){
    				$("#choose1").html("请选择执行人");
    			}
    			});
    		
    		  $("#choose1").click(function() {
    			if(departId==null ||departId==''){
					var result="";
					result+="<div style='text-align:center;font-size: 20px;color:red;'>";
					result+="请先选择部门";
					result+="</div>";
    				$(".showuser").html(result);
    			}
    		}); 
    		
    		$("#close").click(function(){
    			$("#dv").hide();
    		})
       	 });
    </script>
	
	
	<script type="text/javascript">
	function isValid() {
		var ids = "";
		var name = "";
		$(".uid").each(function() {
				ids += $(this).data("id") + ",";
				name += $(this).data("name") + ",";
			//console.log(ids+"------------"+name);
		});
		$("#ids").attr("value", ids.substring(0, ids.length - 1));
		$("#users").attr("value", name.substring(0, name.length - 1));
		
		var groupid="";
		$(".sid").each(function() {
				groupid += $(this).data("id") + ",";
		});
		if(groupid!="")
		{
			$("#groupid").attr("value", groupid.substring(0, groupid.length - 1));
		}
		//alert("ids="+$("#ids").val()+"---users="+$("#users").val()+"---groupids="+$("#groupid").val());
		var key=true;
		 if (form1.title.value == "") {
			LW.message.show("工单名称不能为空");
			form1.title.select();
			key=false;
			return false;
		} 
		if(groupid==""){
			LW.message.show("请选择部门");
			form1.title.select();
			key=false;
		}
		 if (form1.level.value == 0) {
			LW.message.show("工单级别不能为空");
			form1.level.select();
			key=false;
			return false;
		}
		if (form1.startdate.value == "") {
			LW.message.show("工单开始时间不能为空");
			form1.startdate.select();
			key=false;
			return false;
		}
		if (form1.enddate.value == "") {
			LW.message.show("工单结束时间不能为空");
			form1.enddate.select();
			key=false;
			return false;
		}
		if (form1.content.value == "") {
			LW.message.show("工单描述不能为空");
			form1.content.select();
			key=false;
			return false;
		}
		if (form1.dkey.value == "") {
			LW.message.show("工单状态不能为空");
			form1.deky.select();
			key=false;
			return false;
		}
		if ($("#edate").val() < $("#sdate").val()) {
			LW.message.show("日期不合法，请重新选择日期!");
			form1.edate.select();
			key=false;
			return false;
		}
		if(key){
			$("#form1").submit();
		} 
	}
	</script>
		
		<script type="text/javascript">
			$("#page_duty_list").parent().attr("class","active");
			$("#page_duty_list").parent().parent().parent().parent().addClass("in");
			$(function(){LW.form.validate("form1");});
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>