<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>
<%@ page import="java.lang.String"%>  
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="com.lw.crm.crmuser.entity.CrmUser"%>
<%@ page import="java.util.ArrayList" %>
<%
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
		<title>${appName}_采购信息管理</title>
		
		<script>
		function isValid() {
			if(form1.uid.value==0){
				LW.message.show("请选择申请人员");
				return false;
			}
			else
			{
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
	    		<li><a href="<%=basePath%>manage/crmpurchacse/crmpurchacse_list.html">采购信息列表</a></li>
	    		<li><a href="javascript:void(0);">新增采购订单</a></li>
    		</ul>
    	</div>
		<div class="rightContainer">
			<form class="form-horizontal" role="form" method="post" action="<%=basePath%>manage/crmpurchacse/post.html" id="form1" name="form1" >
				<%
					SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
					Date now = new Date();
				%>
				<input type="hidden" name="date" id="date"
				value="<%=sdf.format(now)%>">
				<div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse" data-parent="#accordion" href="#panelInfo">新增采购订单</div>				
				<div id="panelInfo" class="panel-collapse collapse in">
         			<div class="panel-body">
						<table class="table table-bordered">
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>采购编号:</td>
								<%
									SimpleDateFormat sdf1 = new SimpleDateFormat("YYYYMMddhhmm");
									Date now1 = new Date();
									int random = (int) (Math.random() * 10000 + 1);
									String number = sdf1.format(now1) + random;
								%>
						    	<td class="col-md-11"><label class="form-control"><%=number %></label></td>
						    	 <input type="hidden" name="number" id="number" value="<%=number %>">
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>标题:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="title" id="title"  value="" maxlength="50" nullmsg="标题不能为空" placeholder="请输入标题" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>申请人员:</td>
						    	<td class="col-md-11">
							    	<select
										class="form-control" name="uid" id="uid">
										<option value="0" selected="selected">请选择申请人</option>
										<!--动态从数据库查数据并组合成option  -->
										<%
											for (int i = 0; i < crmUserList.size(); i++) {
										%>
										<option value="<%=crmUserList.get(i).getId()%>">
											<%=crmUserList.get(i).getUser()%>
										</option>
										<%
											}
										%>
									</select>
						    	</td>
						    </tr>
							<tr>
						    	<td class="info col-md-1 text-right">价格:</td>
						    	<td class="col-md-11">
						    	<input type="number" step="0.01" class="form-control" style="text-align: left;" name="price"
								id="price" maxlength="10" nullmsg="价格不能为空" placeholder="请填写价格"
									autocomplete="off" datatype="*1-10" errormsg="至少1个字符,最多10个字符!" />
						    	</td>
						    </tr>
							<tr>
								<td class="info col-md-1 text-right">地址:</td>
								<td class="col-md-11">
									<input type="text" class="form-control" style="text-align: left;" name="address"
										   id="address" maxlength="20" nullmsg="地址不能为空" placeholder="请填写地址"
										   autocomplete="off" datatype="*1-20" errormsg="至少1个字符,最多20个字符!" />
								</td>
							</tr>
						    <tr>
						    	<td class="info col-md-1 text-right">备注:</td>
						    	<td class="col-md-11">
									<textarea name="note" class="form-control" rows="5" cols="50" maxlength="50" datatype="*0-50" placeholder="50个汉字以内"></textarea>
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
			$("#page_crmpurchacse_list").parent().attr("class","active");
			$(function(){LW.form.validate("form1");});
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>