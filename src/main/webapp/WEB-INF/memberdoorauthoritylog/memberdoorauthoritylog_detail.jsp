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
  <title>${appName}_开门权限日记管理</title>
</head>
<body>
<%@ include file="../top.jsp" %>
<%@ include file="../left.jsp" %>
<div class="place">
  <span>位置：</span>
  <ul class="placeul">
    <li><a href="<%=basePath%>sys/index.html">首页</a></li>
    <li><a href="<%=basePath%>manage/memberdoorauthoritylog.html">开门权限日记管理列表</a></li>
    <li><a href="<%=basePath%>manage/memberdoorauthoritylog/post.html">修改开门权限日记管理</a></li>
  </ul>
</div>
<div class="rightContainer">
  <script src="<%=basePath%>resources/My97DatePicker/WdatePicker.js"></script>

  <form class="form-horizontal" role="form" method="post" action="<%=basePath%>manage/memberdoorauthoritylog/edit.html"
        id="userForm" autocomplete="off">
    <input type="hidden" name="id" value="${memberDoorAuthorityLog.id}"/>
    <div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse"
         data-parent="#accordion" href="#panelInfo">修改开门权限日记管理
    </div>
    <div id="panelInfo" class="panel-collapse collapse in">
      <div class="panel-body">
        <table class="table table-bordered">
          <!-- begin -->
          <tr>
            <td class="info col-md-1 text-right"><span class="red">*</span>member_id</td>
            <td class="col-md-11">
              <input type="number" class="form-control" maxlength="50" datatype="*1-50"
                     name="memberId" value="${memberDoorAuthorityLog.memberId}" placeholder="请输入member_id"
                     nullmsg="请输入member_id" errormsg="member_id至少1个字符,最多50个字符！"/>
            </td>
          </tr>

          <tr>
            <td class="info col-md-1 text-right"><span class="red">*</span>door_id</td>
            <td class="col-md-11">
              <input type="number" class="form-control" maxlength="50" datatype="*1-50"
                     name="doorId" value="${memberDoorAuthorityLog.doorId}" placeholder="请输入door_id"
                     nullmsg="请输入door_id" errormsg="door_id至少1个字符,最多50个字符！"/>
            </td>
          </tr>

          <tr>
            <td class="info col-md-1 text-right"><span class="red">*</span>类型</td>
            <td class="col-md-11">
              <input type="number" class="form-control" maxlength="50" datatype="*1-50"
                     name="type" value="${memberDoorAuthorityLog.type}" placeholder="请输入类型" nullmsg="请输入类型"
                     errormsg="类型至少1个字符,最多50个字符！"/>
            </td>
          </tr>

          <tr>
            <td class="info col-md-1 text-right"><span class="red">*</span>登录时间</td>
            <td class="col-md-11">
              <input class="form-control" style="  text-align: left;" type="text" name="loginTime" id="loginTime"
                  autocomplete="off"
                  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss '})"
                  value="<fmt:formatDate value='${memberDoorAuthorityLog.loginTime}' pattern='yyyy-MM-dd HH:mm:ss' />" />
            </td>
          </tr>

          <tr>
            <td class="info col-md-1 text-right"><span class="red">*</span>状态</td>
            <td class="col-md-11">
              <input type="number" class="form-control" maxlength="50" datatype="*1-50"
                     name="status" value="${memberDoorAuthorityLog.status}" placeholder="请输入状态" nullmsg="请输入状态"
                     errormsg="状态至少1个字符,最多50个字符！"/>
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
    $("#page_memberdoorauthoritylog").parent().attr("class", "active");
    $(function () {
        LW.form.validate("userForm");
    });
    $("input[name='pushStatus'][value='${crmPurchacsePushLog.pushStatus}']").attr("checked", true);
</script>
<%@ include file="../foot.jsp" %>
</body>
</html>