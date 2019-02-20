<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%
    java.util.Date date = new java.util.Date();
    DateFormat formatter = new SimpleDateFormat("HH:mm:ss");
    String Fordate = "";
    String Todate = "";
    try {
        Fordate = request.getParameter("Fordate").trim();
        Todate = request.getParameter("Todate").trim();
    } catch (Exception ignored) {
    }
    if (Fordate.equals("") || Todate.equals("")) {
        pageContext.setAttribute("Fordate", formatter.format(date));
        pageContext.setAttribute("Todate", formatter.format(date));
    } else {
        pageContext.setAttribute("Fordate", Fordate);
        pageContext.setAttribute("Todate", Todate);
    }
    try {
        pageContext.setAttribute("lotteryid", request.getParameter("lotteryid").trim());
    } catch (Exception ignored) {
    }
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8;"/>
    <%@ include file="../tag.jsp" %>
    <title>${appName}_柜门管理管理</title>
</head>
<body>
<%@ include file="../top.jsp" %>
<%@ include file="../left.jsp" %>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="<%=basePath%>sys/index.html">首页</a></li>
        <li><a href="<%=basePath%>manage/lgsdoorinfo.html">柜门管理列表</a></li>
        <li><a href="<%=basePath%>manage/lgsdoorinfo/post.html">添加柜门管理</a></li>
    </ul>
</div>
<div class="rightContainer">
    <script src="<%=basePath%>resources/My97DatePicker/WdatePicker.js"></script>
    <form class="form-horizontal" role="form" method="post" action="<%=basePath%>manage/lgsdoorinfo/post.html"
          id="userForm" autocomplete="off">
        <div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse"
             data-parent="#accordion" href="#panelInfo">添加柜门管理
        </div>
        <div id="panelInfo" class="panel-collapse collapse in">
            <div class="panel-body">
                <table class="table table-bordered">
				<!-- begin -->
<tr>
<td class="info col-md-1 text-right"><span class="red">*</span>name</td>
<td class="col-md-11">
<input type="text" class="form-control" value="" maxlength="50" datatype="*1-50"
name="name" placeholder="请输入name" nullmsg="请输入name" errormsg="name至少1个字符,最多50个字符！" />
</td>
</tr>

<tr>
<td class="info col-md-1 text-right"><span class="red">*</span>door_no</td>
<td class="col-md-11">
<input type="text" class="form-control" value="" maxlength="50" datatype="*1-50"
name="doorNo" placeholder="请输入door_no" nullmsg="请输入door_no" errormsg="door_no至少1个字符,最多50个字符！" />
</td>
</tr>

<tr>
<td class="info col-md-1 text-right"><span class="red">*</span>remark</td>
<td class="col-md-11">
<input type="text" class="form-control" value="" maxlength="50" datatype="*1-50"
name="remark" placeholder="请输入remark" nullmsg="请输入remark" errormsg="remark至少1个字符,最多50个字符！" />
</td>
</tr>
<!-- end -->
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
    $("#page_lgsdoorinfo").parent().attr("class", "active");
    $(function () {
        LW.form.validate("userForm");
    });
</script>
<%@ include file="../foot.jsp" %>
</body>
</html>