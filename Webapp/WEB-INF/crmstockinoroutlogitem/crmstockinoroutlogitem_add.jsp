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
		<title>${appName}_进出货记录明细</title>
		
		<script>
			function IsNum(number) {
				//var reNum = /(^\+?|^\d?)\d*\.\d+$/; //正浮点数
				var reNum=/^[0-9]+(.[0-9]{2})?$/;
				return (reNum.test(number));
			}
		function isValid() {
			if (!IsNum(form1.price.value)) {
				LW.message.show("单价需为数字,且保留小数点后两位!")
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
	    		<li><a href="<%=basePath%>manage/crmstockinoroutlogitem/crmstockinoroutlogitem_list.html">进出货记录明细列表</a></li>
	    		<li>新增	</li>
    		</ul>
    	</div>
		<div class="rightContainer">
			<form class="form-horizontal" role="form" method="post" action="<%=basePath%>manage/crmstockinoroutlogitem/post.html" id="form1" name="form1" >
				<div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse" data-parent="#accordion" href="#panelInfo">新增进出货记录明细</div>				
				<div id="panelInfo" class="panel-collapse collapse in">
         			<div class="panel-body">
						<table class="table table-bordered">
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>单号:</td>
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
						    	<td class="info col-md-1 text-right"><span class="red">*</span>名称:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="title" id="title"  value="" maxlength="50" placeholder="请输入名称" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>价格:</td>
						    	<td class="col-md-11">
						    		<input type="number" class="form-control" name="price" id="price"  value="" 
						    		maxlength="50" placeholder="请输入价格" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>类别:</td>
						    	<td class="col-md-11">
						    	 <select name="type" class="form-control">
						             <option value="0" selected="selected">请选择类别</option>
						             <!--动态从数据库查数据并组合成option  -->
						            <% for(int i=0;i<crmNameList.size();i++){ %>
						  			<option value="<%=crmNameList.get(i).getId() %>">
						 			 <%=crmNameList.get(i).getName() %>
						 			</option>
						 			  <%  }    %>
								 </select>
						    	</td>
						    </tr>
						     <!-- <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>pid:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="pid" value="" maxlength="50" nullmsg="pid" placeholder="pid" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr> -->
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>数量:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="num" value="" maxlength="50" nullmsg="数量" placeholder="数量" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    <!--  <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>inorout_log_no:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="inoroutlogno" value="" maxlength="50" nullmsg="inorout_log_no" placeholder="inorout_log_no" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>地址:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="address" id="address"  value="" maxlength="300" autocomplete="off" datatype="*1-300" errormsg="至少1个字符,最多300个字符！">
						    	</td>
						    </tr> -->
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>备注:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="note" id="note"  value="" maxlength="300" autocomplete="off" datatype="*1-300" errormsg="至少1个字符,最多300个字符！">
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
			$("#page_crmstockinoroutlogitem_list").parent().attr("class","active");
			$(function(){LW.form.validate("form1");});
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>