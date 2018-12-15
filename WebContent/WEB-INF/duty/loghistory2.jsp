<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@ page import="java.text.*"%>
<%@ page import="java.lang.String"%>   
<%
java.util.Date date = new java.util.Date();
DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
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
		<title>历史录入进度</title>
		
		<!-- <script type="text/javascript">
			var url=window.location.href;
			var para=url.split("/");
			LW.message.show(para);
		</script> -->
		
		<style type="text/css">
			table thead tr th,table tbody tr td{
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
	    		<li><a onclick="javscript:window.history.go(-1);">执行人管理</a></li>
	    		<li><a href="javascript:void(0);">历史录入详情</a></li>
    		</ul>
    	</div>
		<div class="rightContainer">
				<button class="btn btn-primary" onclick="javascript:window.location.reload()">
					<span class="glyphicon glyphicon-refresh"></span> 刷新
				</button>
				<button class="btn btn-primary" onclick="javscript:window.history.go(-1);">
					<span class="glyphicon glyphicon-arrow-left"></span> 返回
				</button>
			<div class="cls"></div>
			<table fit="true" fitColumns="true" class="table table-striped table-hover table-bordered">
				<thead>
					<tr>
						<!-- <th class="a">ID</th> -->
						<th class="a">序号</th>
						<th class="a">工单ID</th>
						<th class="a">工单名称</th>
						<th class="a">工单执行人</th>
						<th class="a">工单内容</th>
						<th class="a">历史录入进度</th>
						<th class="a">附件</th>
						<th class="a">备注</th>
						<th class="a">时间</th>
						<th class="a">用户ID</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
					<c:when test="${dutyLogList.size() >0}">
						<c:forEach items="${dutyLogList}" var="dutyLog" varStatus="i">
							<input type="hidden" value="${dutyLog.id}">
							<tr>
								<!--  <td class="a">${dutyLog.id}</td>-->
								<td class="a">${i.index+1}</td>
								<td class="a">${dutyLog.dutyid}</td>
								<td class="a">${dutyLog.duty.title}</td>
								<td class="a">${dutyLog.duty.user}</td>
								<td class="a">${dutyLog.content}</td>
								<td class="a">${dutyLog.progress}%</td>
								<td class="a">${dutyLog.appendix==null||dutyLog.appendix==''?"无":dutyLog.appendix}</td>
								<td class="a">${dutyLog.note==null||dutyLog.note==''?"无":dutyLog.note}</td>
								<td class="a"><fmt:formatDate value="${dutyLog.date}"
										pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td class="a">${dutyLog.uid}</td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>
				</tbody>
			</table>
			<c:if test="${dutyLogList.size()<=0}">
				<div style="text-align: center;">
				<p>没有找到数据记录</p>
				</div>
			</c:if>
    	
    	<%-- <nav>
			<span>当前${pager.pageNo}/${pager.totalPage}
				共${pager.totalCount}条数据</span>
			<div class="btn-group pull-right" role="group">
				<a href="<%=basePath%>duty/duty_list.html" class="btn btn-default">首页</a>
				<a href="<%=basePath%>duty/duty_list.html?pageNo=${pager.prePage}"
					class="btn btn-default">上一页</a> <a
					href="<%=basePath%>duty/duty_list.html?pageNo=${pager.nextPage}"
					class="btn btn-default">下一页</a> <a
					href="<%=basePath%>duty/duty_list.html?pageNo=${pager.totalPage}"
					class="btn btn-default">尾页</a>
			</div>
		</nav> --%>
		</div>
    	<div class="cls"></div>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>