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
    <title>${appName}_商品类型管理</title>
</head>
<body>
<%@ include file="../top.jsp" %>
<%@ include file="../left.jsp" %>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="<%=basePath%>sys/index.html">首页</a></li>
        <li><a href="<%=basePath%>manage/wxbshopgoodstype.html">商品类型列表</a></li>
        <li><a href="<%=basePath%>manage/wxbshopgoodstype/post.html">添加商品类型</a></li>
    </ul>
</div>
<div class="rightContainer">
    <script src="<%=basePath%>resources/My97DatePicker/WdatePicker.js"></script>
    <form class="form-horizontal" role="form" method="post" action="<%=basePath%>manage/wxbshopgoodstype/post.html"
          id="userForm" autocomplete="off">
        <div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse"
             data-parent="#accordion" href="#panelInfo">添加商品类型
        </div>
        <div id="panelInfo" class="panel-collapse collapse in">
            <div class="panel-body">
                <table class="table table-bordered">
                    <!-- begin -->
                    <tr>
                        <td class="info col-md-1 text-right"><span class="red">*</span>member_miniapp_id</td>
                        <td class="col-md-11">
                            <input type="number" class="form-control" value="" maxlength="50" datatype="*1-50"
                                   name="memberMiniappId" placeholder="请输入member_miniapp_id"
                                   nullmsg="请输入member_miniapp_id" errormsg="member_miniapp_id至少1个字符,最多50个字符！"/>
                        </td>
                    </tr>

                    <tr>
                        <td class="info col-md-1 text-right"><span class="red">*</span>goods_id</td>
                        <td class="col-md-11">
                            <input type="number" class="form-control" value="" maxlength="50" datatype="*1-50"
                                   name="goodsId" placeholder="请输入goods_id" nullmsg="请输入goods_id"
                                   errormsg="goods_id至少1个字符,最多50个字符！"/>
                        </td>
                    </tr>

                    <tr>
                        <td class="info col-md-1 text-right"><span class="red">*</span>分类名称</td>
                        <td class="col-md-11">
                            <input type="text" class="form-control" value="" maxlength="50" datatype="*1-50"
                                   name="typeName" placeholder="请输入分类名称" nullmsg="请输入分类名称"
                                   errormsg="分类名称至少1个字符,最多50个字符！"/>
                        </td>
                    </tr>

                    <tr>
                        <td class="info col-md-1 text-right"><span class="red">*</span>库存</td>
                        <td class="col-md-11">
                            <input type="number" class="form-control" value="" maxlength="50" datatype="*1-50"
                                   name="surplusNum" placeholder="请输入库存" nullmsg="请输入库存" errormsg="库存至少1个字符,最多50个字符！"/>
                        </td>
                    </tr>

                    <tr>
                        <td class="info col-md-1 text-right"><span class="red">*</span>价格</td>
                        <td class="col-md-11">
                            <input type="number" step="0.01" class="form-control" value="" maxlength="50"
                                   datatype="*1-50"
                                   name="price" placeholder="请输入价格" nullmsg="请输入价格" errormsg="价格至少1个字符,最多50个字符！"/>
                        </td>
                    </tr>

                    <tr>
                        <td class="info col-md-1 text-right"><span class="red">*</span>是否删除</td>
                        <td class="col-md-11">
                            <select name="isDelete" id="isDelete" class="form-control">
                            <option value="0" selected="selected">未删除</option>
                            <option value="1">已删除</option>
                        </select>

                        </td>
                    </tr>

                    <tr>
                        <td class="info col-md-1 text-right"><span class="red">*</span>add_ip</td>
                        <td class="col-md-11">
                            <input type="text" class="form-control" value="" maxlength="50" datatype="*1-50"
                                   name="addIp" placeholder="请输入add_ip" nullmsg="请输入add_ip"
                                   errormsg="add_ip至少1个字符,最多50个字符！"/>
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
    $("#page_wxbshopgoodstype").parent().attr("class", "active");
    $(function () {
        LW.form.validate("userForm");
    });
</script>
<%@ include file="../foot.jsp" %>
</body>
</html>