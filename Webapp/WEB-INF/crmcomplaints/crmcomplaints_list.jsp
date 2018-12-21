<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@ page import="java.text.*"%>  
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
		<title>${appName}_客户投诉管理</title>
	</head>
	<body>
		<%@ include file="../top.jsp"%>
   		<%@ include file="../left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li>首页</li>
	    		<li><a href="<%=basePath%>manage/crmcomplaints.html">客户投诉管理列表</a></li>
    		</ul>
    	</div>
		<div class="rightContainer">
		<script src="<%=basePath%>resources/My97DatePicker/WdatePicker.js"></script>		
				<button class="btn btn-primary" onclick="javascript:window.location.reload()">
					<span class="glyphicon glyphicon-refresh"></span> 刷新
				</button>
				<button class="btn btn-primary" onclick="LW.location.forward('<%=basePath%>manage/crmcomplaints/post.html')">
					<span class="glyphicon glyphicon-plus"></span> 新增
				</button>
				<button class="btn btn-primary" onclick="LW.location.forward('<%=basePath%>manage/crmcomplaintstype.html')">
					<span class="glyphicon glyphicon-plus"></span> 投诉类型
				</button>


				<button class="btn btn-primary" onclick="LW.location.forward('<%=basePath%>manage/crmcomplaints/crmcomplaints_list.html')">
					<span class="glyphicon glyphicon-plus"></span> 客户投诉统计
				</button>					
			<div class="cls"></div>
			<table fit="true" fitColumns="true" class="table table-striped table-hover table-bordered">
				<thead>
					<tr>
						<th width="5%">ID </th>
						<th width="5%">标题</th>
						<th width="5%">cid</th>
                        <th width="5%">号码</th>
						<th width="10%">用户</th> 
						<th width="10%">comdate</th>						
	                     <th width="10%">类型</th>
	                     <th width="10%">日期</th>
	                     <th width="10%">uid</th>										
						<th width="10%">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pager.datas}" var="item">
							<tr>
								<td>${item.id}</td>
								<td>${item.title}</td>
								<td>${item.cid}</td>
                                <td>${item.number}</td>
                                <td>${item.user}</td>
                                <td>${item.comdate}</td>
                                <td>${item.type}</td>
                                 <td>
                                <fmt:formatDate value="${item.date}" type="both"/>
                                </td>
                                <td>${item.uid}</td>                                                                                    
								<td>
					               <a href="<%=basePath%>crmcomplaints/${item.id}.html">编辑</a> 
					               <a href="javascript:void(0)" onclick="LW.crmcomplaints.del(${item.id})" >删除</a></td>
							</tr>	 
					</c:forEach>
				</tbody>
			</table>
			<nav>
				<span>当前${pager.pageNo}/${pager.totalPage} 共${pager.totalCount}条数据</span>
				<div class="btn-group pull-right" role="group">
			      	<a href="<%=basePath%>manage/crmcomplaints.html" class="btn btn-default">首页</a>
			      	<a href="<%=basePath%>manage/crmcomplaints.html?pageNo=${pager.prePage}" class="btn btn-default">上一页</a>
			      	<a href="<%=basePath%>manage/crmcomplaints.html?pageNo=${pager.nextPage}" class="btn btn-default">下一页</a>
			      	<a href="<%=basePath%>manage/crmcomplaints.html?pageNo=${pager.totalPage}" class="btn btn-default">尾页</a>
			    </div>
			</nav>
    	</div>
    	<div class="cls"></div>
    	<script type="text/javascript">
			$("#page_crmcomplaints").parent().attr("class","active");	
			LW.crmcomplaints=new Object();
			LW.crmcomplaints.del=function(id)
			{
				LW.message.confirm("id","您确认要继续删除吗?",function(r){if(r){LW.location.forward("manage/crmcomplaints/del/"+id+".html");}});
			}
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
