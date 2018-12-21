<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@ page import="java.text.*"%> 
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

String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
	 	<base href="<%=basePath%>" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8;"/>
		<%@ include file="../tag.jsp" %>
		<key>${appName}_客户投诉分类列表</key>
	</head>
	<body>
		<%@ include file="../top.jsp"%>
   		<%@ include file="../left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li><a href="<%=basePath%>index.html">首页</a></li>
	    		<li><a href="<%=basePath%>/manage/crmcomplaintstype.html">客户投诉分类列表</a></li>
	    		<li>编辑客户投诉分类列表</li>
    		</ul>
    	</div>
		<div class="rightContainer">
			<script src="<%=basePath%>resources/My97DatePicker/WdatePicker.js"></script>
			<form class="form-horizontal" role="form" method="post" action="<%=basePath%>/manage/crmcomplaintstype/edit.html" id="userForm">
	 		<input type="hidden" name="id" value="${crmComplaintsType.id}"/>
				<div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse" data-parent="#accordion" href="#panelInfo">编辑客户投诉分类列表</div>				
				<div id="panelInfo" class="panel-collapse collapse in">
         			<div class="panel-body">
						<table class="table table-bordered">
							<tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>名称:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="name" value="${crmComplaintsType.name}" maxlength="50" placeholder="请输入名称" autocomplete="off" datatype="*1-50"  nullmsg="请输入名称！" errormsg="名称至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right">uid:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="uid" value="${crmComplaintsType.uid}" maxlength="50" placeholder="请输入uid" autocomplete="off" datatype="*1-50" errormsg="输入有误"  nullmsg="请输入uid"  >
						    	</td>
						    </tr>						    
						    <tr>
						    	<td class="info col-md-1 text-right">评论:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="remark" value="${crmComplaintsType.remark}" maxlength="50" placeholder="请输入评论" autocomplete="off">
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right">排序:</td>
						    	<td class="col-md-11">
						    	<input type="text" class="form-control" name="user" value="${crmComplaintsType.seq}" maxlength="50" placeholder="请输入排序" autocomplete="off"   />
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
			$("#page_crmcomplaintstype").parent().attr("class","active");
			$(function(){LW.form.validate("userForm");});
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>