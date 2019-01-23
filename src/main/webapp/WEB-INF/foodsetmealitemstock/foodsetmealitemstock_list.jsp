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
  <title>${appName}_配方明细库存管理</title>
</head>
<body>
<%@ include file="../top.jsp" %>
<%@ include file="../left.jsp" %>
<div class="place">
  <span>位置：</span>
  <ul class="placeul">
    <li><a href="<%=basePath%>manage/index.html">首页</a></li>
    <li><a href="<%=basePath%>manage/foodsetmealitemstock.html">配方明细库存列表</a></li>
  </ul>
</div>
<div class="rightContainer">

  <button class="btn btn-primary" onclick="window.location.reload()">
    <span class="glyphicon glyphicon-refresh"></span> 刷新
  </button>
  <button class="btn btn-primary" onclick="LW.location.forward('<%=basePath%>manage/foodsetmealitemstock/post.html')">
    <span class="glyphicon glyphicon-plus"></span> 新增
  </button>

  <div class="cls"></div>
  <table fit="true" fitColumns="true" class="table table-striped table-hover table-bordered">
    <!-- begin -->
    <thead>
    <tr>
      <th>id</th>
      <th>录入日期时间</th>
      <th>修改日期时间</th>
      <th>配方明细ID</th>
      <th>库存ID</th>
      <th>操作</th>
    </tr>
    </thead>

    <tbody>
    <c:forEach items="${pager.datas}" var="item">
      <tr>
        <td>${item.id}</td>
        <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.adddate}" /></td>
        <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.editdate}" /></td>
        <td>${item.foodSetMealItemId}</td>
        <td>${item.stockId}</td>
        <td>
          <a href="<%=basePath%>manage/foodsetmealitemstock/${item.id}.html">编辑</a>
          <a href="javascript:void(0)" onclick="LW.foodsetmealitemstock.del(${item.id})">删除</a></td>
      </tr>
    </c:forEach>
    </tbody>
    <!-- end -->
  </table>
  <nav>
    <span>当前${pager.pageNo}/${pager.totalPage} 共${pager.totalCount}条数据</span>
    <div class="btn-group pull-right" role="group">
      <a href="<%=basePath%>manage/foodsetmealitemstock.html" class="btn btn-default">首页</a>
      <a href="<%=basePath%>manage/foodsetmealitemstock.html?pageNo=${pager.prePage}"
         class="btn btn-default">上一页</a>
      <a href="<%=basePath%>manage/foodsetmealitemstock.html?pageNo=${pager.nextPage}"
         class="btn btn-default">下一页</a>
      <a href="<%=basePath%>manage/foodsetmealitemstock.html?pageNo=${pager.totalPage}"
         class="btn btn-default">尾页</a>
    </div>
  </nav>
</div>
<div class="cls"></div>
<script type="text/javascript">
    $("#page_foodsetmealitemstock").parent().attr("class", "active");
    LW.foodsetmealitemstock = {};
    LW.foodsetmealitemstock.del = function (id) {
        LW.message.confirm("id", "您确认要继续删除吗?", function (r) {
            if (r) {
                LW.location.forward("manage/foodsetmealitemstock/del/" + id + ".html");
            }
        });
    }
</script>
<%@ include file="../foot.jsp" %>
</body>
</html>
