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
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<link href="<%=basePath%>resources/duty/css/dutymobile.css" rel="stylesheet" type="text/css" />
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
	<div class="rightContainer">
		<form action="duty/savelog.html" method="get" enctype="multipart/form-data"
			class="form-horizontal" name="form1" id="form1">
			<input type="hidden" name="id" id="id" value="${duty.id}">
			<input type="hidden" name="uid" id="uid" value="${uid}">
			
			<div style="height:400px;width:100%;">
					<div class="addcont addmar">
			 			<span class="text-left">完成进度(%)</span>
		 				<input type="number" name="progress" id="progress"
						class="form-control right adduser" style="width: 66%;border:0;height: 45px;text-align: right;" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5a-zA-Z0-9\w]/g,'')"
						placeholder="${dutyLog.progress==null?0:(dutyLog.progress>100?100:dutyLog.progress)}%">
			 		</div>
			 		
			 		<div class="addcont" style="height: 157px;">
			 			<span class="text-left" style="line-height: 157px;">附件文档</span>
			 			<input type="file" name="file" id="titleFile" style="display:none" onchange="LW.util.uploadFile(this)" />
						<img id="titleFilebig" src="<%=basePath%>resources/images/no_file.gif" width="145" height="136" style="cursor:pointer;float:right;margin: 10px 0px;" onclick="$('#titleFile').click()" />
						<input type="hidden" name="appendix" id="titleFilePath" value="" />
			 		</div>
			 		
			 		<textarea row="50" col="5" name="note" class="addtitle addtext" style="margin-top: 10px;"
					onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5a-zA-Z0-9\w]/g,'')"
					placeholder="填写备注信息"></textarea>
			 		
			</div>
			<div class="col-md-12 text-center" style="margin-top: 20px;">
		       <button type="button" class="btn btn-primary btn-lg" onclick="isValid(this);">保 存</button>
		    </div>
		</form>
	</div>
	<div class="cls"></div>
</body>
</html>