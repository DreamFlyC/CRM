<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.lang.String" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    java.util.Date date = new java.util.Date();
    DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    String Fordate = "";
    String Todate = "";
    try {
        Fordate = request.getParameter("Fordate").trim();
        Todate = request.getParameter("Todate").trim();
    } catch (Exception e) {

    }

    if (Fordate == null || Fordate.equals("") || Todate == null || Todate.equals("")) {
        pageContext.setAttribute("Fordate", formatter.format(date));
        pageContext.setAttribute("Todate", formatter.format(date));
    } else {
        pageContext.setAttribute("Fordate", Fordate);
        pageContext.setAttribute("Todate", Todate);
    }

    try {
        pageContext.setAttribute("lotteryid", request.getParameter("lotteryid").trim());
    } catch (Exception e) {

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
    <script src="<%=basePath%>resources/duty/js/selectAll.js"></script>
    <title>${appName}_进出货记录明细列表管理</title>
    <style type="text/css">
        table thead tr th, table tbody tr td {
            text-align: center;
            line-height: 30px !important;
        }

        table .btn {
            min-width: 72px !important;
            padding: 5px !important;

        }
    </style>
    <script type="text/javascript">
        $(function () {
            $("#export").click(function () {
                var ids = "";
                $("input:checkbox[name='box']:checked").each(function () {
                    ids += $(this).val() + ",";
                });
                if (ids != "") { //选中导出
                    //window.confirm("确定要导出吗？");
                    LW.message.confirm("id", "确定要导出吗？", function (r) {
                        if (r) {
                            window.location.href = "manage/crmstockinoroutlogitem/export?ids="
                                + ids.substring(0, ids.length - 1); //去掉最后一个逗号
                            $("input[type='checkbox']").attr("checked", false); //将所有的checkbox置为未选中状态
                        }
                    });

                } else if (window.confirm('要导出全部数据吗？')) {
                    //LW.message.show("确定");
                    window.location.href = "manage/crmstockinoroutlogitem/export";
                } else {
                    //LW.message.show("取消");
                    $("input[type='checkbox']").attr("checked", false); //将所有的checkbox置为未选中状态
                    return false;
                }
            });
        });
    </script>
</head>
<body>
<%@ include file="../top.jsp" %>
<%@ include file="../left.jsp" %>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="<%=basePath%>manage/index.html">首页</a></li>
        <li><a href="<%=basePath%>manage/crmstockinoroutlogitem/crmstockinoroutlogitem_list.html">进出货记录明细列表</a></li>
    </ul>
</div>
<div class="rightContainer">

    <button class="btn btn-primary" onclick="javascript:window.location.reload()">
        <span class="glyphicon glyphicon-refresh"></span> 刷新
    </button>
    <button class="btn btn-primary"
            onclick="LW.location.forward('<%=basePath%>manage/crmstockinoroutlogitem/post.html')">
        <span class="glyphicon glyphicon-plus"></span> 新增
    </button>
    <button class="btn btn-primary" id="additem"
            onclick="LW.location.forward('<%=basePath%>manage/crmstockinoroutlogitem/add.html')">
        <span class="glyphicon glyphicon-plus"></span> 新增明细
    </button>
    <button type="button" class="btn btn-primary" id="statistics"
            onclick="LW.location.forward('<%=basePath%>manage/crmstockinoroutlogitem/crmstockinoroutlogitem_statistics')">
        <span class="glyphicon glyphicon-glass"></span> 统计数据
    </button>
    <button type="button" class="btn btn-primary" id="export">
        <span class="glyphicon glyphicon-download-alt"></span> 导出Excel列表
    </button>
    <button class="btn btn-primary" id="delete">
        <span class="glyphicon glyphicon-trash"></span> 清理数据
    </button>

    <script type="text/javascript">
        $(function () {
            $("#delete").click(function () {
                var ids = "";
                $("input:checkbox[name='box']:checked").each(function () {
                    ids += $(this).val() + ",";
                });
                if (ids != "") {
                    if (window.confirm('你确定要删除吗？')) {
                        //fuzhi daozheg did
                        $.ajax({
                            url: "duty/delete?ids="
                                + ids.substring(0, ids.length - 1),
                            type: "get",
                            success: function (e) {
                                if (e === "success") {
                                    //移除被删除的列表
                                    /* for (var did = 0; did < ids.split(',').length; did++) {
                                      if (ids.split(',')[did] != "") {
                                        $("#id" + ids.split(',')[did]).remove();
                                      }
                                    } */
                                    window.location.reload(true);
                                    LW.message.show("删除成功！");
                                } else if (e === "error") {
                                    LW.message.show("删除失败！");
                                } else {
                                    LW.message.show("未知错误！");
                                }
                            },
                        });
                    } else {
                        $("input[type='checkbox']").attr("checked", false); //将所有的checkbox置为未选中状态
                        return false;
                    }
                } else {
                    LW.message.show("请勾选您要删除的记录");
                    $("input[type='checkbox']").attr("checked", false); //将所有的checkbox置为未选中状态
                    return false;
                }
            });
        });
    </script>
    <div class="cls"></div>
    <table fit="true" fitColumns="true" class="table table-striped table-hover table-bordered">
        <thead>
        <tr>
            <th><input type="checkbox" id="all" name="allCK"
                       onclick="selectAll()"/></th>
            <th>单号</th>
            <th>名称</th>
            <th>单价</th>
            <th>类别</th>
            <th>日期</th>
            <th>录入人</th>
            <th>pid</th>
            <th>生产日期</th>
            <th>保质期(天)</th>
            <th>状态</th>
            <th>数量</th>
            <th>备注</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pager.datas}" var="item" varStatus="status">

            <tr>
                <td class="a"><input type="checkbox" name="box"
                                     onclick="selectOne()" value="${item.id}"></td>
                <td>${item.number}</td>
                <td>${item.title}</td>
                <td>${item.price}</td>
                <td>${item.crmName.name}</td>
                <td><fmt:formatDate value="${item.date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td><lw:SysUserTag style="" htmltype="1" value="${item.uid}"/></td>
                <td>${item.pid}</td>
                <td id="productTime${item.id}"><fmt:formatDate value="${item.productTime}"
                                                               pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td id="shelfLife${item.id}">${item.shelfLife}</td>
                <td id="${item.id}" data-status="${item.status}" class="daojishi">
                    <c:choose>
                        <c:when test="${item.status==0}">
                            <button class="btn btn-success btn-sm">正常</button>
                        </c:when>
                        <c:when test="${item.status==1}">
                            <button class="btn btn-warning btn-sm">还有
                                <span id="time">
                                    <span id="d${item.id}"></span>天
                                    <span id="h${item.id}"></span>时
                                    <span id="m${item.id}"></span>分
                                    <span id="s${item.id}"></span>秒
                                </span>
                                过期
                            </button>
                        </c:when>
                        <c:when test="${item.status==2}">
                            <button class="btn btn-danger btn-sm">已过期</button>
                        </c:when>
                        <c:otherwise>
                            <button class="btn btn-default btn-sm">未知状态</button>
                        </c:otherwise>
                    </c:choose>

                </td>
                <td>${item.num}</td>
                <td>${item.note}</td>
                <td>
                    <a href="<%=basePath%>manage/crmstockinoroutlogitem/${item.id}.html">编辑</a>
                    <a href="javascript:void(0)" onclick="LW.crmstockinoroutlogitem.del(${item.id})">删除</a></td>
            </tr>

        </c:forEach>
        </tbody>
    </table>
    <c:if test="${pager.datas.size()<=0||pager.datas.size()==null}">
        <div style="text-align: center;">
            <p>没有找到数据记录</p>
        </div>
    </c:if>
    <nav>
        <span>当前${pager.pageNo}/${pager.totalPage} 共${pager.totalCount}条数据</span>
        <div class="btn-group pull-right" role="group">
            <a href="<%=basePath%>manage/crmstockinoroutlogitem/crmstockinoroutlogitem_list.html"
               class="btn btn-default">首页</a>
            <a href="<%=basePath%>manage/crmstockinoroutlogitem/crmstockinoroutlogitem_list.html?pageNo=${pager.prePage}"
               class="btn btn-default">上一页</a>
            <a href="<%=basePath%>manage/crmstockinoroutlogitem/crmstockinoroutlogitem_list.html?pageNo=${pager.nextPage}"
               class="btn btn-default">下一页</a>
            <a href="<%=basePath%>manage/crmstockinoroutlogitem/crmstockinoroutlogitem_list.html?pageNo=${pager.totalPage}"
               class="btn btn-default">尾页</a>
        </div>
    </nav>
</div>

<div class="cls"></div>
<script type="text/javascript">
    $("#page_crmstockinoroutlogitem_list").parent().attr("class", "active");
    LW.crmstockinoroutlogitem = {};
    LW.crmstockinoroutlogitem.del = function (id) {
        LW.message.confirm("id", "您确认要继续删除吗?", function (r) {
            if (r) {
                LW.location.forward("manage/crmstockinoroutlogitem/del/" + id + ".html");
            }
        });
    }

    $(function () {
        $(".daojishi").each(function () {
            if($(this).data("status")===1){
                countTime($(this).attr("id"));
            }
        })
    });

    function countTime(id) {
        //获取生产日期
        var productTime = Date.parse($("#productTime" + id).text());
        //获取过期时间
        var overTime = Number(productTime + Number($("#shelfLife" + id).text() * 1000 * 60 * 60 * 24));
        //获取当前时间
        var nowTime = Date.parse(new Date());
        //时间差
        var leftTime = overTime - nowTime;
        //定义变量 d,h,m,s保存倒计时的时间
        var d, h, m, s;
        if (leftTime >= 0) {
            d = Math.floor(leftTime / 1000 / 60 / 60 / 24);
            h = formatTime(Math.floor(leftTime / 1000 / 60 / 60 % 24));
            m = formatTime(Math.floor(leftTime / 1000 / 60 % 60));
            s = formatTime(Math.floor(leftTime / 1000 % 60));
            //将倒计时赋值到div中
            $("#d" + id).html(d);
            $("#h" + id).html(h);
            $("#m" + id).html(m);
            $("#s" + id).html(s);
            setTimeout(countTime, 1000, id);
        } else {
           //代表已过期
            $.ajax({

            })
            $("#"+id).html("<button class=\"btn btn-danger btn-sm\">已过期</button>");
        }
    }
    
    function formatTime(s) {
        if(Number(s)<10){
            s="0"+s;
        }
        return s;
    }
</script>
<%@ include file="../foot.jsp" %>

</body>
</html>