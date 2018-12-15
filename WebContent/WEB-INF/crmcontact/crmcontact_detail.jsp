<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@ page import="java.text.*"%>
<%@ page import="java.lang.String"%>  
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
		<title>${appName}_客户信息管理</title>
	</head>
	<body>
		<%@ include file="../top.jsp"%>
   		<%@ include file="../left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li><a href="<%=basePath%>manage/index.html">首页</a></li>
    			<li><a href="<%=basePath%>manage/crmcontact/crmcontact_list.html">客户信息列表</a></li>
	    		<li>添加客户信息</li>
    		</ul>
    	</div>
		<div class="rightContainer">
<script src="/resources/My97DatePicker/WdatePicker.js"></script>
			<form class="form-horizontal" role="form" method="post" action="<%=basePath%>manage/crmcontact/edit.html" id="userForm">
				<input type="hidden" name="id" value="${crmContact.id}"  />
				<div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse" data-parent="#accordion" href="#panelInfo">客户信息</div>				
				<div id="panelInfo" class="panel-collapse collapse in">
         			<div class="panel-body">
						<table class="table table-bordered">
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>客户名称:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="name" value="${crmContact.name}" maxlength="50" nullmsg="请输入客户名称" placeholder="请输入客户名称" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>cid:</td>
						    	<td class="col-md-11">
						    		<input type="number" class="form-control" name="cid" value="${crmContact.cid}" maxlength="50" nullmsg="cid" placeholder="cid" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						   
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>type:</td>
						    	<td class="col-md-11">
						    		<input type="number" class="form-control" name="type" value="${crmContact.type}" maxlength="50" nullmsg="type" placeholder="type" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>uid:</td>
						    	<td class="col-md-11">
						    		<input type="number" class="form-control" name="uid" value="${crmContact.uid}" maxlength="50" nullmsg="cid" placeholder="uid" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>type1:</td>
						    	<td class="col-md-11">
						    		<input type="number" class="form-control" name="type1" value="${crmContact.type1}" maxlength="50" nullmsg="type1" placeholder="type1" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>gender:</td>
						    	<td class="col-md-11">
						    		<input type="radio" name="gender" value="1" />男
						    		<input type="radio" name="gender" value="2" />女
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>手机号码:</td>
						    	<td class="col-md-11">
						    		<input type="number" class="form-control" name="tel" value="${crmContact.tel}" maxlength="50" nullmsg="tel" placeholder="tel" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>QQ:</td>
						    	<td class="col-md-11">
						    		<input type="number" class="form-control" name="qq" value="${crmContact.qq}" maxlength="50" nullmsg="qq" placeholder="qq" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>微信:</td>
						    	<td class="col-md-11">
						    		<input type="number" class="form-control" name="wechat" value="${crmContact.wechat}" maxlength="50" nullmsg="wechat" placeholder="wechat" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>地址:</td>
						    	<td class="col-md-11">
						    		<input type="number" class="form-control" name="address" value="${crmContact.address}" maxlength="50" nullmsg="address" placeholder="address" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>邮箱:</td>
						    	<td class="col-md-11">
						    		<input type="number" class="form-control" name="mail" value="${crmContact.mail}" maxlength="50" nullmsg="mail" placeholder="mail" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
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
			$("#page_crmcontact_list").parent().attr("class","active");
			$(function(){LW.form.validate("userForm");});
			
			$("input:radio[name='gender'][value='${crmContact.gender}']").attr('checked','true');
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>