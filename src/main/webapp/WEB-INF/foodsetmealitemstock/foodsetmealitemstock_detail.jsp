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
  <title>${appName}_配方明细库存管理</title>
</head>
<body>
<%@ include file="../top.jsp" %>
<%@ include file="../left.jsp" %>
<div class="place">
  <span>位置：</span>
  <ul class="placeul">
    <li><a href="<%=basePath%>sys/index.html">首页</a></li>
    <li><a href="<%=basePath%>manage/foodsetmealitemstock.html">配方明细库存列表</a></li>
    <li><a href="<%=basePath%>manage/foodsetmealitemstock/post.html">修改配方明细库存</a></li>
  </ul>
</div>
<div class="rightContainer">
  <script src="<%=basePath%>resources/My97DatePicker/WdatePicker.js"></script>

  <form class="form-horizontal" role="form" method="post" action="<%=basePath%>manage/foodsetmealitemstock/edit.html"
        id="userForm">
    <input type="hidden" name="id" value="${foodSetMealItemStock.id}"/>
    <div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse"
         data-parent="#accordion" href="#panelInfo">修改配方明细库存
    </div>
    <div id="panelInfo" class="panel-collapse collapse in">
      <div class="panel-body">
        <table class="table table-bordered">
          <!-- begin -->
          <tr>
            <td class="info col-md-1 text-right"><span class="red">*</span>配方明细ID</td>
            <td class="col-md-11">
              <input type="number" class="form-control"  maxlength="50" datatype="*1-50"
                     name="foodSetMealItemId" value="${foodSetMealItemStock.foodSetMealItemId}" placeholder="请选择配方明细ID" nullmsg="请输入库存ID"
                     errormsg="请选择配方明细ID至少1个字符,最多50个字符！"/>
            </td>
          </tr>

          <tr>
            <td class="info col-md-1 text-right"><span class="red">*</span>库存ID</td>
            <td class="col-md-11">
              <input type="number" class="form-control"  maxlength="50" datatype="*1-50"
                     name="stockId" value="${foodSetMealItemStock.stockId}" placeholder="请输入库存ID" nullmsg="请输入库存ID"
                     errormsg="库存ID至少1个字符,最多50个字符！"/>
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
    $("#page_foodsetmealitemstock").parent().attr("class", "active");
    $(function () {
        LW.form.validate("userForm");
    });
    $("input[name='pushStatus'][value='${crmPurchacsePushLog.pushStatus}']").attr("checked", true);
</script>
<%@ include file="../foot.jsp" %>
</body>
</html>