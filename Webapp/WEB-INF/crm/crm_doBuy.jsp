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
		<title>${appName}_产品历史出货详情管理</title>
	</head>
	<body>
		<%@ include file="../top.jsp"%>
   		<%@ include file="../left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li><a href="<%=basePath%>manage/index.html">首页</a></li>
	    		<li><a href="<%=basePath%>manage/crm/crm_list.html">库存列表</a></li>
	    		<li><a onclick="javscript:window.history.go(-1);">产品出货</a></li>
	    		<li><a href="javascript:void(0);">确认信息</a></li>
    		</ul>
    	</div>
		<div class="rightContainer">
				<button class="btn btn-primary" onclick="javascript:window.location.reload()">
					<span class="glyphicon glyphicon-refresh"></span> 刷新
				</button>
				<button class="btn btn-primary" onclick="javascript:window.location.href='manage/crm/crm_list.html'">
					<span class="glyphicon glyphicon-refresh"></span> 返回
				</button>
			<div class="cls"></div>
			<table fit="true" fitColumns="true" class="table table-striped table-hover table-bordered">
				<thead>
					<tr>
						<th class="a">ID</th>
						<th class="a">产品ID</th>
						<th class="a">产品编号</th>
						<th class="a">产品名称</th>
						<th class="a">产品价格</th>
						<th class="a">产品类型</th>
						<th class="a">出货数量</th>
						<th class="a">总价</th>
						<th class="a">出货日期</th>
						<th class="a">用户ID</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
					<c:when test="${crmBuyInfoList.size() >0}">
						<c:forEach items="${crmBuyInfoList}" var="crmBuyInfoList" varStatus="i">
							<input type="hidden" value="${crmBuyInfoList.id}">
							<tr>
								<td class="a">${crmBuyInfoList.id}</td>
								<td class="a">${crmBuyInfoList.pid}</td>
								<td class="a">${crmBuyInfoList.number}</td>
								<td class="a">${crmBuyInfoList.title}</td>
								<td class="a">${crmBuyInfoList.crmProduct.price}</td>
								<td class="a">${crmBuyInfoList.type}</td>
								<td class="a">${crmBuyInfoList.stock}</td>
								<td class="a">${crmBuyInfoList.stock*crmBuyInfoList.price}</td>
								<td class="a"><fmt:formatDate value="${crmBuyInfoList.date}"
										pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td class="a">${crmBuyInfoList.uid}</td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>
				</tbody>
			</table>
			<c:if test="${crmBuyInfoListList.size()<=0}">
				<div style="text-align: center;">
				<p>没有找到数据记录</p>
				</div>
			</c:if>
			<nav>
				<span>当前${pager.pageNo}/${pager.totalPage} 共${pager.totalCount}条数据</span>
				 <div class="btn-group pull-right" role="group">
			      	<a href="<%=basePath%>manage/crm/crm_history.html" class="btn btn-default">首页</a>
			      	<a href="<%=basePath%>manage/crm/crm_history?pageNo=${pager.prePage}" class="btn btn-default">上一页</a>
			      	<a href="<%=basePath%>manage/crm/crm_history?pageNo=${pager.nextPage}" class="btn btn-default">下一页</a>
			      	<a href="<%=basePath%>manage/crm/crm_history?pageNo=${pager.totalPage}" class="btn btn-default">尾页</a>
			    </div> 
			</nav>
    	</div>
    	<div class="cls"></div>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>