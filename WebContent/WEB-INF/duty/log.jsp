<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.lang.String"%>
<%
	java.util.Date date = new java.util.Date();
	DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	String Fordate = "";
	String Todate = "";
	try {
		Fordate = request.getParameter("Fordate").trim();
		Todate = request.getParameter("Todate").trim();
	} catch (Exception e) {

	}

	if (Fordate == null || Fordate.equals("") || Todate == null || Todate.equals("")) {
		pageContext.setAttribute("Fordate", formatter.format(date));
		pageContext.setAttribute("Todate", formatter.format(date));
	} else {
		pageContext.setAttribute("Fordate", Fordate);
		pageContext.setAttribute("Todate", Todate);
	}

	try {
		pageContext.setAttribute("lotteryid", request.getParameter("lotteryid").trim());
	} catch (Exception e) {

	}

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8;" />
<%@ include file="../tag.jsp"%>
<title>工单进度</title>

<script type="text/javascript">
	$(function() {

		$('#dolog').click(function() {
			window.location.href="duty/dolog/" + $("#id").val()+"/"+$("#uid").val()+".html";
		});
		/* $('#loghistory').click(function() {
			window.location.href="duty/loghistory.html?id=" + $("#id").val();
		}); */
	});
</script>

<style type="text/css">
table thead tr th, table tbody tr td {
	text-align: center;
}
.a{
width:200px; height: 50px; border-right:1px solid #E0E0E0; 
}

.b{
width:800px; height: 50px; line-height: 2.4em;
}
</style>
</head>
<body>
	<%@ include file="../top.jsp"%>
	<%@ include file="../left.jsp"%>
	<input type="hidden" name="id" id="id" value="${duty.id}">
	<input type="hidden" name="uid" id="uid" value="${uid}">
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="<%=basePath%>manage/index.html">首页</a></li>
			<li><a href="<%=basePath%>duty/duty_list.html">工单列表</a></li>
			<li><a onclick="window.history.go(-1);">执行人管理</a></li>
			<li><a href="javascript:void(0);">工单信息描述</a></li>
		</ul>
	</div>
	<div class="rightContainer">
		<button class="btn btn-primary"
			onclick="javascript:window.location.reload()">
			<span class="glyphicon glyphicon-refresh"></span> 刷新
		</button>
		<button type="button" class="btn btn-default" id="dolog">
					<span>录入进度</span>
				</button>
				<!-- <button type="button" class="btn btn-default" id="loghistory">
					<span style="color: red">查看历史录入进度</span>
				</button> -->
		<div class="page-header">
			<h1>
				<small>我的工单描述</small>
			</h1>
		</div>
		<div class="cls"></div>
		<table fit="true" fitColumns="true"
			class="table table-striped table-hover table-bordered">
			<thead>
				<tr>
					<th class="a" style="line-height: 2.4em;">工单编号：</th>
					<td class="b" style="line-height: 2.4em;">${duty.number}</td>
				</tr>
				<tr>
					<th class="a" style="line-height: 2.4em;">工单名称：</th>
					<td class="b" style="line-height: 2.4em;">${duty.title}</td>
				</tr>
				<tr>
					<th class="a" style="line-height: 2.4em;">工单周期：</th>
					<td class="b" style="line-height: 2.4em;"><fmt:formatDate value="${duty.startdate}"
							pattern="yyyy-MM-dd HH:mm:ss" /> 到 <fmt:formatDate
							value="${duty.enddate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				</tr>
				<tr>
					<th class="a" style="line-height: 2.4em;">工单内容：</th>
					<td class="b" style="line-height: 2.4em;">${duty.content}</td>
				</tr>
				
				<tr>
					<th class="a" style="line-height: 2.4em;">工单备注：</th>
					<td class="b" style="line-height: 2.4em;">${duty.note==null?"无":duty.note}</td>
				</tr>
				
				<tr>
					<th class="a" style="line-height: 2.4em;">工单附件：</th>
					<td class="b" style="line-height: 2.4em;">${duty.appendix==null?"无":duty.appendix}</td>
				</tr>

		</table>
		</div>
		<div class="cls"></div>
		<%@ include file="../foot.jsp"%>
</body>
</html>