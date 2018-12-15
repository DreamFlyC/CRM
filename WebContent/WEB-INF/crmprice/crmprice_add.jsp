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
		<title>${appName}_付款信息管理</title>
	</head>
	<body>
		<%@ include file="../top.jsp"%>
   		<%@ include file="../left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li><a href="<%=basePath%>sys/index.html">首页</a></li>
				<li><a href="<%=basePath%>manage/crmprice.html">付款列表</a></li>
				<li><a href="<%=basePath%>manage/crmprice/post.html">添加付款管理列表</a></li>
    		</ul>
    	</div>
		<div class="rightContainer">
        <script src="<%=basePath%>resources/My97DatePicker/WdatePicker.js">
        </script>
			<form class="form-horizontal" role="form" method="post" action="<%=basePath%>manage/crmprice/post.html" id="userForm">
				<div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse" data-parent="#accordion" href="#panelInfo">付款信息管理</div>				
				<div id="panelInfo" class="panel-collapse collapse in">
         			<div class="panel-body">
						<table class="table table-bordered">
							<tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>用户积分:</td>
						    	<td class="col-md-11">
						    	</td>
						    </tr>
							<tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>number:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="number" value="" maxlength="50" placeholder="请输入number" autocomplete="off" datatype="*1-50"  nullmsg="请输入积分标题！" errormsg="活动主题至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
							<tr>
						    	<td class="info col-md-1 text-right">cid:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="cid" value="" maxlength="50" placeholder="请输入cid" autocomplete="off"   >
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right">user:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="user" value="" maxlength="50" placeholder="请输入user" autocomplete="off"   >
						    	</td>
						    </tr>
						    
						    <tr>
						    	<td class="info col-md-1 text-right">price:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="price" value="" maxlength="50" placeholder="请输入price" autocomplete="off"   >
						    	</td>
						    </tr>
						    
						     <tr>
						    	<td class="info col-md-1 text-right">title:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="title" value="" maxlength="50" placeholder="请输入title" autocomplete="off"   >
						    	</td>
						    </tr>
						    
						     <tr>
						    	<td class="info col-md-1 text-right">type:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="type" value="" maxlength="50" placeholder="请输入type" autocomplete="off"   >
						    	</td>
						    </tr>
						 	     	    
						       <tr>
						    	<td class="info col-md-1 text-right">viewid:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="viewid" value="" maxlength="50" placeholder="请输入viewid" autocomplete="off"   >
						    	</td>
						    </tr> 
						    
						    <tr>
						    	<td class="info col-md-1 text-right">cname:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="cname" value="" maxlength="50" placeholder="请输入cname" autocomplete="off"   >
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
			$("#page_crmprice").parent().attr("class","active");
			$(function(){LW.form.validate("userForm");});
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>