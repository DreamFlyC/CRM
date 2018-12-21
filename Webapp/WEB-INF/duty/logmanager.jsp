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
<title>历史录入进度</title>

<!-- <script type="text/javascript">
			var url=window.location.href;
			var para=url.split("/");
			LW.message.show(para);
		</script> -->

<style type="text/css">
table thead tr th, table tbody tr td {
	text-align: center;
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
			<li><a href="javascript:void(0);">工单进度</a></li>
		</ul>
	</div>
	<div class="rightContainer">
		<button class="btn btn-primary"
			onclick="javascript:window.location.reload()">
			<span class="glyphicon glyphicon-refresh"></span> 刷新
		</button>
		<div class="cls"></div>
		<div class="panel-heading">
			<h3 class="panel-title" style="font-size: 24px;">
				<b>查看【${duty.user}】工单进度</b> 
			</h3>
		</div>
			<c:set var="sum" value="0"/>
			<c:if test="${duty.dutyUser.size()>0}">
				<c:forEach items="${duty.dutyUser}" var="user" varStatus="status">
					 <c:if test="${status.last}">
					<c:set var="count" value="${status.count}"></c:set> 
				    </c:if>
					<c:set var="sum" value="${(sum+user.dutyLog.progress)}"/>
				</c:forEach>
				<%-- <fmt:formatNumber value="${sum/count>=100?100:sum/count}" pattern="#.#" />% --%>
			</c:if>
			<c:if test="${duty.dutyUser.size()<=0}">
				0%
			</c:if>
		
		<table fit="true" fitColumns="true"
			class="table table-striped table-hover table-bordered">
			<thead>
				<tr>
					<td class="a">完成进度：</td>
					<td class="b">
						<div class="progress">
							<div class="progress progress-striped active">
								<div class="progress-bar progress-bar-success" 
									role="progressbar" aria-valuenow="60" aria-valuemin="0"
									aria-valuemax="100"
									style="width: <fmt:formatNumber value="${sum/count>=100?100:sum/count}" pattern="#.#" />%;">
									<span>已完成<fmt:formatNumber value="${sum/count>=100?100:sum/count}" pattern="#.#" />%</span>
								</div>
							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td class="a">工单周期：</td>
					<td class="b"><fmt:formatDate value="${duty.startdate}"
							pattern="yyyy-MM-dd HH:mm:ss" />&nbsp;到&nbsp;<fmt:formatDate
							value="${duty.enddate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				</tr>

				<tr>
					<td class="a">附件文档：</td>
					<td class="b"></td>
				</tr>
				<tr>
					<td class="a">备注：</td>
					<td class="b">${duty.note}</td>
				</tr>

				<tr>
					<td class="a">工单描述：</td>
					<td class="b">${duty.content}</td>
				</tr>
		</table>
			<div class="panel-heading">
			<h3 class="panel-title" style="font-size: 24px;">
				<b>查看【${duty.user}】执行人信息</b>
			</h3>
		</div>
		<table fit="true" fitColumns="true"
			class="table table-striped table-hover table-bordered">
		<tr>
			<td class="a">执行人</td>
			<td class="a" colspan="2">工单周期</td>
			<td class="a">工单进度</td>
			<td class="a">状态</td>
			<td class="a">操作</td>
		</tr>
		<tbody>
					<c:forEach items="${dutyList}" var="duty">
						<input type="hidden" value="${duty.id}">
						<tr>
							<td class="a">${duty.user}</td>
							<td class="a"><fmt:formatDate value="${duty.startdate}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td class="a"><fmt:formatDate value="${duty.enddate}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td class="a">
<%-- 							${null == duty.dutyLog.progress ? 0: (duty.dutyLog.progress >= 100 ? "100":duty.dutyLog.progress)}%
 --%>							<c:set var="sum" value="0"/>
										<c:if test="${duty.dutyUser.size()>0}">
											<c:forEach items="${duty.dutyUser}" var="user" varStatus="status">
												 <c:if test="${status.last}">
												<c:set var="count" value="${status.count}"></c:set> 
											    </c:if>
												<c:set var="sum" value="${(sum+user.dutyLog.progress)}"/>
											</c:forEach>
											<fmt:formatNumber value="${sum/count>=100?100:sum/count}" pattern="#.#" />%
										</c:if>
										<c:if test="${duty.dutyUser.size()<=0}">
											0%
										</c:if>
							</td>
							<td class="a">${duty.dkey==1?"<span style='color:#0466cb;'>已完成</span>":(duty.dkey==2 ? "进行中":"<span style='color:#EE0000;'>未开始</span>")}</td>
							<td class="a" style="width: 50px"><a
								href="duty/usermanag.html?id=${duty.id}">查看</a></td>
						</tr>
					</c:forEach>
		</tbody>
	</table>
	</div>
		<c:if test="${dutyList.size()<=0}">
		<div style="text-align: center;">
		<p>没有找到数据记录</p>
		</div>
		</c:if>
	<div class="cls"></div>
	<%@ include file="../foot.jsp"%>
</body>
</html>