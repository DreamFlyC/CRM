<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- saved from url=(0086)http://weixin.qlemon.cc/box/units/viewBufHtmlTemplate/3d9c72455fe646f69b997c207c440ed8 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%--<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link href="css/select2.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/select2.min.js"></script>
    <script type="text/javascript" src="js/select2_locale_zh-CN.js"></script>--%>

    <link rel="stylesheet" type="text/css" href="<%=basePath%>resources/lgsdoorinfo/css/bootstrap.min.css">
    <link href="<%=basePath%>resources/lgsdoorinfo/css/select2.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="<%=basePath%>resources/lgsdoorinfo/js/jquery.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/lgsdoorinfo/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/lgsdoorinfo/js/select2.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/lgsdoorinfo/js/select2_locale_zh-CN.js"></script>

    <title>智能柜模板(Boostrap实现方式)</title>
    <style type="text/css">
        .panel-container {
            width: 100%;
            border: 1px solid #6ecdff;
            display: -webkit-inline-box;

        }

        /* .container-board {
            padding-top: 5px;
            padding-left: 5px;
            width: 220px;
        } */

        .container-title {
            text-align: center;
            /* padding-left: 102px; */
            font-weight: 700;
            color: blue;
        }

        .container-body {
            width: 100%;
            display: -webkit-inline-box;
            border: 1px solid #ddd;
            padding: 5px;
        }

        .container-body ul {
            width: 50%;
            margin-bottom: 0px !important;
        }

        .container-body ul li {
            height: 50px;
            line-height: 50px;
            background-color: #ddd;
            padding: 0px;
            border: 1px solid rgba(32, 252, 252, 0.66);
            color: #2D2929;
            text-align: center;
            font-size: 10px;
        }

        .mouth-free {
            background-color: #A6FFA6 !important;
        }

        .mouth-occupy {
            background-color: #FFC1E0 !important;
            color: black !important;
            font-size: 10px !important;

        }

        .mouth-preoccupy {
            background-color: #84C1FF !important;
        }

        .mouth-unavailable {
            background-color: #F9F900 !important;
        }

        .mouth-unknow {
            background-color: #ddd !important;
            background-repeat: no-repeat;
            background-position: 32px 8px;
        }

        /*  .gezi {
              width: 20px;
              height: 295px;
          }*/

        .col-xs-12, .col-sm-6, .col-sm-12, .col-md-4, .col-md-6, .col-md-12, .col-lg-4, .col-lg-6 {
            padding-left: 5px !important;
            padding-right: 5px !important;
        }

        .container-com {
            padding: 5px;
            min-height: 807px;
        }

        .default-li {
            background-color: #fff !important;
            list-style: none;
            border: 0 !important;
        }
    </style>
</head>
<style type="text/css" id="685062356111"></style>

<body>
<div class="panel-body">
    <button type="button" class="btn mouth-free">空闲</button>
    <button type="button" class="btn mouth-preoccupy">预占</button>
    <button type="button" class="btn mouth-occupy">占用</button>
    <button type="button" class="btn mouth-unavailable">无效</button>
    <button type="button" class="btn mouth-unknow">未知</button>
</div>
<div class="panel-body" id="panel-doorinfo">

</div>

<div>
    <object id="ClCache" click="sendMsg" host="" width="0" height="0"></object>
</div>

</body>

<script type="text/javascript">
    $(function () {
            const FIRST_MOUTH = 10;
            const COMMON_MOUTH = 16;

            $.ajax({
                url: '/manage/lgsdoorinfo/info',
                type: 'POST',
                success: function (data) {

                    let length = data.msg.length;
                    if (length > 0) {
                        let panel = createPanel(data);
                        $("#panel-doorinfo").html(panel);
                        let ul = [];
                        ul = createCols(data);
                        while (ul.length % 4 !== 0) {
                            let result = "";
                            result += "<ul class=\"list-group\">";
                            result += "</ul>";
                            ul.push(result);
                        }
                        let ulLength = ul.length;
                        $(".container-body").each(function () {
                            if (ulLength > 2) {
                                $(this).append(ul[ulLength]);
                                $(this).append(ul[ulLength = ulLength - 1]);
                            } else if (ulLength === 2) {
                                $(this).append(ul[1]);
                                $(this).append(ul[0]);
                            } else {
                                return false;
                            }
                            ulLength--;
                        });
                        
                        $(".container-title").each(function (index) {
                            $(this).html($(".container-title").length-index).css;
                        })
                    }

                },
                error: function (data) {
                    console.log(data.msg);
                }
            });

            //生成列数 ul
            function createCols(data) {
                let ul = [];
                let li = [];
                li = createRows(data);
                if (li.length > 0) {
                    let result = "";
                    for (let i = 0; i < li.length; i++) {
                        result += "<ul class=\"list-group\">";
                        result += li[i];
                        result += "</ul>";
                        ul.push(result);
                        result = "";
                    }
                    return ul;
                }
            }

            //生成行数 li
            function createRows(data) {
                const length = data.msg.length;
                // let rows = Math.ceil((length - FIRST_MOUTH) / COMMON_MOUTH) + 1;
                let liArr = [];
                // let count = FIRST_MOUTH - 1;
                if (length > FIRST_MOUTH) {
                    let result = "";
                    for (let i = 0; i < (COMMON_MOUTH - FIRST_MOUTH); i++) {
                        result += "<li class=\"list-group-item default-li \" ></li>";
                    }
                    for (let i = 0; i < FIRST_MOUTH; i++) {
                        result += "<li class=\"list-group-item mouth-free\" data-logic-no=" + data.msg[i].doorNo + " data-index=" + data.msg[i].doorNo + ">" + data.msg[i].doorNo + "</li>"
                    }
                    liArr.push(result);
                    /*for (let a = 0; a < rows - 1; a++) {
                        result = "";
                        for (let i = 0; i < COMMON_MOUTH; i++) {
                            result += "<li class=\"list-group-item mouth-free\" data-logic-no=" + data.msg[count].doorNo + " data-index=" + data.msg[count].doorNo + ">" + data.msg[count].doorNo + "</li>"
                            count++;
                            console.log(count);
                        }
                        liArr.push(result);
                    }*/

                    let count = 0;
                    result = "";
                    var i=0;
                    for (i = FIRST_MOUTH; i < length; i++) {
                        count++;
                        result += "<li class=\"list-group-item mouth-free\" data-logic-no=" + data.msg[i].doorNo + " data-index=" + data.msg[i].doorNo + ">" + data.msg[i].doorNo + "</li>"
                        if (count % COMMON_MOUTH === 0) {
                            liArr.push(result);
                            result = "";
                        }
                    }
                    //最后一个数组
                    for(i;i<length;i++){
                        result += "<li class=\"list-group-item mouth-free\"  data-logic-no=" + data.msg[i].doorNo + " data-index=" + data.msg[i].doorNo + ">" + data.msg[i].doorNo + "</li>"
                    }
                    liArr.push(result);
                }
                return liArr;
            }

            // 生成总的panel-container
            function createPanel(data) {
                const length = data.msg.length;
                let count = Math.ceil((length - (FIRST_MOUTH + COMMON_MOUTH)) / (COMMON_MOUTH * 4)) + 1;
                let result = "";
                for (let i = 0; i < count; i++) {
                    result += "<div class=\"col-xs-12 col-sm-12 col-md-6 col-lg-4\">\n" +
                        "        <div class=\"panel-container\">\n" +
                        "            <div class=\"col-xs-6 col-sm-6 col-md-6 col-lg-6 container-com\">\n" +
                        "                <div class=\"container-title\"></div>\n" +
                        "                <div class=\"container-body\">\n" +
                        "                </div>\n" +
                        "            </div>\n" +
                        "            <div class=\"col-xs-6 col-sm-6 col-md-6 col-lg-6 container-com\">\n" +
                        "                <div class=\"container-title\"></div>\n" +
                        "                <div class=\"container-body\">\n" +
                        "                </div>\n" +
                        "            </div>\n" +
                        "        </div>\n" +
                        "    </div>\n";
                }
                return result;
            }

        }
    );


</script>

</html>
