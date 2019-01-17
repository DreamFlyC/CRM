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
  <title>${appName}_溯源产品检测报告管理</title>
</head>
<body>
<%@ include file="../top.jsp" %>
<%@ include file="../left.jsp" %>
<div class="place">
  <span>位置：</span>
  <ul class="placeul">
    <li><a href="<%=basePath%>sys/index.html">首页</a></li>
    <li><a href="<%=basePath%>manage/traceabilitysurveyreport.html">溯源产品检测报告列表</a></li>
    <li><a href="<%=basePath%>manage/traceabilitysurveyreport/post.html">修改溯源产品检测报告</a></li>
  </ul>
</div>
<div class="rightContainer">
  <script src="<%=basePath%>resources/My97DatePicker/WdatePicker.js"></script>

  <form class="form-horizontal" role="form" method="post"
        action="<%=basePath%>manage/traceabilitysurveyreport/edit.html"
        id="userForm">
    <input type="hidden" name="id" value="${traceabilitySurveyReport.id}"/>
    <div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse"
         data-parent="#accordion" href="#panelInfo">修改溯源产品检测报告
    </div>
    <div id="panelInfo" class="panel-collapse collapse in">
      <div class="panel-body">
        <table class="table table-bordered">
          <!-- begin -->
          <tr>
            <td class="info col-md-1 text-right"><span class="red">*</span>用户ID</td>
            <td class="col-md-11">
              <input type="text" class="form-control" maxlength="50" datatype="*1-50"
                     name="userId" value="${traceabilitySurveyReport.userId}" placeholder="请输入用户ID" nullmsg="请输入用户ID"
                     errormsg="用户ID至少1个字符,最多50个字符！"/>
            </td>
          </tr>

          <tr>
            <td class="info col-md-1 text-right"><span class="red">*</span>类型</td>
            <td class="col-md-11">
              <input type="text" class="form-control" maxlength="50" datatype="*1-50"
                     name="type" value="${traceabilitySurveyReport.type}" placeholder="请输入类型" nullmsg="请输入类型"
                     errormsg="类型至少1个字符,最多50个字符！"/>
            </td>
          </tr>

          <tr>
            <td class="info col-md-1 text-right"><span class="red">*</span>备注</td>
            <td class="col-md-11">
              <input type="text" class="form-control" maxlength="50" datatype="*1-50"
                     name="remark" value="${traceabilitySurveyReport.remark}" placeholder="请输入备注" nullmsg="请输入备注"
                     errormsg="备注至少1个字符,最多50个字符！"/>
            </td>
          </tr>

          <tr>
            <td class="info col-md-1 text-right"><span class="red">*</span>检验报告编码</td>
            <td class="col-md-11">
              <input type="text" class="form-control" maxlength="50" datatype="*1-50"
                     name="codeNumber" value="${traceabilitySurveyReport.codeNumber}" placeholder="请输入检验报告编码"
                     nullmsg="请输入检验报告编码" errormsg="检验报告编码至少1个字符,最多50个字符！"/>
            </td>
          </tr>

          <tr>
            <td class="info col-md-1 text-right"><span class="red">*</span>生产者ID</td>
            <td class="col-md-11">
              <input type="text" class="form-control" maxlength="50" datatype="*1-50"
                     name="producerId" value="${traceabilitySurveyReport.producerId}" placeholder="请输入生产者ID"
                     nullmsg="请输入生产者ID" errormsg="生产者ID至少1个字符,最多50个字符！"/>
            </td>
          </tr>

          <tr>
            <td class="info col-md-1 text-right"><span class="red">*</span>购买者D</td>
            <td class="col-md-11">
              <input type="text" class="form-control" maxlength="50" datatype="*1-50"
                     name="purchaserId" value="${traceabilitySurveyReport.purchaserId}" placeholder="请输入购买者D"
                     nullmsg="请输入购买者D" errormsg="购买者D至少1个字符,最多50个字符！"/>
            </td>
          </tr>

          <tr>
            <td class="info col-md-1 text-right"><span class="red">*</span>检验结果 -1 不合格 1 合格 0为默认</td>
            <td class="col-md-11">
              <input type="text" class="form-control" maxlength="50" datatype="*1-50"
                     name="status" value="${traceabilitySurveyReport.status}" placeholder="请输入检验结果 -1 不合格  1 合格   0为默认"
                     nullmsg="请输入检验结果 -1 不合格  1 合格   0为默认" errormsg="检验结果 -1 不合格  1 合格   0为默认至少1个字符,最多50个字符！"/>
            </td>
          </tr>

          <tr>
            <td class="info col-md-1 text-right"><span class="red">*</span>生产日期</td>
            <td class="col-md-11">
              <input class="form-control" style="  text-align: left;" type="text" name="makeDate" id="makeDate"
                  autocomplete="off"
                  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss '})"
                  value="<fmt:formatDate value='${traceabilitySurveyReport.makeDate}' pattern='yyyy-MM-dd HH:mm:ss' />">
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
    $("#page_traceabilitysurveyreport").parent().attr("class", "active");
    $(function () {
        LW.form.validate("userForm");
    });
    $("input[name='pushStatus'][value='${crmPurchacsePushLog.pushStatus}']").attr("checked", true);
</script>
<%@ include file="../foot.jsp" %>
</body>
</html>