<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@ page import="java.text.*"%>
<%@ page import="java.lang.String"%>  
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="com.lw.crm.crmname.entity.CrmName" %>
<%@ page import="java.util.ArrayList" %>
<%
     ArrayList<CrmName> crmNameList = (ArrayList)request.getAttribute("crmNameList");
     %>
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
		<title>${appName}_朔源系统网点信息管理</title>
	</head>
	<body>
		<%@ include file="../top.jsp"%>
   		<%@ include file="../left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li><a href="<%=basePath%>manage/index.html">首页</a></li>
	    		<li><a href="<%=basePath%>manage/crmproduct/crmproduct_list.html">产品列表</a></li>
	    		<li><a href="javascript:void(0);">编辑</a></li>
    		</ul>
    	</div>
		<div class="rightContainer">
			<form class="form-horizontal" role="form" method="post" action="manage/crmproduct/edit.html" id="userForm">
				<div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse" data-parent="#accordion" href="#panelInfo">产品信息</div>				
				<div id="panelInfo" class="panel-collapse collapse in">
         			<div class="panel-body">
         			<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
					<input type="hidden" name="id" value="${crmProduct.id}">	
						<table class="table table-bordered">
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>产品ID:</td>
						    	<td class="col-md-11">
						    		<label class="form-control" style="  text-align: left;">${crmProduct.id}</label>
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>>产品编号:</td>
						    	<td class="col-md-11">
						    		<label class="form-control" style="  text-align: left;">${crmProduct.number}</label>
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>产品名称:</td>
						    	<td class="col-md-11">
							    	<label class="form-control" style="  text-align: left;">${crmProduct.title}</label>
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>产品价格:</td>
						    	<td class="col-md-11">
						    		<input type="number" class="form-control " style="  text-align: left;" name="price" id="price" value="" placeholder="${crmProduct.price}" >
						    	</td>
						    </tr>
							<tr>
						    	<td class="info col-md-1 text-right">产品分类:</td>
						    	<td class="col-md-11">
									<select name="type" class="form-control">
						            <option value="${crmProduct.type}" selected="selected">${crmProduct.type}类</option>
						            <!--动态从数据库查数据并组合成option  -->
						            <% for(int i=0;i<crmNameList.size();i++){ %>
						  			<option value="<%=crmNameList.get(i).getId() %>">
						 			<%=crmNameList.get(i).getName() %>
						 			</option>
						 			<%  }    %>
									</select>
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
			$("#page_crmproduct_list").parent().attr("class","active");
			$(function(){LW.form.validate("userForm");});
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>