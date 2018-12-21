<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@ page import="java.text.*"%>
<%@ page import="java.lang.String"%>  
<%
java.util.Date date = new java.util.Date();
DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
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
   pageContext.setAttribute("id",request.getParameter("id").trim());
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
		<title>${appName}_客户回访管理</title>
	</head>
	<body>
		<%@ include file="../top.jsp"%>
   		<%@ include file="../left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li><a href="<%=basePath%>manage/index.html">首页</a></li>
    			<li><a href="<%=basePath%>manage/crmsercustomer/crmsercustomer_list.html">客户回访管理</a></li>
	    		<li>编辑客户回访信息</li>
    		</ul>
    	</div>
		<div class="rightContainer">
			<form class="form-horizontal" role="form" method="post" action="<%=basePath%>manage/crmsercustomer/edit.html" id="userForm">
				<input type="hidden" name="id" value="${crmSerCustomer.id }" />
				<div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse" data-parent="#accordion" href="#panelInfo">客户回访信息</div>				
				<div id="panelInfo" class="panel-collapse collapse in">
         			<div class="panel-body">
						<table class="table table-bordered">
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>标题:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="title" value="${crmSerCustomer.title}" maxlength="50" nullmsg="请输入标题" placeholder="请输入标题" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>公司id:</td>
						    	<td class="col-md-11">
						    		<input type="number" class="form-control" name="cid" value="${crmSerCustomer.cid}" maxlength="50" nullmsg="请输入公司id" placeholder="请输入公司id" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>类型:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="type" value="${crmSerCustomer.type}" maxlength="50" nullmsg="请输入类型" placeholder="请输入类型" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>录入人员id:</td>
						    	<td class="col-md-11">
						    		<input type="number" class="form-control" name="uid" value="${crmSerCustomer.uid}" maxlength="50" nullmsg="录入人员id" placeholder="录入人员id" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>指定回访人员id:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="follow_uid" value="${crmSerCustomer.follow_uid}" maxlength="50" nullmsg="指定回访人员id" placeholder="指定回访人员id" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>回访目的:</td>
						    	<td class="col-md-11">
						    		<input type="number" class="form-control" name="follow_purpose" value="${crmSerCustomer.follow_purpose}" maxlength="50" nullmsg="回访目的" placeholder="回访目的" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>回访时间:</td>
						    	<td class="col-md-11">
						    		<input type="text" name="follow_datetime" id="sdate" style="text-align: left;"
									placeholder="请选择回访时间"
									onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" onchange="" 
									 value="<fmt:formatDate value='${crmSerCustomer.follow_datetime}' pattern='yyyy-MM-dd HH:mm:ss' />"
									class="form-control" required />
						    	</td>
						    </tr>
						    
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>指定回访时间:</td>
						    	<td class="col-md-11">
						    	<input type="text" name="specified_datetiime" id="sdate" style="text-align: left;"
									placeholder="请选择指定回访时间"
									onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" onchange="" 
									 value="<fmt:formatDate value='${crmSerCustomer.specified_datetiime}' pattern='yyyy-MM-dd HH:mm:ss' />"
									class="form-control" required />
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>回访结果:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="follow_result" value="${crmSerCustomer.follow_result}" maxlength="50" nullmsg="回访结果" placeholder="回访结果" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
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
			$("#page_crmsercustomer_list").parent().attr("class","active");
			$(function(){LW.form.validate("userForm");});
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>