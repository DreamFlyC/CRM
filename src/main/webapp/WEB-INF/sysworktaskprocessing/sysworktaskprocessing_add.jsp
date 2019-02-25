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
    <title>${appName}_工作任务处理管理管理</title>
</head>
<body>
<%@ include file="../top.jsp" %>
<%@ include file="../left.jsp" %>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="<%=basePath%>sys/index.html">首页</a></li>
        <li><a href="<%=basePath%>manage/sysworktaskprocessing.html">工作任务处理管理列表</a></li>
        <li><a href="<%=basePath%>manage/sysworktaskprocessing/post.html">添加工作任务处理管理</a></li>
    </ul>
</div>
<div class="rightContainer">
    <script src="<%=basePath%>resources/My97DatePicker/WdatePicker.js"></script>
    <form class="form-horizontal" role="form" method="post" action="<%=basePath%>manage/sysworktaskprocessing/post.html"
          id="userForm" autocomplete="off">
        <div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse"
             data-parent="#accordion" href="#panelInfo">添加工作任务处理管理
        </div>
        <div id="panelInfo" class="panel-collapse collapse in">
            <div class="panel-body">
                <table class="table table-bordered">
                    <!-- begin -->
                    <tr>
                        <td class="info col-md-1 text-right"><span class="red">*</span>processing_number</td>
                        <td class="col-md-11">
                            <input type="text" class="form-control" value="" maxlength="50" datatype="*1-50"
                                   name="processingNumber" placeholder="请输入processing_number"
                                   nullmsg="请输入processing_number" errormsg="processing_number至少1个字符,最多50个字符！"/>
                        </td>
                    </tr>

                    <tr>
                        <td class="info col-md-1 text-right"><span class="red">*</span>title</td>
                        <td class="col-md-11">
                            <input type="text" class="form-control" value="" maxlength="50" datatype="*1-50"
                                   name="title" placeholder="请输入title" nullmsg="请输入title"
                                   errormsg="title至少1个字符,最多50个字符！"/>
                        </td>
                    </tr>

                    <tr>
                        <td class="info col-md-1 text-right"><span class="red">*</span>remark</td>
                        <td class="col-md-11">
                            <input type="text" class="form-control" value="" maxlength="50" datatype="*1-50"
                                   name="remark" placeholder="请输入remark" nullmsg="请输入remark"
                                   errormsg="remark至少1个字符,最多50个字符！"/>
                        </td>
                    </tr>

                    <tr>
                        <td class="info col-md-1 text-right"><span class="red">*</span>完成进度</td>
                        <td class="col-md-11">
                            <input type="number" class="form-control" value="" maxlength="50" datatype="*1-50"
                                   name="progress" placeholder="请输入完成进度" nullmsg="请输入完成进度"
                                   errormsg="完成进度至少1个字符,最多50个字符！"/>
                        </td>
                    </tr>

                    <tr>
                        <td class="info col-md-1 text-right"><span class="red">*</span>type</td>
                        <td class="col-md-11">
                            <input type="number" class="form-control" value="" maxlength="50" datatype="*1-50"
                                   name="type" placeholder="请输入type" nullmsg="请输入type" errormsg="type至少1个字符,最多50个字符！"/>
                        </td>
                    </tr>

                    <tr>
                        <td class="info col-md-1 text-right"><span class="red">*</span>开始日期时间</td>
                        <td class="col-md-11">
                            <input type="text" style="text-align: left;" class="form-control" required
                                   name="startTime" placeholder=" 请选择开始日期时间"
                            onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" onchange="" />
                        </td>
                    </tr>

                    <tr>
                        <td class="info col-md-1 text-right"><span class="red">*</span>结束日期时间</td>
                        <td class="col-md-11">
                            <input type="text" style="text-align: left;" class="form-control" required
                                   name="endTime" placeholder=" 请选择结束日期时间"
                            onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" onchange="" />
                        </td>
                    </tr>

                    <tr>
                        <td class="info col-md-1 text-right"><span class="red">*</span>状态 0未完成 1已完成</td>
                        <td class="col-md-11">
                            <input type="number" class="form-control" value="" maxlength="50" datatype="*1-50"
                                   name="status" placeholder="请输入状态 0未完成  1已完成" nullmsg="请输入状态 0未完成  1已完成"
                                   errormsg="状态 0未完成  1已完成至少1个字符,最多50个字符！"/>
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
    $("#page_sysworktaskprocessing").parent().attr("class", "active");
    $(function () {
        LW.form.validate("userForm");
    });
</script>
<%@ include file="../foot.jsp" %>
</body>
</html>