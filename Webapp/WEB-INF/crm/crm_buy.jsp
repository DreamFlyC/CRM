<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@ page import="java.text.*"%>
<%@ page import="java.lang.String"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

<%
 double d = Math.random();
String flag = Double.toString(d);
session.setAttribute("flag",flag);
%>
<!DOCTYPE html>
<html>
	<head>
	 	<base href="<%=basePath%>" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8;"/>
		<%@ include file="../tag.jsp" %>
		<title>${appName}_产品库存信息管理</title>
		
		<script>
function isvalid(){
	if(form1.stock.value==""){
		LW.message.show("请输入出货产品数量");
		form1.stock.select();
		return false;
	}
	if(form1.address.value==""){
		LW.message.show("请输入出货地点");
		form1.address.select();
		return false;
	}
	function IsNum(number) {
		var reNum = /^\d*$/;
		return (reNum.test(number));
	}
	 if (!IsNum(form1.stock.value)||((form1.stock.value)>('${crm.crmBuyInfo.leavstock}'))) {
		LW.message.show("${crm.crmBuyInfo.leavstock}");
		LW.message.show(form1.stock.value);
		LW.message.show(IsNum(form1.stock.value));
		LW.message.show("产品数量不合法，请重新输入");
		//document.getElementById("stock").value=${crm.crmBuyInfo.leavstock};
		form1.stock.focus();
		return false;
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
	    		<li><a href="<%=basePath%>manage/crm/crm_list.html">库存列表</a></li>
	    		<li><a href="javascript:void(0);">产品出货</a></li>
    		</ul>
    	</div>
		<div class="rightContainer">
			<form class="form-horizontal" role="form" method="post" action="manage/crm/doBuy" id="form1" onsubmit="return isvalid(this);">
				<input type="hidden" name="flag" value="<%=flag%>"> <!-- 防止重复提交 -->
				<div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse" data-parent="#accordion" href="#panelInfo">产品出货信息</div>				
				<div id="panelInfo" class="panel-collapse collapse in">
         			<div class="panel-body">
						<table class="table table-bordered">
							<tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>产品出货:</td>
						    	<td class="col-md-11">
								<lw:RestaurantSelTag style="class='form-control' name='restaurantId'" value="1"/>	
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>产品id:</td>
						    	<td class="col-md-11">
						    		<label class="form-control" style="  text-align: left;">${crm.id}</label>
						    		<input type="hidden" name="id" value="${crm.id}">
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>产品编号:</td>
						    	<td class="col-md-11">
		    						<label class="form-control" style="  text-align: left;">${crm.number}</label>
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>产品名称</td>
						    	<td class="col-md-11">
						    	 	<label class="form-control" style="  text-align: left;">${crm.title}</label>
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>产品价格:</td>
						    	<td class="col-md-11">
						    	  <label class="form-control" style="  text-align: left;">${crm.price}</label>
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>产品分类:</td>
						    	<td class="col-md-11">
						    	 	<label class="form-control" style="  text-align: left;">${crm.type}</label>
						    	</td>
						    </tr>
							<tr>
						    	<td class="info col-md-1 text-right">库存剩余量:</td>
						    	<td class="col-md-11">
						    		<label class="form-control" style="width: 100%; text-align: left;">${crm.crmBuyInfo.leavstock}件</label>
						    	</td>
						    </tr>
							<tr>
						    	<td class="info col-md-1 text-right">出货件数:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" style="text-align: left;" name="stock" id="stock" />
						    	</td>
						    </tr>
							<tr>
						    	<td class="info col-md-1 text-right">出货地点:</td>
						    	<td class="col-md-11">
			    	            	<input type="text" class="form-control" style="text-align: left;" name="address" id="address" /> 
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right">备注:</td>
						    	<td class="col-md-11">
							    	<input type="text" name="note" style="width: 100%; height: 300px; text-align: left;"
									class="form-control" />
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
			$("#page_traceabilityPoint").parent().attr("class","active");
			$(function(){LW.form.validate("userForm");});
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>