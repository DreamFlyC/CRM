<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8;"/>
    <%@ include file="../tag.jsp" %>
    <title>统计</title>
    <script src="<%=basePath%>resources/js/echarts.min.js"></script>

    <script type="text/javascript">
        function isValid() {
            if (form1.username.value == "" && form1.startTime.value == ""
                && form1.endTime.value == "") {
                LW.message.show("请输入查询条件！");
                form1.username.select();
                return false;
            }
            if (form1.startTime.value != "" && form1.endTime.value == "") {
                LW.message.show("请选择任务结束日期!");
                form1.endTime.select();
                return false;
            }
            if (form1.endTime.value != "" && form1.startTime.value == "") {
                LW.message.show("请选择任务开始日期!");
                form1.startTime.select();
                return false;
            }
            if ($("#endTime").val() < $("#startTime").val()) {
                LW.message.show("日期不合法，请重新选择日期!");
                form1.startTime.select();
                return false;
            }
        }
    </script>

    <style type="text/css">
        table thead tr th, table tbody tr td {
            text-align: center;
        }

        .a {
            width: 100px;
            text-align: center;
        }

        .duty {
            height: 100px;
            width: 25%;
            float: left;
        }

        .gd {
            text-align: center;
            font-size: 14px;
            font-weight: bolder;
            color: #09b4f9;
        }
    </style>
    <script src="<%=basePath%>resources/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<%@ include file="../top.jsp" %>
<%@ include file="../left.jsp" %>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="<%=basePath%>manage/index.html">首页</a></li>
        <li><a href="<%=basePath%>manage/sysworktaskprocessing.html">工作任务处理管理列表</a></li>
        <li>统计</li>
    </ul>
</div>
<div class="rightContainer">
    <div class="cls"></div>
    <!--main  -->
    <div style="width: 100%; height: 50px; background-color: #92ebd3">
        <table class="table table-striped">
            <tr>
                <td style="line-height: 2.8rem"><label>查询日期：</label></td>
                <td><input type="text" name="startTime" id="startTime"
                           class="form-control" value="${startTime}"
                           onclick="WdatePicker({dateFmt:'yyyy-MM-dd '})"></td>
                <td style="line-height: 2.8rem"><label>至</label></td>
                <td><input type="text" name="endTime" id="endTime"
                           class="form-control" value="${endTime}"
                           onclick="WdatePicker({dateFmt:'yyyy-MM-dd '})"></td>
                <td><input type="button" value="查&nbsp;询" class="form-control btn btn-primary" id="submit"></td>
            </tr>
        </table>
    </div>
    <div id="container1" style="height: 200px; width: 25%; float: left;"></div>
    <div id="container2" style="height: 200px; width: 25%; float: left;"></div>
    <div id="container3" style="height: 200px; width: 25%; float: left;"></div>
    <div id="container4" style="height: 200px; width: 25%; float: left;"></div>
    <div style="margin-top: -10px; position: relative; top: -20px;">
        <div class="duty">
            <p class="gd" id="unpro"></p>
            <p class="gd">未处理</p>
        </div>
        <div class="duty">
            <p class="gd" id="procing"></p>
            <p class="gd">处理中</p>
        </div>
        <div class="duty">
            <p class="gd" id="success"></p>
            <p class="gd">已处理成功</p>
        </div>
        <div class="duty">
            <p class="gd" id="failed"></p>
            <p class="gd">已处理失败</p>
        </div>
    </div>
    <div class="cls"></div>
</div>
</body>

<script type="text/javascript">

    $(function () {
        init();
    })

    $("#submit").click(function () {
        var startTime=$("#startTime").val();
        var endTime=$("#endTime").val();

        init(startTime,endTime);
    })
    
    function init(startTime,endTime) {
        var UN_PROCESSOR = 0;
        var PROCESSORING = 0;
        var PROCESSOR_SUCCESS = 0;
        var PROCESSOR_FAILED = 0;
        var count = 0;
        $.ajax({
            url: '/manage/sysworktaskprocessing/tongji',
            type: 'POST',
            data:{
                startTime:startTime,
                endTime:endTime
            },
            error: function () {
                alert("获取数据失败，请重试");
            },
            success: function (data) {
                if (data.msg.length > 0) {
                    for (var i = 0; i < data.msg.length; i++) {
                        switch (data.msg[i].status) {
                            case 0:
                                UN_PROCESSOR = data.msg[0].count;
                                break;
                            case 1:
                                PROCESSORING = data.msg[1].count;
                                break;
                            case 2:
                                PROCESSOR_SUCCESS = data.msg[2].count;
                                break;
                            case 3:
                                PROCESSOR_FAILED = data.msg[3].count;
                                break;
                            default:
                                break;
                        }
                    }
                    count = UN_PROCESSOR + PROCESSORING + PROCESSOR_SUCCESS + PROCESSOR_FAILED;
                    $("#unpro").text(UN_PROCESSOR + "/" + count);
                    $("#procing").text(PROCESSOR_SUCCESS + "/" + count);
                    $("#success").text(PROCESSOR_SUCCESS + "/" + count);
                    $("#failed").text(PROCESSOR_FAILED + "/" + count);
                    /*1.未处理  */
                    var option1 = {
                        backgroundColor: null,
                        color: ['#38a8da', '#efe5e5'],
                        series: [{
                            name: '来源',
                            type: 'pie',
                            radius: ['60%', '75%'],
                            avoidLabelOverlap: false,
                            hoverAnimation: false,
                            label: {
                                normal: {
                                    show: false,
                                    position: 'center',
                                    textStyle: {
                                        fontSize: 26,
                                        fontWeight: 'bold'
                                    },
                                    formatter: '{d}%'
                                }
                            },
                            data: [{
                                value: UN_PROCESSOR,
                                label: {
                                    normal: {
                                        show: true
                                    }
                                }
                            },
                                {
                                    value: count - UN_PROCESSOR,
                                    name: '',
                                }
                            ]
                        }]
                    };
                    /*2.处理中  */
                    var option2 = {
                        backgroundColor: null,
                        color: ['#f02c23', '#efe5e5'],
                        series: [{
                            name: '来源',
                            type: 'pie',
                            radius: ['60%', '75%'],
                            avoidLabelOverlap: false,
                            hoverAnimation: false,
                            label: {
                                normal: {
                                    show: false,
                                    position: 'center',
                                    textStyle: {
                                        fontSize: 26,
                                        fontWeight: 'bold'
                                    },
                                    formatter: '{d}%'
                                }
                            },
                            data: [{
                                value: PROCESSORING,
                                name: '',
                                label: {
                                    normal: {
                                        show: true
                                    }
                                }
                            },
                                {
                                    value: count - PROCESSORING,
                                    name: '',
                                }
                            ]
                        }]
                    };
                    /*3.已处理成功  */
                    var option3 = {
                        backgroundColor: null,
                        color: ['#62b900', '#efe5e5'],
                        series: [{
                            name: '来源',
                            type: 'pie',
                            radius: ['60%', '75%'],
                            avoidLabelOverlap: false,
                            hoverAnimation: false,
                            label: {
                                normal: {
                                    show: false,
                                    position: 'center',
                                    textStyle: {
                                        fontSize: 26,
                                        fontWeight: 'bold'
                                    },
                                    formatter: '{d}%'
                                }
                            },
                            data: [{
                                value: PROCESSOR_SUCCESS,
                                name: '',
                                label: {
                                    normal: {
                                        show: true
                                    }
                                }
                            },
                                {
                                    value: count - PROCESSOR_SUCCESS,
                                    name: '',
                                }
                            ]
                        }]
                    };
                    /*4.已处理失败  */
                    var option4 = {
                        backgroundColor: null,
                        color: ['#e91ca7', '#efe5e5'],
                        series: [{
                            name: '来源',
                            type: 'pie',
                            radius: ['60%', '75%'],
                            avoidLabelOverlap: false,
                            hoverAnimation: false,
                            label: {
                                normal: {
                                    show: false,
                                    position: 'center',
                                    textStyle: {
                                        fontSize: 26,
                                        fontWeight: 'bold'
                                    },
                                    formatter: '{d}%'
                                }
                            },
                            data: [{
                                value: PROCESSOR_FAILED,
                                name: '',
                                label: {
                                    normal: {
                                        show: true
                                    }
                                }
                            },
                                {
                                    value: count - PROCESSOR_FAILED,
                                    name: '',
                                }
                            ]
                        }]
                    };
                    echarts.init(document.getElementById("container1")).setOption(option1);
                    echarts.init(document.getElementById("container2")).setOption(option2);
                    echarts.init(document.getElementById("container3")).setOption(option3);
                    echarts.init(document.getElementById("container4")).setOption(option4);
                }
            }
        });
    }
</script>
</html>