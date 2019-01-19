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
  <title>${appName}_溯源单位管理</title>
</head>
<body>
<%@ include file="../top.jsp" %>
<%@ include file="../left.jsp" %>
<div class="place">
  <span>位置：</span>
  <ul class="placeul">
    <li><a href="<%=basePath%>sys/index.html">首页</a></li>
    <li><a href="<%=basePath%>manage/traceabilityunit.html">溯源单位列表</a></li>
    <li><a href="<%=basePath%>manage/traceabilityunit/post.html">添加溯源单位</a></li>
  </ul>
</div>
<div class="rightContainer">
  <script src="<%=basePath%>resources/My97DatePicker/WdatePicker.js"></script>
  <form class="form-horizontal" role="form" method="post" action="<%=basePath%>manage/traceabilityunit/post.html"
        id="userForm" autocomplete="off">
    <div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse"
         data-parent="#accordion" href="#panelInfo">添加溯源单位
    </div>
    <div id="panelInfo" class="panel-collapse collapse in">
      <div class="panel-body">
        <table class="table table-bordered">
          <!-- begin -->
          <tr>
            <td class="info col-md-1 text-right"><span class="red">*</span>名称</td>
            <td class="col-md-11">
              <input type=text class="form-control" value="" maxlength="50" datatype="*1-50"
                     name="name" placeholder="请输入名称" nullmsg="请输入名称" errormsg="名称至少1个字符,最多50个字符！"/>
            </td>
          </tr>

          <tr>
            <td class="info col-md-1 text-right"><span class="red">*</span>排序</td>
            <td class="col-md-11">
              <input type=number class="form-control" value="" maxlength="50" datatype="*1-50"
                     name="seq" placeholder="请输入排序" nullmsg="请输入排序" errormsg="排序至少1个字符,最多50个字符！"/>
            </td>
          </tr>

          <tr>
            <td class="info col-md-1 text-right"><span class="red">*</span>类型</td>
            <td class="col-md-11">
              <input type=number class="form-control" value="" maxlength="50" datatype="*1-50"
                     name="type" placeholder="请输入类型" nullmsg="请输入类型" errormsg="类型至少1个字符,最多50个字符！"/>
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
    $("#page_traceabilityunit").parent().attr("class", "active");
    $(function () {
        LW.form.validate("userForm");
    });
</script>
<%@ include file="../foot.jsp" %>
</body>
</html>