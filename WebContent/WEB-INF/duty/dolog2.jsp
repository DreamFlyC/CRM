<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.lang.String"%>
<%
	java.util.Date date = new java.util.Date();
	DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	String Fordate = "";
	String Todate = "";
	try {
		Fordate = request.getParameter("Fordate").trim();
		Todate = request.getParameter("Todate").trim();
	} catch (Exception e) {

	}

	if (Fordate == null || Fordate.equals("") || Todate == null || Todate.equals("")) {
		pageContext.setAttribute("Fordate", formatter.format(date));
		pageContext.setAttribute("Todate", formatter.format(date));
	} else {
		pageContext.setAttribute("Fordate", Fordate);
		pageContext.setAttribute("Todate", Todate);
	}

	try {
		pageContext.setAttribute("lotteryid", request.getParameter("lotteryid").trim());
	} catch (Exception e) {

	}

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8;" />
<%@ include file="../tag.jsp"%>
<title>录入进度</title>

<script type="text/javascript">
	function isValid() {
		var key=true;
		if (form1.progress.value == "") {
			LW.message.show("工单进度不能为空");
			form1.progress.select();
			key=false;
			return false;
		}

		if (!IsNum(form1.progress.value)) {
			LW.message.show("工单进度请输入数字!")
			form1.progress.focus();
			key=false;
			return false;
		}
		function IsNum(number) {
			var reNum = /^\d*$/;
			return (reNum.test(number));
		}
		var str = $("#progress").val();
		if (isNaN(str)) {
			LW.message.show("请输入数字");
			key=false;
			return false;
		} else if (str <= 0 || str > 100) {
			LW.message.show("请输入1-100之间的数字");
			key=false;
			return false;
		}
		if('${dutyLog.progress}'>=100){
			LW.message.show("此次工单进度已完成！");
			window.history.go(-2);
			key=false;
			return false;
		}
		if(key){
			$("#form1").submit();
		}

	}
</script>

<style type="text/css">
table thead tr th, table tbody tr td {
	text-align: center;
}
</style>
</head>
<body>
	<%@ include file="../top.jsp"%>
	<%@ include file="../left.jsp"%>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="<%=basePath%>manage/index.html">首页</a></li>
			<li><a href="<%=basePath%>duty/duty_list.html">工单列表</a></li>
			<li><a onclick="window.history.go(-1);">执行人管理</a></li>
			<li><a href="javascript:void(0);">录入进度</a></li>
		</ul>
	</div>
	<div class="rightContainer">
		<button class="btn btn-primary"
			onclick="javascript:window.location.reload()">
			<span class="glyphicon glyphicon-refresh"></span> 刷新
		</button>
		
		<div class="cls"></div>
		<form action="duty/savelog.html" method="get" enctype="multipart/form-data"
			class="form-horizontal" name="form1" id="form1">
			<input type="hidden" name="id" id="id" value="${duty.id}">
			<input type="hidden" name="uid" id="uid" value="${uid}">
		<table fit="true" fitColumns="true"
			class="table table-striped table-hover table-bordered">
			<thead>
				<tr>
					<th class="a"><span style="color: red">*</span>完成进度(%)</th>
					<td class="b"><input type="text" name="progress" id="progress"
						class="form-control" style="text-align: left;" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5a-zA-Z0-9\w]/g,'')"
						placeholder="${dutyLog.progress==null?0:(dutyLog.progress>100?100:dutyLog.progress)}%">
					</td>
				</tr>
				 <tr>
			    	<th class="a">附件文档:</th>
			    	<td class="b">
			    	<input type="file" name="file"
					id="inputfile" class="form-control" style="  text-align: left;">
			    	</td>
		     	</tr>

				<tr>
					<th class="a">备注</th>
					<td class="b"><input class="form-control" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5a-zA-Z0-9\w]/g,'')"
						style="text-align: left;" type="text" name="note"
						value=""></td>
				</tr>
				<!-- <tr>
					<th class="a">工单内容：</th>
					<td class="b"><input class="form-control"
						style="width: 100%; text-align: left;" type="text" name="content"
						value=""></td>
				</tr> -->
		</table>
			<div class="col-md-12 text-center">
		       <button type="button" class="btn btn-primary btn-lg" onclick="isValid(this);">保 存</button>
		    </div>
		</form>
	</div>
	<div class="cls"></div>
	<%@ include file="../foot.jsp"%>
	
</body>
</html>