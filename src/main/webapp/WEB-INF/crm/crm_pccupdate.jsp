<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@ page import="java.text.*"%>
<%@ page import="java.lang.String"%>  
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.lw.crm.crmsupplier.entity.CrmSupplier"%>
<%@ page import="com.lw.crm.crmuser.entity.CrmUser"%>
<%@ page import="java.util.ArrayList" %>
<%
		ArrayList<CrmSupplier> crmSupplierList = (ArrayList) request.getAttribute("crmSupplierList");
		ArrayList<CrmUser> crmUserList = (ArrayList) request.getAttribute("crmUserList");
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
		<title>${appName}_库存信息管理</title>
		
		<script>
			function IsNum(number) {
				//var reNum = /(^\+?|^\d?)\d*\.\d+$/; //正浮点数
				var reNum=/^[0-9]+(.[0-9]{2})?$/;
				return (reNum.test(number));
			}
		function isValid() {
			if (!IsNum(form1.price.value)) {
				LW.message.show("采购单价需为数字,且保留小数点后两位!");
				form1.price.select();
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
	    		<li><a href="<%=basePath%>manage/crm/crm_find">采购信息列表</a></li>
	    		<li><a href="javascript:void(0);">修改采购订单</a></li>
    		</ul>
    	</div>
		<div class="rightContainer">
			<form class="form-horizontal" role="form" method="post" action="<%=basePath%>manage/crm/crm_saveUpdate" id="form1" name="form1" >
				<input type="hidden" name="id" id="id" value="${crm.id}">
				<div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse" data-parent="#accordion" href="#panelInfo">修改采购订单</div>				
				<div id="panelInfo" class="panel-collapse collapse in">
         			<div class="panel-body">
						<table class="table table-bordered">
							<tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>采购订单信息:</td>
						    	<td class="col-md-11">
								<lw:RestaurantSelTag style="class='form-control' name='restaurantId'" value="1"/>	
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>采购编号:</td>
								
						    	<td class="col-md-11">${crm.number}</td>
						    	 <input type="hidden" name="number" id="number" value="${crm.number}">
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>采购名称:</td>
						    	<td class="col-md-11">
									<input class="form-control " style="	text-align: left;" placeholder="${crm.title}" value="${crm.title}"/>						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>申请人员:</td>
						    	<td class="col-md-11">${crm.uid}</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>供应商名称:</td>
						    	<td class="col-md-11">${crm.sid}</td>
						    </tr>
							<tr>
						    	<td class="info col-md-1 text-right">产品名称:</td>
						    	<td class="col-md-11">
						    		<input type="text"
											class="form-control " style="text-align: left;" name="name" value="${crm.name}"
										id="name" required value="">
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right">产品类别:</td>
						    	<td class="col-md-11">
						    		<select
										class="form-control" name="type">
										<option value="${crm.type}" selected="selected">${crm.type}</option>
										<option value="1">1类</option>
										<option value="2">2类</option>
										<option value="3">3类</option>
										<option value="4">4类</option>
										<option value="5">5类</option>
									</select>
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right">产品单价:</td>
						    	<td class="col-md-11">
						    	<input type="text"
								class="form-control" style="text-align: left;" name="price" value="${crm.price}"
								id="price" required value="" /> 
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right">产购数量:</td>
						    	<td class="col-md-11">
						    		<input type="number"
									class="form-control " style="text-align: left;" name="num" value="${crm.num}"
									id="num" required value="" />
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right">单位:</td>
						    	<td class="col-md-11">
									 <select class="form-control">
										<option value="0"></option>
										<option value="1">件</option>
										<option value="2">箱</option>
										<option value="2">支</option>
										<option value="3">其他</option>
									</select>
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right">备注:</td>
						    	<td class="col-md-11">
							    	<input type="text"
									name="note" value="${crm.note}"
									style="width: 100%; height: 200px;"
									class="form-control" />
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
			$("#page_traceabilitypoint").parent().attr("class","active");
			$(function(){LW.form.validate("userForm");});
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>