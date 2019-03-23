<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.text.*" %>
<%
    java.util.Date date = new java.util.Date();
    DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
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


    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8;"/>
    <%@ include file="../tag.jsp" %>
    <title>${appName}_TITLE管理</title>
</head>
<body>
<%@ include file="../top.jsp" %>
<%@ include file="../left.jsp" %>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="<%=basePath%>manage/index.html">首页</a></li>
        <li><a href="<%=basePath%>manage/aabbcc.html">TITLE列表</a></li>
    </ul>
</div>
<div class="rightContainer">

    <button class="btn btn-primary" onclick="window.location.reload()">
        <span class="glyphicon glyphicon-refresh"></span> 刷新
    </button>
    <button class="btn btn-primary" onclick="LW.location.forward('<%=basePath%>manage/aabbcc/post.html')">
        <span class="glyphicon glyphicon-plus"></span> 新增
    </button>

    <div class="cls"></div>
    <table fit="true" fitColumns="true" class="table table-striped table-hover table-bordered">
	<!-- begin -->here<!-- end -->
    </table>
    <nav>
        <span>当前${pager.pageNo}/${pager.totalPage} 共${pager.totalCount}条数据</span>
        <div class="btn-group pull-right" role="group">
            <a href="<%=basePath%>manage/aabbcc.html" class="btn btn-default">首页</a>
            <a href="<%=basePath%>manage/aabbcc.html?pageNo=${pager.prePage}"
               class="btn btn-default">上一页</a>
            <a href="<%=basePath%>manage/aabbcc.html?pageNo=${pager.nextPage}"
               class="btn btn-default">下一页</a>
            <a href="<%=basePath%>manage/aabbcc.html?pageNo=${pager.totalPage}"
               class="btn btn-default">尾页</a>
        </div>
    </nav>
</div>
<div class="cls"></div>
<script type="text/javascript">
    $("#page_aabbcc").parent().attr("class", "active");
    LW.aabbcc = {};
    LW.aabbcc.del = function (id) {
        LW.message.confirm("id", "您确认要继续删除吗?", function (r) {
            if (r) {
                LW.location.forward("manage/aabbcc/del/" + id + ".html");
            }
        });
    }
</script>
<%@ include file="../foot.jsp" %>
</body>
</html>
