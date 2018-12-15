<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@ page import="java.text.*"%>
<%@ page import="java.lang.String"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
		<title>${appName}_进出货记录列表管理</title>
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
	    		<li><a href="<%=basePath%>manage/crmstockinoroutlog/crmstockinoroutlog_list.html">进出货记录列表</a></li>
    		</ul>
    	</div>
		<div class="rightContainer">
			<div class="cls"></div>
			<p class="text-center" style="font-size: 16px;font-weight: bold;">记录表</p>
			<table fit="true" fitColumns="true" class="table table-striped table-hover table-bordered">
				<thead>
					<tr>
						<th>单号</th>
						<th>标题</th>
						<th>价格</th>
						<th>类型</th>
						<th>日期</th>
						<th>录入人</th>
						<th>takeuid</th>
						<th>备注</th>
						<th>地址</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${log.number}</td>
						<td>${log.title}</td>
						<td>${log.price}</td>
						<td>${log.crmStockType.name}</td>
						
						<td><fmt:formatDate value="${log.date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td><lw:SysUserTag  style=""   htmltype="1"  value="${log.uid}" /></td>
						<td><lw:SysUserTag  style=""   htmltype="1"  value="${log.takeuid}" /></td>
						<td>${log.note}</td>
						<td>${log.address}</td>
					</tr>
				</tbody>
			</table>
			<p class="text-center" style="font-size: 16px;font-weight: bold;">明细表</p>
			<table fit="true" fitColumns="true" class="table  table-bordered" style="margin-top: 10px;">
				<thead>
					<tr>
						<th>序号</th>
						<th>名称</th>
						<th>单价</th>
						<th>数量</th>
						<th>类别</th>
						<th>日期</th>
						<th>备注</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${logitemlist}" var="logitem" varStatus="status">
					<tr>
						<td>${status.index+1}</td>
						<td>${logitem.title}</td>
						<td>${logitem.price}</td>
						<td>${logitem.num}</td>
						<td>${logitem.crmName.name}</td>
						<td><fmt:formatDate value="${logitem.date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td>${logitem.note}</td>
					</tr>
				</c:forEach>
					<tr>
						<td colspan="4">合计</td>
						<td colspan="4">${log.price}</td>
					</tr>
				</tbody>
			</table>
			
    	</div>
    	<div class="cls"></div>
    	<script type="text/javascript">
			$("#page_crmstockinoroutlog_list").parent().attr("class","active");
			
			LW.crmstockinoroutlog=new Object();
			LW.crmstockinoroutlog.del=function(id)
			{
				LW.message.confirm("id","您确认要继续删除吗?",function(r){if(r){LW.location.forward("manage/crmstockinoroutlog/del/"+id+".html");}});
			}
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>