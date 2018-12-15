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
	    		<li><a href="<%=basePath%>manage/crm/crm_find.html">采购信息列表</a></li>
	    		<li><a href="javascript:void(0);">新增</a></li>
	    		<li><a href="javascript:void(0);">采购详情</a></li>
    		</ul>
    	</div>
		<div class="rightContainer">
				<button class="btn btn-primary" onclick="javascript:window.location.reload()">
					<span class="glyphicon glyphicon-refresh"></span> 刷新
				</button>
				<button class="btn btn-primary" onclick="javascript:window.Location.href='<%=basePath%>manage/crm/crm_list.html'">
					<span class="glyphicon glyphicon-refresh"></span> 返回列表
				</button>
			<div class="cls"></div>
			<table fit="true" fitColumns="true" class="table table-striped table-hover table-bordered">
				<thead>
					<tr>
						<th class="a">ID</th>
						<th class="a">采购编号</th>
						<th class="a">申请人ID</th>
						<th class="a">供应商ID</th>
						<th class="a">标题</th>
						<th class="a">产品名称</th>
						<th class="a">申请日期</th>
						<th class="a">采购产品单价</th>
						<th class="a">采购数量</th>
						<th class="a">小计</th>
						<th class="a">备注</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="a">${crmPurchacse.id}</td>
						<td class="a">${crmPurchacse.number}</td>
						<td class="a">${crmPurchacse.uid}</td>
						<td class="a">${crmPurchacse.sid}</td>
						<td class="a">${crmPurchacse.title==''||crmPurchacse.title==null?"无":crmPurchacse.title}</td>
						<td class="a">${crmPurchacse.name}</td>
						<td class="a"><fmt:formatDate value="${crmPurchacse.date}"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td class="a">${crmPurchacse.price}元</td>
						<td class="a">${crmPurchacse.num}</td>
						<td class="a">${crmPurchacse.price*crmPurchacse.num}元</td>
						<td class="a">${crmPurchacse.note}</td>
					</tr>
				</tbody>
			</table>
    	</div>
    	<c:if test="${crmPurchacseList.size()<=0}">
		<div style="text-align: center;">
		<p>没有找到数据记录</p>
		</div>
		</c:if>
    	<div class="cls"></div>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>