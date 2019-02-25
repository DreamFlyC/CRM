<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@ page import="java.text.*"%> 
<%
java.util.Date date = new java.util.Date();
DateFormat formatter = new SimpleDateFormat("HH:mm:ss");
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
   pageContext.setAttribute("lotteryid",request.getParameter("lotteryid").trim());
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
		<script src="<%=basePath%>resources/My97DatePicker/WdatePicker.js"></script>
		<title>${appName}_客服账号管理</title>
	</head>
	<body>
		<%@ include file="../top.jsp"%>
   		<%@ include file="../left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li><a href="<%=basePath%>manage/wxkf/index.html">首页</a></li>
	    		<li><a href="<%=basePath%>manage/wxkf.html">客服账号管理</a></li>
	    		<li>编辑客服账号管理</li>
    		</ul>
    	</div>
		<div class="rightContainer">
			<form class="form-horizontal" role="form" method="post" action="<%=basePath%>manage/wxkf/edit.html" id="userForm">
	 		<input type="hidden" name="id" value="${wxkf.id}"/>
				<div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse" data-parent="#accordion" href="#panelInfo">编辑客服账号管理</div>				
				<div id="panelInfo" class="panel-collapse collapse in">
         			<div class="panel-body">
						<table class="table table-bordered">
							<tr>
								<td class="info col-md-1 text-right"><span class="red">*</span>客服账号:</td>
								<td class="col-md-11">
									<input type="text" class="form-control" name="kfaccount" value="${wxkf.kfaccount}" maxlength="50" placeholder="请输入客服账号" autocomplete="off" datatype="*1-50"  nullmsg="请输入客服账号！" errormsg="客服账号至少1个字符,最多50个字符！">
								</td>
							</tr>
							<tr>
								<td class="info col-md-1 text-right"><span class="red">*</span>客服图片url:</td>
								<td class="col-md-11">
									<input type="text" class="form-control" name="kfheadimgurl" value="${wxkf.kfheadimgurl}" maxlength="50" placeholder="请输入客服图片url" autocomplete="off" datatype="*1-50"  nullmsg="请输入客服图片url！" errormsg="客服图片url至少1个字符,最多50个字符！">
								</td>
							</tr>
							<tr>
								<td class="info col-md-1 text-right"><span class="red">*</span>客服id:</td>
								<td class="col-md-11">
									<input type="text" class="form-control" name="kfid" value="${wxkf.kfid}" maxlength="50" placeholder="请输入客服id" autocomplete="off" datatype="*1-50"  nullmsg="请输入客服id！" errormsg="客服id至少1个字符,最多50个字符！">
								</td>
							</tr>
							<tr>
								<td class="info col-md-1 text-right"><span class="red">*</span>客服昵称:</td>
								<td class="col-md-11">
									<input type="text" class="form-control" name="kfnick" value="${wxkf.kfnick}"  maxlength="50" placeholder="请输入客服昵称" autocomplete="off" datatype="*1-50"  nullmsg="请输入客服昵称！" errormsg="客服昵称至少1个字符,最多50个字符！">
								</td>
							</tr>
							<tr>
								<td class="info col-md-1 text-right"><span class="red">*</span>客服微信:</td>
								<td class="col-md-11">
									<input type="text" class="form-control" name="kfwx" value="${wxkf.kfwx}" maxlength="50" placeholder="请输入客服微信" autocomplete="off" datatype="*1-50"  nullmsg="请输入客服微信！" errormsg="客服微信至少1个字符,最多50个字符！">
								</td>
							</tr>
							<tr>
								<td class="info col-md-1 text-right"><span class="red">*</span>nvitewx:</td>
								<td class="col-md-11">
									<input type="text" class="form-control" name="nvitewx" value="${wxkf.nvitewx}" maxlength="50" placeholder="请输入nvitewx" autocomplete="off" datatype="*1-50"  nullmsg="请输入nvitewx！" errormsg="nvitewx至少1个字符,最多50个字符！">
								</td>
							</tr>
							<tr>
								<td class="info col-md-1 text-right"><span class="red">*</span>inviteexpiretime:</td>
								<td class="col-md-11">
									<input type="text" style="text-align: left;" class="form-control" required
										   name="inviteexpiretime" placeholder="请选择邀请过期时间"
										   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
										   value="<fmt:formatDate pattern='yyyy-MM-dd HH:mm:ss' value='${wxkf.inviteexpiretime}' />">
								</td>
							</tr>
							<tr>
								<td class="info col-md-1 text-right"><span class="red">*</span>邀请状态:</td>
								<td class="col-md-11">
									<input type="text" class="form-control" name="invitestatus" value="${wxkf.invitestatus}" maxlength="50" placeholder="请输入邀请状态" autocomplete="off" datatype="*1-50"  nullmsg="请输入邀请状态！" errormsg="邀请状态至少1个字符,最多50个字符！">
								</td>
							</tr>
						</table>
					   <div class="col-md-12 text-center">
					      <button type="submit" class="btn btn-primary btn-lg">保 存</button>
					   </div>
				   </div>
			   </div>
			</form>		
    	</div>
    	<div class="cls"></div>
    	<script type="text/javascript">
			$("#page_wxkf").parent().attr("class","active");
			$(function(){LW.form.validate("userForm");});
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>