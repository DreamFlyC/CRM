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
		<title>${appName}_供应商信息管理</title>
	</head>
	<body>
		<%@ include file="../top.jsp"%>
   		<%@ include file="../left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li><a href="<%=basePath%>manage/index.html">首页</a></li>
	    		<li><a href="<%=basePath%>manage/crmsupplier/crmsupplier_list.html">供应商信息列表</a></li>
	    		<li>修改供应商信息</li>
    		</ul>
    	</div>
		<div class="rightContainer">
			<form class="form-horizontal" role="form" method="post" action="<%=basePath%>manage/crmsupplier/edit.html" id="userForm" name="userForm" onsubmit="return isValid(this)" autocomplete="off">
				<input type="hidden" name="id" value="${crmSupplier.id}">
				<div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse" data-parent="#accordion" href="#panelInfo">供应商信息</div>				
				<div id="panelInfo" class="panel panel-collapse collapse in">
         			<div class="panel-body">
						<table class="table table-bordered">
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>供应商名称:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="supplier" value="${crmSupplier.supplier}" nullmsg="供应商名称不能为空" maxlength="50" placeholder="请输入供应商名称" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
							<tr>
								<td class="info col-md-1 text-right"><span class="red">*</span>地址:</td>
								<td class="col-md-11">
									<input type="text" class="form-control" name="address" value="${crmSupplier.address}" nullmsg="地址不能为空" maxlength="50" placeholder="地址" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
								</td>
							</tr>
							<tr>
								<td class="info col-md-1 text-right">办公室电话:</td>
								<td class="col-md-11">
									<input type="number" class="form-control" name="officePhone" value="${crmSupplier.officePhone}" nullmsg="办公室电话不能为空"  maxlength="50" placeholder="办公室电话" autocomplete="off" datatype="*0-50" errormsg="至少1个字符,最多50个字符！">
								</td>
							</tr>
							<tr>
								<td class="info col-md-1 text-right"><span class="red">*</span>客户类型:</td>
								<td class="col-md-11">
									<input type="radio" name="type" value="2" checked="checked" />企业客户
									<input type="radio" name="type" value="1" />个人客户
								</td>
							</tr>
							<tr>
								<td class="info col-md-1 text-right"><span class="red">*</span>企业法人:</td>
								<td class="col-md-11">
									<input type="text" class="form-control" name="enterprisePerson" value="${crmSupplier.enterprisePerson}" nullmsg="企业法人不能为空" maxlength="50" placeholder="企业法人" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
								</td>
							</tr>
							<tr>
								<td class="info col-md-1 text-right">所属行业ID:</td>
								<td class="col-md-11">
									<input type="text" class="form-control" name="industryId" value="${crmSupplier.industryId}" nullmsg=" 所属行业ID不能为空" maxlength="50" placeholder="所属行业ID" autocomplete="off" datatype="*0-50" errormsg="至少1个字符,最多50个字符！">
								</td>
							</tr>
							<tr>
								<td class="info col-md-1 text-right">邮箱:</td>
								<td class="col-md-11">
									<input type="mail" class="form-control" name="mail" value="${crmSupplier.mail}" nullmsg="邮箱不能为空" maxlength="50" placeholder="邮箱" autocomplete="off" datatype="*0-50" errormsg="至少1个字符,最多50个字符！">
								</td>
							</tr>
							<tr>
								<td class="info col-md-1 text-right">邮编:</td>
								<td class="col-md-11">
									<input type="number" class="form-control" name="zipCode" value="${crmSupplier.zipCode}"  placeholder="邮编" autocomplete="off">
								</td>
							</tr>
							<tr>
								<td class="info col-md-1 text-right">银行类型:</td>
								<td class="col-md-11">
									<select class="form-control bankType" name="bankType">
										<option value="0">请选择银行</option>
										<option value="1">中国工商银行</option>
										<option value="2">中国农业银行</option>
										<option value="3">中国银行</option>
										<option value="4">中国建设银行</option>
									</select>
								</td>
							</tr>
							<tr>
								<td class="info col-md-1 text-right">银行:</td>
								<td class="col-md-11">
									<input type="text" class="form-control" name="bankName" value="${crmSupplier.bankType}" nullmsg="银行不能为空" maxlength="50" placeholder="银行卡号" autocomplete="off" datatype="*0-50" errormsg="至少1个字符,最多50个字符！">
								</td>
							</tr>
							<tr>
								<td class="info col-md-1 text-right">银行卡号:</td>
								<td class="col-md-11">
									<input type="number" class="form-control" name="bankCardNumber" value="${crmSupplier.bankCardNumber}" nullmsg="银行卡号不能为空" maxlength="50" placeholder="银行卡号" autocomplete="off" datatype="*0-50" errormsg="至少1个字符,最多50个字符！">
								</td>
							</tr>
							<tr>
								<td class="info col-md-1 text-right">开户名称:</td>
								<td class="col-md-11">
									<input type="text" class="form-control" name="bankAccountName" value="${crmSupplier.bankAccountName}" nullmsg="开户名称不能为空" maxlength="50" placeholder="开户名称" autocomplete="off" datatype="*0-50" errormsg="至少1个字符,最多50个字符！">
								</td>
							</tr>
							<tr>
								<td class="info col-md-1 text-right">来源ID:</td>
								<td class="col-md-11">
									<input type="text" class="form-control" name="sourceId" value="${crmSupplier.sourceId}"  nullmsg="来源ID不能为空" maxlength="50" placeholder="来源ID" autocomplete="off" datatype="*0-50" errormsg="至少1个字符,最多50个字符！">
								</td>
							</tr>
							<tr>
								<td class="info col-md-1 text-right">星级:</td>
								<td class="col-md-11">
								<select class="form-control starLevel" name="starLevel">
									<option value="0">请选择星级</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
								</select>
								
								</td>
							</tr>
							<tr>
								<td class="info col-md-1 text-right">分组ID:</td>
								<td class="col-md-11">
									<select class="form-control groupid" name="groupid">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
									</select>
								</td>
							</tr>
							<tr>
								<td class="info col-md-1 text-right"><span class="red">*</span>联系人:</td>
								<td class="col-md-11">
									<input type="text" class="form-control" name="contactsName" value="${crmSupplier.contactsName}" nullmsg="联系人不能为空" maxlength="50" placeholder="联系人" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
								</td>
							</tr>
							<tr>
								<td class="info col-md-1 text-right"><span class="red">*</span>电话号码:</td>
								<td class="col-md-11">
									<input type="number" class="form-control" name="tel" value="${crmSupplier.tel}" nullmsg="电话号码不能为空"  maxlength="50" placeholder="电话号码" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
								</td>
							</tr>
							<tr>
								<td class="info col-md-1 text-right">qq:</td>
								<td class="col-md-11">
									<input type="number" class="form-control" name="qq" value="${crmSupplier.qq}" placeholder="qq">
								</td>
							</tr>
							<tr>
								<td class="info col-md-1 text-right">性别:</td>
								<td class="col-md-11">
									<input type="radio" class="" name="sex" value="1" checked="checked">男
									<input type="radio" class="" name="sex" value="2" >女
								</td>
							</tr>
							<tr>
								<td class="info col-md-1 text-right">职位:</td>
								<td class="col-md-11">
									<input type="text" class="form-control" name="positionId" value="${crmSupplier.positionId}" maxlength="50" placeholder="职位" autocomplete="off">
								</td>
							</tr>
							<tr>
								<td class="info col-md-1 text-right">enable:</td>
								<td class="col-md-11">
									<input type="radio"  name="enable" value="1" checked="checked" maxlength="50" placeholder="enable" autocomplete="off">已启用
									<input type="radio"  name="enable" value="0" maxlength="50" placeholder="enable" autocomplete="off" >已停用
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
			$("#page_crmsupplier_list").parent().attr("class","active");
			$(function(){LW.form.validate("userForm");});
			$("input:radio[name='enable'][value='${crmSupplier.enable==true?'1':'0'}']").attr('checked','true');
			$("input:radio[name='sex'][value='${crmSupplier.sex==1?'1':'2'}']").attr('checked','true');
			$("input:radio[name='type'][value='${crmSupplier.type==1?'1':'2'}']").attr('checked','true');
			$(".starLevel").val('${crmSupplier.starLevel}'); 
			$(".bankType").val('${crmSupplier.bankType}'); 
			$(".groupid").val('${crmSupplier.groupid}'); 
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>

