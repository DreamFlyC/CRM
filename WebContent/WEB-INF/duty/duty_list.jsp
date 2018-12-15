<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.lang.String"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
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
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<link href="<%=basePath%>resources/plugin/bootstrap3.3.2/css/bootstrap.min.css" rel="stylesheet" />
<link href="<%=basePath%>resources/css/system.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>resources/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>resources/fonts/fontawesome-webfont.woff2" />
<script src="<%=basePath%>resources/duty/js/My97DatePicker/WdatePicker.js"></script>
<script src="<%=basePath%>resources/js/jquery.min.js" type="text/javascript"></script>
<script src="<%=basePath%>resources/plugin/bootstrap3.3.2/js/bootstrap.min.js"></script>  
<title>${appName}_工单列表信息管理</title>

<style type="text/css">
table thead tr th, table tbody tr td {
	text-align: center;
}
body{
	background-color:#f7f7f7;
	min-width: 100% !important;
}
.col-sm-12{
	margin:10px 0;
	/* padding-left:0px !important; */
}
.dutylist{
	background-color:#fff;
	margin: 15px 0px;
}
.dutyname{
	color: #999;
}
.dutytitle{
	font-size:20px;
}
.dutylevel{
	position: absolute;
	left:80%;
	top:5%;
}
.dutycontent div{
	margin: 5px 0px;
}
span{
	font-size: 16px;
}

.navbar-header {
	background-color:#fff;
}
.navbar-inverse {
     background-color: #fff; 
     border-color: #fff; 
}
.navbar-inverse .navbar-toggle {
    border-color: #eee;
}
.navbar-inverse .navbar-toggle:hover {
    background-color: #eee;
}
.navbar-inverse .navbar-toggle .icon-bar {
    background-color: #337ab7;
}


.dutyfn{
	position: absolute;
	left:73%;
	top:77%;
}
.navbar-inverse .navbar-toggle {
    border-color: #fff;
}
</style>

</head>
<body>
 <div class="navbar navbar-inverse navbar-fixed-top" style=" opacity: 0.98;">  
       <div class="container">
	       <div class="" style="width:80%">
				<select class="form-control" style="width: 100%;float: left;margin: 10px 0px;" onchange="selectDkey($('#SelectDkey option:selected').val())" id="SelectDkey" >
					<option value="0">所有工单</option>
					<option value="3">未接受工单</option>
					<option value="2">进行中工单</option>
					<option value="1"> 已完成工单</option>
				</select>
			</div>
           <div class="navbar-header header-logo">
               <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navBar" style="margin-top: 5px;">  
               		<i class="fa fa-search fa-2x" aria-hidden="true"></i>
               </button>
           </div> 
    		<div class="collapse navbar-collapse " id="navBar" > 
			<form action="duty/duty_list" method="post" onsubmit="return isValid(this)" id="form1" name="indexForm">
				<input type="hidden" name="dkey" value="${dkey}" id="dkey">
				<input type="hidden" name="type" value="1" id="type">
				<div class="col-sm-12 col-md-12">
					<span class="">工单编号：</psan>
					<input type="text" name="number" id="number" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5a-zA-Z0-9\w]/g,'')"
						value="${number}" class="form-control" placeholder="请输入工单编号">
				</div>
				<div class="col-sm-12 col-md-6">
					<span>工单名称：</span>
					<input type="text" name="title" id="title" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5a-zA-Z0-9\w]/g,'')"
					class="form-control" value="${title}"placeholder="请输入工单名称">
				</div>
				<div class="col-sm-12 col-md-6">
					<span>工单周期：</span>
					<input type="text" name="sdate" id="sdate"class="form-control" 
		 				data-options="{'type':'YYYY-MM-DD','beginYear':2010,'endYear':2088}"
		 				placeholder="请选择开始时间" />
					<span>至</span>
					<input type="text" name="edate" id="edate"class="form-control"
		 				data-options="{'type':'YYYY-MM-DD','beginYear':2010,'endYear':2088}"
		 				placeholder="请选择结束时间" />
				</div>
				<div class="col-sm-12 col-md-6">
					<input type="submit" value="查&nbsp;询" class="form-control btn-primary">
				</div>
			</form>
		</div> 
    </div> 
</div>
    <div style="margin-top:41px;">
        &nbsp;
    </div>
	
	<div class="container">
		<div class="col-md-12 col-sm-12" style="width: 100%;padding-left:0px;padding-right:0px;">
			<button class="btn btn-default" style="width:100%;background-color: #337ab7;color:white;" 
			onclick="window.location.href='duty/duty_add.html'">添加工单</button>
		</div>
		<div style="margin-top: -15px;"></div>
		<script type="text/javascript">
			function selectDkey(dkey){
				if(dkey!=0){
					window.location.href="duty/duty_list.html?dkey="+dkey;
				}else{
					window.location.href="duty/duty_list.html";
				}
			}
		</script>
	</div>
	<c:choose>
		<c:when test="${pager.datas.size() >0}">
			<c:forEach items="${pager.datas}" var="duty" >
		
				<div class="dutylist">
					<div class="container dutycontent" style="position:relative;">
						<div>
							<span class="dutytitle">${duty.title}</span>
						</div>
						<div>
							<span class="dutyname">工单编号：</span>
							<span>${duty.number}</span>
						</div>
						<div>
							<span class="dutyname">发起人：</span>
							<span>吴慧</span>
						</div>
						<div>
							<span class="dutyname">执行人：</span>
							<span>${duty.user}</span>
						</div>
						<div>
							<span class="dutyname">开始时间：</span>
							<span><fmt:formatDate value="${duty.startdate}" pattern="yyyy-MM-dd HH:mm" />&nbsp;<span>
						</div>
						<div>
							<span class="dutyname">截止时间：</span>
							<span><fmt:formatDate value="${duty.enddate}" pattern="yyyy-MM-dd HH:mm" />&nbsp;<span>
						</div>
						<div>
							<span class="dutyname">发布时间：</span>
							<span><fmt:formatDate value="${duty.date}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
						</div>
						<div>
							<span class="dutyname a dkey${duty.id}"style="line-height: 2.5em;" name="dkey${duty.id}">状态：</span>
							<span>${duty.dkey==1?"<span style='color:#e91ca7;'>已完成</span>":(duty.dkey==2 ? "<span style='color:#09b4f9'>进行中</span>":"<span style='color:#EE0000;'>未接受</span>")}</span>
						</div>
						<div class="dutylevel">
							${duty.level==1?"<span style='color:#62b900;font-size:20px;'>普通</span>":(duty.level==2?"<span style='color:red;font-size:20px;'>紧急</sapn>":"") }
						</div>
						<div class="dutyfn">
							<button class="btn btn-default" onclick="window.location.href='duty/usermanag.html?id=${duty.id}'">查看详情</button>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:when>
	</c:choose>
	
		<c:if test="${pager.datas.size()<=0||pager.datas.size()==null}">
			<div style="text-align: center;margin: 100px auto;">
				<p style="font-size: 16px;">没有找到数据记录</p>
			</div>
		</c:if>
		
		<div class="container" style="text-align: right;">
			<span>当前${pager.pageNo}/${pager.totalPage}
				共${pager.totalCount}条数据</span>
		</div>
	</div>
	<script type="text/javascript" src="<%=basePath%>resources/duty/js/jquery.date.js"></script>	
 	<script type="text/javascript">
		$.date("#sdate");
		$.date("#edate");
	</script>
 	<script type="text/javascript">
 	$(function(){
	 	$("#SelectDkey").val(${dkey});
	 	
 	});
		function isValid() {
			if (form1.sdate.value != "" && form1.edate.value == "") {
				LW.message.show("请选择工单结束日期!");
				form1.edate.select();
				return false;
			}
			if (form1.edate.value != "" && form1.sdate.value == "") {
				LW.message.show("请选择工单开始日期!");
				form1.sdate.select();
				return false;
			}

			if (form1.number.value == "" && form1.title.value == ""
					&& form1.edate.value == "" && form1.sdate.value == "") {
				LW.message.show("请输入查询条件！");
				form1.number.select();
				return false;
			}
			if ($("#edate").val() < $("#sdate").val()) {
				LW.message.show("日期不合法，请重新选择日期!");
				document.getElementById("sdate").value = "";
				document.getElementById("edate").value = "";
				form1.sdate.select();
				return false;
			}
		}		
	</script>
</body>
</html>