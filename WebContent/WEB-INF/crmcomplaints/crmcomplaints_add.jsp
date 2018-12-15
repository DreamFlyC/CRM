<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@ page import="java.text.*"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
java.util.Date date = new java.util.Date();
DateFormat formatter = new SimpleDateFormat("HH:mm:ss");
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
				<li><a href="<%=basePath%>manage/crmcomplaints/post.html">添加客户投诉管理列表</a></li>
    		</ul>
    	</div>
		<div class="rightContainer">
        <script src="<%=basePath%>resources/My97DatePicker/WdatePicker.js">
        </script>
			<form class="form-horizontal" role="form" method="post" action="<%=basePath%>manage/crmcomplaints/post.html" id="userForm">
				<div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse" data-parent="#accordion" href="#panelInfo">客户投诉管理</div>				
				<div id="panelInfo" class="panel-collapse collapse in">
         			<div class="panel-body">
						<table class="table table-bordered">				
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>标题:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="title" value="" maxlength="50" placeholder="请输入标题" autocomplete="off" datatype="*1-50"  nullmsg="请输入标题！" errormsg="标题至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
							<tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>cid:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="cid" value="" maxlength="50" placeholder="请输入cid" autocomplete="off" datatype="*1-50"  nullmsg="请输入cid！" errormsg="cid至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
							<tr>
						    	<td class="info col-md-1 text-right">号码:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="number" value="" maxlength="50" placeholder="请输入号码" autocomplete="off"   >
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right">用户:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="user" value="" maxlength="50" placeholder="请输入用户" autocomplete="off"   >
						    	</td>
						    </tr>
						    
						    <tr>
						    	<td class="info col-md-1 text-right">comdate:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="comdate" value="" maxlength="50" placeholder="请输入comdate" autocomplete="off"   >
						    	</td>
						    </tr>						    						    						    
						     <tr>
						    	<td class="info col-md-1 text-right">类型:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="type" value="" maxlength="50" placeholder="请输入类型" autocomplete="off"   >
						    	</td>
						    </tr>						    						     	    
						       <tr>
						    	<td class="info col-md-1 text-right">uid:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="uid" value="" maxlength="50" placeholder="请输入uid" autocomplete="off"   >
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
			$("#page_userswx").parent().attr("class","active");
			$(function(){LW.form.validate("userForm");});			
		</script>	
 		
		<script type="text/javascript">
			$("#page_crmcomplaints").parent().attr("class","active");	
		</script>						
    	<%@ include file="../foot.jsp"%>
	</body>
</html>