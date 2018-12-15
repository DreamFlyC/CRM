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
		<%@ include file="../tag.jsp" %>
		<title>编辑工单信息</title>
	<style>
			  ul {
            list-style: none;
            padding:0px;
        }

            ul li .btn {
                margin: 10px;
               
                height: 35px;
               
            }
			
			ul li p{
				 text-align:center;
				 font-family:Microsoft YaHei;
				 font-size:16px;
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
				<li><a href="javascript:void(0);">编辑工单</a></li>
    		</ul>
    	</div>
		<div class="rightContainer">
<script src="/resources/My97DatePicker/WdatePicker.js"></script>
			<form role="form" method="post" action="<%=basePath%>duty/edit_detail_duty" id="form1"
			class="form-horizontal" enctype="multipart/form-data">
				<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
				<input type="hidden" name="id" value="${duty.id}">
				<div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse" data-parent="#accordion" href="#panelInfo">编辑基本信息</div>				
				<div id="panelInfo" class="panel-collapse collapse in">
         			<div class="panel-body">
						<table class="table table-bordered">
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>工单编号:</td>
						    	<td class="col-md-11"><label style="font-size: 16px;">${duty.number}</label></td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>标题:</td>
						    	<td class="col-md-11">
								<input
									class="form-control"  style="text-align: left;" type="text" name="title" id="title"
									value="${duty.title}" />
						    	 	
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>受理工单级别:</td>
						    	<td class="col-md-11">
						    	<select name="level" id="level" class="form-control">
						    		<option value="${duty.level}" selected="selected">${duty.level==1?"普通":(duty.level==2?"紧急":"无")}</option>
						    		<option value="1">普通</option>
						    		<option value="2">紧急</option>
						    	</select>
						    	</td>
 
						    </tr>

					              <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>执行部门:</td>
						    	<td class="col-md-11" style="font-size:14px;">
								  	<label class="form-control" style="border:0px;">
										<c:forEach items="${duty.usersgroupitemList}" var="subItem">
										 ${subItem.name}
										</c:forEach>
									  </label>
						    	</td>
						    </tr>

						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>执行人员:</td>
						    	<td class="col-md-11">

								<label id="choose1" class="form-control" style="text-align: left;" data-toggle="modal" data-target="#myModal" >
								<c:choose>
								<c:when test="${duty.uid eq '' }">请选择执行人</c:when>
								<c:otherwise>${duty.user}</c:otherwise>
								</c:choose>
								</label>
								<input type="hidden" name="ids" id="ids">
								<input type="hidden" name="users" id="users" >
								<input type="hidden" id="olduserid" name="olduserid" value="${duty.uid}"/>						    	
								</td>
						    </tr>

						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>开始时间:</td>
						    	<td class="col-md-11">
						    	<input
									class="form-control" style="  text-align: left;" type="text" name="startdate" id="startdate" autocomplete="off"
									onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss '})"
									value="<fmt:formatDate value='${duty.startdate}' pattern='yyyy-MM-dd HH:mm:ss' />">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>结束时间:</td>
						    	<td class="col-md-11">
								 <input
									class="form-control" style="  text-align: left;" type="text" name="enddate" id="enddate" autocomplete="off"
									onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss '})"
									value="<fmt:formatDate value='${duty.enddate}' pattern='yyyy-MM-dd HH:mm:ss' />">						    	</td>
						    </tr>
					    	<tr>
						    	<td class="info col-md-1 text-right">备注:</td>
						    	<td class="col-md-11">
						    	<input
									class="form-control"  style="text-align: left;" type="text" name="note" id="note"
									value="${duty.note}">
						    	</td>
						    </tr>
						      <tr>
						    	<td class="info col-md-1 text-right">附件文档:</td>
						    	<td class="col-md-11">
								<c:if test="${duty.appendix==null || duty.appendix==''}">
									<input type="file" name="file" id="titleFile" style="display:none" onchange="LW.util.uploadFile(this)">
									<img id="titleFilebig" src="<%=basePath%>resources/images/no_file.gif" width="145" height="136" style="cursor:pointer" onclick="$('#titleFile').click()">
								</c:if>
								
								${duty.appendix}
						    	</td>
						    </tr> 
						
						    <tr>
						    	<td class="info col-md-1 text-right">状态:</td>
						    	<td class="col-md-11">
						    	<label
									class="form-control" style="  text-align: left;">${duty.dkey==1?"<span style='color:#0466cb;'>已完成</span>":(duty.dkey==2 ? "<span style='color:#09b4f9'>进行中</span>":"<span style='color:#EE0000;'>未接受</span>")}</label>
						    	</td>
						    </tr>
						   <!--  <tr>
						    	<td class="info col-md-1 text-right">问题类型(可填):</td>
						    	<td class="col-md-11">
						    	<select	name="type" class="form-control" id="tstype"></select>
						    	</td>
						    </tr> -->
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
    	<div class="cls"></div>
    	<%@ include file="../foot.jsp"%>
		
		<!-- modal begin -->
		<div class="modal fade " id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabelUser" aria-hidden="true">
		 <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel" style="text-align:center;font-weight: bold;">
                        修改执行人员
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="nav groupname" style="width:auto;height:300px;overflow:auto;">
                        <ul>
                            <li>
							<c:choose>
								<c:when test="${shiroActionUsersGroupList.size() <=0}">
									<p>没有找到数据记录</p>
								</c:when>

								<c:otherwise>
									<c:forEach items="${shiroActionUsersGroupList}" var="dutyUsersGroup">
									
										<c:if test="${dutyUsernameList.size()>0}">
											<p data-id="${dutyUsersGroup.id}" data-name="${dutyUsersGroup.name}" id="s${dutyUsersGroup.id}">
												${dutyUsersGroup.name}
											</p>
										</c:if>
									
										<c:forEach items="${dutyUsernameList}" var="dutyUsername">
											
											<c:if test="${dutyUsersGroup.id==dutyUsername.groupid}">
												<div class="btn btn-default" id="u${dutyUsername.id}" 
													data-id="${dutyUsername.id}" data-name="${dutyUsername.user}"
													<c:forEach items="${dutyUserList}" var="dutyUser">
													data-length="${dutyUserList.size()}"
														<c:if test="${dutyUser.userid==dutyUsername.id}">
															<c:if test="${dutyUser.dkey!=3}">
																disabled="disabled"
															</c:if>
														</c:if>
													</c:forEach>
													onclick="addUser(${dutyUsername.id})">${dutyUsername.user}
												</div>
											</c:if>
										</c:forEach>
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
		
		
		<script>
		var fboo=true;// di yi ci dianji
		$(function ()
		{
			{
				if(fboo)
				{				
					var uid=$("#olduserid").val();		
					for(var i=0;i<uid.split(',').length;i++)
					{
						if(uid.split(',')[i]!="")
						{	
							$(".modal-body .nav ul li .btn-default").each(function(){
								if(uid.split(',')[i]==$(this).data("id"))
								{
								  $("#u" + uid.split(',')[i]).addClass("btn-primary uid");
								}
							});
						}
					}
				}
			}
		});
		 function addUser(id) { 
			// $("li").children(".btn-primary").removeClass("btn-primary uid");
            if ($("#u" + id).hasClass("btn-primary")) {
                $("#u" + id).removeClass("btn-primary uid");
            } else {
                $("#u" + id).addClass("btn-primary ");
            }
        }
		
		$("#saveuser").click(function(){
				$(".groupname .btn-primary").each(function(){
					$(this).addClass("uid");
				});
				fboo=false;		
    				uid="";user="";
    				$(".uid").each(function(){
    					uid+=$(this).data("id")+",";
    					user+=$(this).data("name")+",";
    				});
    				uid=uid.substring(0, uid.length - 1);
        			$("#choose1").html(user.substring(0, user.length - 1));
					console.log("uid:"+uid);
        			if(user==null ||user==""){
    				$("#choose1").html("请选择执行人");
    			}
				
    			});
		</script>
		
<script type="text/javascript">
	function isValid() {
		var ids = "";
		var name = "";
		$(".uid").each(function() {
			ids += $(this).data("id") + ",";
			name += $(this).data("name") + ",";
			console.log(ids+"------------"+name);
		});
		
		$("#ids").attr("value", ids.substring(0, ids.length - 1));
		$("#users").attr("value", name.substring(0, name.length - 1));

		var key=true;
		 if (form1.title.value == "") {
			LW.message.show("工单名称不能为空");
			form1.title.select();
			key=false;
			return false;
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
		if($("#choose1").text()=="请选择执行人"){
			LW.message.show("请选择执行人");
			key=false;
			return false;
		}
		if ($("#enddate").val() < $("#startdate").val()) {
			LW.message.show("日期不合法，请重新选择日期!");
			form1.enddate.select();
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
		</script> 
	</body>
</html>