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
    <title>${appName}_商品类型管理</title>
</head>
<body>
<%@ include file="../top.jsp" %>
<%@ include file="../left.jsp" %>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="<%=basePath%>manage/index.html">首页</a></li>
        <li><a href="<%=basePath%>manage/wxbshopgoodstype.html">商品类型列表</a></li>
    </ul>
</div>
<div class="rightContainer">

    <button class="btn btn-primary" onclick="window.location.reload()">
        <span class="glyphicon glyphicon-refresh"></span> 刷新
    </button>
    <button class="btn btn-primary" onclick="LW.location.forward('<%=basePath%>manage/wxbshopgoodstype/post.html')">
        <span class="glyphicon glyphicon-plus"></span> 新增
    </button>

    <div class="cls"></div>
    <table fit="true" fitColumns="true" class="table table-striped table-hover table-bordered">
        <!-- begin -->
        <thead>
        <tr>
            <th>id</th>
            <th>member_miniapp_id</th>
            <th>goods_id</th>
            <th>分类名称</th>
            <th>库存</th>
            <th>价格</th>
            <th>是否删除</th>
            <th>添加时间</th>
            <th>add_ip</th>
            <th>操作</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach items="${pager.datas}" var="item">
            <tr>
                <td>${item.id}</td>
                <td>${item.memberMiniappId}</td>
                <td>${item.goodsId}</td>
                <td>${item.typeName}</td>
                <td>${item.surplusNum}</td>
                <td>${item.price}</td>
                <td>${item.isDelete==true?'是':'否'}</td>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.addTime}"/></td>
                <td>${item.addIp}</td>
                <td>
                    <a href="<%=basePath%>manage/wxbshopgoodstype/${item.id}.html">编辑</a>
                    <a href="javascript:void(0)" onclick="LW.wxbshopgoodstype.del(${item.id})">删除</a></td>
            </tr>
        </c:forEach>
        </tbody>
        <!-- end -->
    </table>
    <nav>
        <span>当前${pager.pageNo}/${pager.totalPage} 共${pager.totalCount}条数据</span>
        <div class="btn-group pull-right" role="group">
            <a href="<%=basePath%>manage/wxbshopgoodstype.html" class="btn btn-default">首页</a>
            <a href="<%=basePath%>manage/wxbshopgoodstype.html?pageNo=${pager.prePage}"
               class="btn btn-default">上一页</a>
            <a href="<%=basePath%>manage/wxbshopgoodstype.html?pageNo=${pager.nextPage}"
               class="btn btn-default">下一页</a>
            <a href="<%=basePath%>manage/wxbshopgoodstype.html?pageNo=${pager.totalPage}"
               class="btn btn-default">尾页</a>
        </div>
    </nav>
</div>
<div class="cls"></div>
<script type="text/javascript">
    $("#page_wxbshopgoodstype").parent().attr("class", "active");
    LW.wxbshopgoodstype = {};
    LW.wxbshopgoodstype.del = function (id) {
        LW.message.confirm("id", "您确认要继续删除吗?", function (r) {
            if (r) {
                LW.location.forward("manage/wxbshopgoodstype/del/" + id + ".html");
            }
        });
    }
</script>
<%@ include file="../foot.jsp" %>
</body>
</html>
