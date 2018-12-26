<%--
  Created by IntelliJ IDEA.
  User: CZP
  Date: 2018/12/26
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.text.*" %>
<%@ page import="java.lang.String" %>
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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>采购送货单页面</title>
    <link href="<%=basePath%>resources/css/system.css" rel="stylesheet" type="text/css"/>
    <script src="<%=basePath%>resources/js/jquery.min.js" type="text/javascript"></script>
    <style>
        *,
        ul,
        li {
            margin: 0;
            padding: 0;
        }

        body {
            color: rgba(0, 0, 0, .75);
            width: 100%;
            min-width: 100%;
            font-size: 12px;
            font-family: "宋体";
            font-weight: bold;
        }

        .inline {
            float: left;
            margin: 0 20px;
        }

        .title-p1 {
            font-size: 26px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .title-p2 {
            margin-bottom: 10px;
        }

        .container {
            width: 800px;
            margin: 100px auto;
        }

        .info-p1 {
            margin: 4px 0;
        }

        .table {
            width: 100%;
            max-width: 100%;
            text-align: center;
            border: 1px solid #000;
            border-spacing: 0;
            border-collapse: collapse;
            padding: 0 20px;
        }

        th {
            padding: 10px;
        }

        td {
            padding: 5px;
        }

        .foot-p1 {
            margin-top: 10px;
        }

        .foot-p2 {
            margin: 10px 0;
        }

        .float {
            float: left;
        }
    </style>
</head>
<body>
<%@ include file="../top.jsp" %>
<%@ include file="../left.jsp" %>
<div class="rightContainer">
    <div class="place">
        <span>位置：</span>
        <ul class="placeul">
            <li><a href="<%=basePath%>manage/index.html">首页</a></li>
            <li><a href="<%=basePath%>manage/crmpurchacse.html">采购信息列表</a></li>
            <li>送货单</li>
        </ul>
    </div>
    <div class="container">
        <div class="header">
            <div class="title">
                <div class="inline" style="width: 200px; height: 78px;">
                    <img src="<%=basePath%>resources/images/company.png" width="200" alt="logo">
                </div>
                <div class="inline">
                    <p class="title-p1">深圳市一米云站科技有限公司</p>
                    <p class="title-p2">地址：深圳市特发信息科技大厦7A-1</p>
                    <p class="title-p2">Tel:400-0755-917</p>
                </div>
                <div class="inline" style="float: right;margin-right: 20px;">
                    <p class="title-p1" style="letter-spacing: 3px;">[送货单]</p>
                    <p class="title-p2">条形码</p>
                    <p class="title-p2">${crmPurchacse.number}</p>
                </div>
            </div>
            <div class="info">
                <div class="inline">
                    <p class="info-p1"><span>客户名称：</span><span></span></p>
                    <p class="info-p1"><span>客户地址：</span><span>${crmPurchacse.address}</span></p>
                </div>
                <div class="inline">
                    <p class="info-p1"><span>联系人：</span><span></span></p>
                    <p class="info-p1"><span>客户电话：</span><span></span></p>
                </div>
                <div class="inline" style="float: right;margin-right: 20px;">
                    <p class="info-p1"><span>收款方式：</span><span></span></p>
                    <p class="info-p1"><span>单据日期：</span><span><fmt:formatDate value="${crmPurchacse.date}"
                                                                               pattern="yyyy-MM-dd"/></span></p>
                </div>
            </div>
            <div style="clear: both;"></div>
        </div>
        <div class="main" style="padding: 0 20px;">
            <table class="table" border="1">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>产品编号</th>
                    <th>类型</th>
                    <th>仓库id</th>
                    <th>名称</th>
                    <th>数量</th>
                    <th>单价</th>
                    <th>金额</th>
                    <th>供应商ID</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${crmPurchacseItemList}" var="item" varStatus="status">
                    <tr>
                        <td>${status.index+1}</td>
                        <td>${item.snumber}</td>
                        <td>${item.type}</td>
                        <td>${item.stock_info_id}</td>
                        <td>${item.title}</td>
                        <td class="num">${item.num}</td>
                        <td>${item.price}</td>
                        <td class="countPrice">
                            <fmt:formatNumber type="number" value="${item.num*item.price}" pattern="0.00" maxFractionDigits="2"/>
                        </td>
                        <td>${item.sid}</td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="5">
                        <span>合计：</span>
                        <span id="ChinesePrice"></span>
                    </td>
                    <td id="num"></td>
                    <td></td>
                    <td id="numPrice"></td>
                    <td></td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="footer" style="padding: 0 20px;">
            <p class="foot-p1">
                本送货单为客户收货凭证依据，不得买卖转让，由收货方签字或物流单代签收生效，此单解释权柜本公司所有！
            </p>
            <div class="float foot-p2" style="width:30%">
                <span>制单人：</span>
                <span>超级管理员</span>
            </div>
            <div class="float foot-p2" style="width:35%">
                <span>送货单位及经手人(蓝印)：</span>
                <span></span>
            </div>
            <div class="float foot-p2" style="width:35%">
                <span>送货单位及经手人(蓝印)：</span>
                <span></span>
            </div>
            <p style="font-style: italic;">（一联存根、二联客户、三联收款、四联仓库）</p>
        </div>
    </div>
</div>

<script>
    $(function(){
        var num=0;
        $(".num").each(function(){
            num=Number(num)+Number($(this).text());
        });
        $("#num").text(num);
        var per=0;
        $(".countPrice").each(function(){
            per=Number(per)+Number($(this).text());
        });

        var countPrice=Arabia_to_Chinese(per+"");
        $("#ChinesePrice").text(countPrice);
        $("#numPrice").text(per);
    })
</script>

<script language="javascript" type="text/javascript">
    function Arabia_to_Chinese(Num) {
        for (i = Num.length - 1; i >= 0; i--) {
            Num = Num.replace(",", "")//替换tomoney()中的“,”
            Num = Num.replace(" ", "")//替换tomoney()中的空格
        }
        Num = Num.replace("￥", "")//替换掉可能出现的￥字符
        if (isNaN(Num)) { //验证输入的字符是否为数字
            alert("请检查小写金额是否正确");
            return;
        }
        //---字符处理完毕，开始转换，转换采用前后两部分分别转换---//
        part = String(Num).split(".");
        newchar = "";
        //小数点前进行转化
        for (i = part[0].length - 1; i >= 0; i--) {
            if (part[0].length > 10) { alert("位数过大，无法计算"); return ""; } //若数量超过拾亿单位，提示
            tmpnewchar = ""
            perchar = part[0].charAt(i);
            switch (perchar) {
                case "0": tmpnewchar = "零" + tmpnewchar; break;
                case "1": tmpnewchar = "壹" + tmpnewchar; break;
                case "2": tmpnewchar = "贰" + tmpnewchar; break;
                case "3": tmpnewchar = "叁" + tmpnewchar; break;
                case "4": tmpnewchar = "肆" + tmpnewchar; break;
                case "5": tmpnewchar = "伍" + tmpnewchar; break;
                case "6": tmpnewchar = "陆" + tmpnewchar; break;
                case "7": tmpnewchar = "柒" + tmpnewchar; break;
                case "8": tmpnewchar = "捌" + tmpnewchar; break;
                case "9": tmpnewchar = "玖" + tmpnewchar; break;
            }
            switch (part[0].length - i - 1) {
                case 0: tmpnewchar = tmpnewchar + "元"; break;
                case 1: if (0 !== perchar) tmpnewchar = tmpnewchar + "拾"; break;
                case 2: if (0 !== perchar) tmpnewchar = tmpnewchar + "佰"; break;
                case 3:
                    if (perchar == 0) {
                    } else {
                        tmpnewchar = tmpnewchar + "仟";
                    }
                    break;
                case 4: tmpnewchar = tmpnewchar + "万"; break;
                case 5: if (perchar != 0) tmpnewchar = tmpnewchar + "拾"; break;
                case 6: if (perchar != 0) tmpnewchar = tmpnewchar + "佰"; break;
                case 7: if (perchar != 0) tmpnewchar = tmpnewchar + "仟"; break;
                case 8: tmpnewchar = tmpnewchar + "亿"; break;
                case 9: tmpnewchar = tmpnewchar + "拾"; break;
            }
            newchar = tmpnewchar + newchar;
        }
        //小数点之后进行转化
        if (Num.indexOf(".") != -1) {
            if (part[1].length > 2) {
                alert("小数点之后只能保留两位,系统将自动截段");
                part[1] = part[1].substr(0, 2)
            }
            for (i = 0; i < part[1].length; i++) {
                tmpnewchar = ""
                perchar = part[1].charAt(i)
                switch (perchar) {
                    case "0": tmpnewchar = "零" + tmpnewchar; break;
                    case "1": tmpnewchar = "壹" + tmpnewchar; break;
                    case "2": tmpnewchar = "贰" + tmpnewchar; break;
                    case "3": tmpnewchar = "叁" + tmpnewchar; break;
                    case "4": tmpnewchar = "肆" + tmpnewchar; break;
                    case "5": tmpnewchar = "伍" + tmpnewchar; break;
                    case "6": tmpnewchar = "陆" + tmpnewchar; break;
                    case "7": tmpnewchar = "柒" + tmpnewchar; break;
                    case "8": tmpnewchar = "捌" + tmpnewchar; break;
                    case "9": tmpnewchar = "玖" + tmpnewchar; break;
                }
                if (i == 0) tmpnewchar = tmpnewchar + "角";
                if (i == 1) tmpnewchar = tmpnewchar + "分";
                newchar = newchar + tmpnewchar;
            }
        }
        //替换所有无用汉字
        while (newchar.search("零零") != -1)
            newchar = newchar.replace("零零", "零");
        newchar = newchar.replace("零亿", "亿");
        newchar = newchar.replace("亿万", "亿");
        newchar = newchar.replace("零万", "万");
        newchar = newchar.replace("零元", "元");
        newchar = newchar.replace("零角", "");
        newchar = newchar.replace("零分", "");

        if (newchar.charAt(newchar.length - 1) == "元" || newchar.charAt(newchar.length - 1) == "角")
            newchar = newchar + "整"
        //  document.write(newchar);
        return newchar;

    }
</script>

</body>
</html>

