<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@ page import="java.text.*"%>
<%@ page import="java.lang.String"%>  
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.lw.crm.crmname.entity.CrmName" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.UUID" %>
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
		<title>${appName}_产品信息管理</title>
		
		<script>
			function IsNum(number) {
				//var reNum = /(^\+?|^\d?)\d*\.\d+$/; //正浮点数
				var reNum=/^[0-9]+(.[0-9]{2})?$/;
				return (reNum.test(number));
			}
		function isValid() {
			if (!IsNum(form1.price.value)) {
				LW.message.show("产品单价需为数字,且保留小数点后两位!")
				return false;
			}else{
				$("#form1").submit();
				
			}
		}
	    </script>
		
	</head>
	<body>
		<%@ include file="../top.jsp"%>
   		<%@ include file="../left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li><a href="<%=basePath%>manage/index.html">首页</a></li>
	    		<li><a href="<%=basePath%>manage/crmproduct/crmproduct_list.html">产品列表</a></li>
	    		<li>新增产品信息</li>
    		</ul>
    	</div>
		<div class="rightContainer">
			<form class="form-horizontal" role="form" method="post" action="<%=basePath%>manage/crmproduct/post.html" id="form1" name="form1" >
				<div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse" data-parent="#accordion" href="#panelInfo">新增产品基本信息</div>				
				<div id="panelInfo" class="panel-collapse collapse in">
         			<div class="panel-body">
						<table class="table table-bordered">
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>产品编号:</td>
								<%
					            SimpleDateFormat sdf=new SimpleDateFormat("YYYYMMddhhmm");
					            Date now=new Date();
					            int random=(int)(Math.random()*10000+1);
					            String number=sdf.format(now)+random;
					            %>
						    	<td class="col-md-11"><label class="form-control"><%=number %></label></td>
						    	 <input type="hidden" name="number" id="number" value="<%=number %>">
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>产品名称:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="title" id="title" required value="" maxlength="50" placeholder="请输入产品名称" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>产品价格:</td>
						    	<td class="col-md-11">
						    		<input type="number" class="form-control" name="price" id="price" required value="" 
						    		maxlength="50" placeholder="请输入产品价格，保留小数点后两位" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>产品分类:</td>
						    	<td class="col-md-11">
						    	 <select name="type" class="form-control" required datatype="select">
						             <option value="0" selected="selected">请选择分类</option>
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
					    <div class="alert alert-warning alert-dismissible" role="alert" style="display:none;" id="alert">
				            <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				            <strong>系统提示</strong> <span id="savemsg"></span>
				        </div><br />   			
					   <div class="col-md-12 text-center">
					      <button type="button" class="btn btn-primary btn-lg" onclick="isValid(this);">保 存</button>
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