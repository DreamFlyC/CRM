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
		<title>${appName}_产品列表信息管理</title>
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
	    		<li><a href="<%=basePath%>manage/crmproduct/crmproduct_list.html">产品列表</a></li>
    		</ul>
    	</div>
		<div class="rightContainer">
		<script src="<%=basePath%>resources/My97DatePicker/WdatePicker.js"></script>
			
				<button class="btn btn-primary" onclick="javascript:window.location.reload()">
					<span class="glyphicon glyphicon-refresh"></span> 刷新
				</button>
				<button class="btn btn-primary" onclick="LW.location.forward('<%=basePath%>manage/crmproduct/post.html')">
					<span class="glyphicon glyphicon-plus"></span> 新增
				</button>	
			<div class="cls"></div>
			<table fit="true" fitColumns="true"
			class="table table-striped table-hover table-bordered">
			<thead>
				<tr>
					<th><input type="checkbox" id="all" name="allCK"
						onclick="selectAll()" /></th>
					<th>产品编号</th>
					<th>产品名称</th>
					<th>产品分类</th>
					<th>产品价格</th>
					<th>发布时间</th>
					<th>发布人</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${pager.datas}" var="crmproduct" varStatus="status">
					<tr id="id${crmproduct.id}">
						<td><input type="checkbox" name="box" onclick="selectOne()"
							value="${crmproduct.id}"></td>
						<td>${crmproduct.number}</td>
						<td>${crmproduct.title}</td>
						<td>${crmproduct.type}</td>
						<td>${crmproduct.price}</td>
						<td><fmt:formatDate value="${crmproduct.date}"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td>${crmproduct.uid}</td>
						<td>
							 <a href="<%=basePath%>manage/crmproduct/${crmproduct.id}.html">编辑</a> 
				   			 <a href="javascript:void(0)" onclick="LW.crmproduct.del(${crmproduct.id})">删除</a></td>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<nav>
			<span>当前${pager.pageNo}/${pager.totalPage}
				共${pager.totalCount}条数据</span>
			<div class="btn-group pull-right" role="group">
				<a href="<%=basePath%>manage/crmproduct/crmproduct_list.html" class="btn btn-default">首页</a>
				<a href="<%=basePath%>manage/crmproduct/crmproduct_list.html?pageNo=${pager.prePage}"
					class="btn btn-default">上一页</a> <a
					href="<%=basePath%>manage/crmproduct/crmproduct_list.html?pageNo=${pager.nextPage}"
					class="btn btn-default">下一页</a> <a
					href="<%=basePath%>manage/crmproduct/crmproduct_list.html?pageNo=${pager.totalPage}"
					class="btn btn-default">尾页</a>
			</div>
		</nav>
	</div>
	<div class="cls"></div>
	 	<script type="text/javascript">
			$("#page_crmproduct_list").parent().attr("class","active");
			
			LW.crmproduct=new Object();
			LW.crmproduct.del=function(id)
			{
				//LW.message.show(id);
				LW.message.confirm("id","您确认要继续删除吗?",function(r){if(r){LW.location.forward("manage/crmproduct/del/"+id+".html");}});
			}
		</script> 
	<%@ include file="../foot.jsp"%>
	</body>
</html>