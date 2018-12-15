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
		<title>查看工单详情</title>
	</head>
	<body>
		<%@ include file="../top.jsp"%>
   		<%@ include file="../left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li><a href="<%=basePath%>manage/index.html">首页</a></li>
	    		<li><a href="<%=basePath%>duty/duty_list.html">工单列表</a></li>
				<li><a href="javascript:void(0);">工单详情</a></li>
				
    		</ul>
    	</div>
		<div class="rightContainer">
			<form class="form-horizontal">
				<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
				<div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse" data-parent="#accordion" href="#panelInfo">工单详情</div>				
				<div id="panelInfo" class="panel-collapse collapse in">
         			<div class="panel-body">
						<table class="table table-bordered">
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>工单编号:</td>
						    	<td class="col-md-11"><label style="font-size: 16px;">${duty.number}</label></td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>工单名称:</td>
						    	<td class="col-md-11">
						    	 	<label class="form-control" style="  text-align: left;">${duty.title}</label>
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>受理工单级别:</td>
						    	<td class="col-md-11">
						    	<label class="form-control" style="  text-align: left;">${duty.level==1?"普通":(duty.level==2?"紧急":"无")}</label>
						    	
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>执行部门:</td>
						    	<td class="col-md-11">
						    		<label class="form-control" style="  text-align: left;">
						    			<c:forEach items="${duty.dutyDepart}" var="depart">
											${depart.depart}
										</c:forEach>
						    		</label>
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>执行人员:</td>
						    	<td class="col-md-11">
						    		<label id="choose" class="form-control" style="  text-align: left;" placeholder="请选择执行人" />${duty.user}</label>
						    		<input type="hidden" id="userids" value="${duty.uid}"/>
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>开始时间:</td>
						    	<td class="col-md-11">
						    	<label class="form-control" style="  text-align: left;"><fmt:formatDate value="${duty.startdate}" pattern="yyyy-MM-dd HH:mm:ss" /></label>
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>结束时间:</td>
						    	<td class="col-md-11">
						    	<label class="form-control" style="  text-align: left;"><fmt:formatDate value="${duty.enddate}" pattern="yyyy-MM-dd HH:mm:ss" /></label>
						    	</td>
						    	
						    </tr>
					    	<tr>
						    	<td class="info col-md-1 text-right">备注:</td>
						    	<td class="col-md-11">
						    	<label class="form-control" style="  text-align: left;">${duty.note}</label>
						    	</td>
						    </tr>
						      <tr>
						    	<td class="info col-md-1 text-right">附件文档:</td>
						    	<td class="col-md-11">
						    	<label class="form-control" style="  text-align: left;">${duty.appendix==null?"无":duty.appendix}</label>
						    	</td>
						    </tr> 
						
						    <tr>
						    	<td class="info col-md-1 text-right">状态:</td>
						    	<td class="col-md-11">
						    	<label
									class="form-control" style="  text-align: left;">${duty.dkey==1?"<span style='color:#e91ca7;'>已完成</span>":(duty.dkey==2 ? "<span style='color:#09b4f9;'>进行中</span>":"<span style='color:#EE0000;'>未接受</span>")}</label>
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
				   </div>
			   	</div>
			</form>		
    	</div>
    	
    	<div class="cls"></div>
    	<%@ include file="../foot.jsp"%>
    	
	</body>
</html>