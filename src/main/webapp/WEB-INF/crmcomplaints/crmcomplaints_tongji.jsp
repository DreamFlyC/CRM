<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
%>
<html>
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>客户投诉统计</title>
  <%@ include file="../tag.jsp" %>
  <script src="<%=basePath%>resources/js/echarts.min.js"></script>

  <style type="text/css">
    #main, #mainMonth, #mainYear {
      height: 400px;
      margin: 0px auto;
    }

    .search {
      left: 0;
      position: relative;
    }

    .sup-xx {
      color: #c9d0c6;
      position: absolute;
      top: 5px;
      right: 24px;
      font-size: 24px;
      cursor: pointer;
    }

    .sup-xx:hover {
      color: #a3a9a0;
    }

    .dateText {
      float: left;
      height: 34px;
      line-height: 34px;
      text-align: right;
      width: 60px;
    }

    .fok {
      padding: 10px 0px;
    }

    .col-md-2, .col-md-4 {
      padding: 0px 5px;
    }
  </style>
</head>
<body>
<%@ include file="../top.jsp" %>
<%@ include file="../left.jsp" %>
<div class="place">
  <span>位置：</span>
  <ul class="placeul">
    <li>首页</li>
    <li><a href="<%=basePath%>manage/crmcomplaints.html">客户投诉管理列表</a></li>
  </ul>
</div>
<div class="rightContainer">

  <div style="padding:20px 0px;">
    <div class="fok" style="float: left;">
      <button class="btn btn-primary" onclick="javscript:window.history.go(-1);">
        <span class="glyphicon glyphicon-arrow-left"></span> 返回
      </button>
      <button class="btn btn-primary" onclick="javascript:window.location.reload()" style="">
        <span class="glyphicon glyphicon-refresh"></span> 刷新
      </button>
      <button class="btn btn-success" onclick="getMonthByCode(1)">
        <span class=""></span> 查询本月
      </button>
      <button class="btn btn-danger" onclick="getMonthByCode(2)">
        <span class=""></span> 上一个月
      </button>
    </div>
    <div class="col-lg-8 col-md-12 fok">
      <div class="col-md-4 ">
        <input type="text" name="sDate" id="sDate" autocomplete="off" placeholder="开始日期" maxlength="20" readonly
               class="form-control" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" value="">
      </div>
      <div class="col-md-4 ">
        <input type="text" name="eDate" id="eDate" autocomplete="off" placeholder="结束日期" maxlength="20" readonly
               class="form-control" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" value="">
      </div>
      <div class="col-md-2">
        <input type="button" id="submit" value="查&nbsp;询" class="form-control btn-primary">
      </div>
    </div>
  </div>
  <div style="clear: both"></div>
  <h1 class="text-center" style="margin:20px 0px 10px;" id="tongji">按日投诉统计图</h1>
  <div id="main"></div>


  <%--月份搜索框--%>
  <div style="width:100%;margin:20px 0px;">
    <div style="width: 85%;margin: 0px auto;">
      <div class="dateText">
        <label for="sDate">日期：</label>
      </div>
      <div class="col-md-4">
        <input type="text" name="sDate" id="sDateMonth" autocomplete="off" placeholder="开始月份" maxlength="20"
               onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5a-zA-Z0-9\w]/g,'')"
               class="form-control" onfocus="WdatePicker({dateFmt:'yyyy-MM',readOnly:true})" value="">
      </div>
      <div class="col-md-4">
        <input type="text" name="eDate" id="eDateMonth" autocomplete="off" placeholder="结束月份" maxlength="20"
               onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5a-zA-Z0-9\w]/g,'')"
               class="form-control" onfocus="WdatePicker({dateFmt:'yyyy-MM',readOnly:true})" value="">
      </div>
      <div class="col-md-2">
        <input type="button" id="submitMonth" value="查&nbsp;询" class="form-control btn-primary">
      </div>
    </div>
    <div style="clear: both"></div>
    <h1 class="text-center" style="margin:20px 0px 10px;" id="tongjiMonth">按月投诉统计图</h1>
    <div id="mainMonth"></div>
  </div>
  <%--年份搜索框--%>
  <div style="width:100%;margin:20px 0px;">
    <div style="width: 85%;margin: 0px auto;">
      <div class="dateText">
        <label for="sDate">日期：</label>
      </div>
      <div class="col-md-4">
        <input type="text" name="sDate" id="sDateYear" autocomplete="off" placeholder="开始月份" maxlength="20"
               onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5a-zA-Z0-9\w]/g,'')"
               class="form-control" onclick="WdatePicker({dateFmt:'yyyy',readOnly:true})" value="">
      </div>
      <div class="col-md-4">
        <input type="text" name="eDate" id="eDateYear" autocomplete="off" placeholder="结束月份" maxlength="20"
               onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5a-zA-Z0-9\w]/g,'')"
               class="form-control" onclick="WdatePicker({dateFmt:'yyyy',readOnly:true})" value="">
      </div>
      <div class="col-md-2">
        <input type="button" id="submitYear" value="查&nbsp;询" class="form-control btn-primary">
      </div>
    </div>
    <div style="clear: both"></div>
    <h1 class="text-center" style="margin:20px 0px 10px;" id="tongjiYear">按年投诉统计图</h1>
    <div id="mainYear"></div>

  </div>
</div>
<script>
    function wh(cdate, ctype, series) {
        var dom = document.getElementById("main");
        var myChart = echarts.init(dom);
        option = null;
        option = {
            xAxis: {
                type: 'category',
                data: cdate,
            },
            yAxis: {
                type: 'value',
                name: "投诉总量",
            },
            legend: {
                data: ctype,
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'shadow',
                    label: {
                        show: true
                    }
                }
            },
            dataZoom: [
                {
                    show: true,
                    start: 0,
                    end: 100
                },
                {
                    type: 'inside',
                    start: 94,
                    end: 100
                },
                {
                    show: true,
                    yAxisIndex: 0,
                    filterMode: 'empty',
                    width: 30,
                    height: '80%',
                    showDataShadow: false,
                    left: '93%'
                }
            ],
            toolbox: {
                show: true,
                orient: 'vertical',
                left: 'right',
                top: 'center',
                feature: {
                    mark: {show: true},
                    dataView: {show: true, readOnly: false},
                    magicType: {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                    restore: {show: true},
                    saveAsImage: {show: true}
                }
            },
            calculable: true,
            series: series,
        };
        if (option && typeof option === "object") {
            myChart.setOption(option, true);
        }
        var zoomSize = 6;
        myChart.on('click', function (params) {
            console.log(cdate[Math.max(params.dataIndex - zoomSize / 2, 0)]);
            myChart.dispatchAction({
                type: 'dataZoom',
                startValue: cdate[Math.max(params.dataIndex - zoomSize / 2, 0)],
                endValue: cdate[Math.min(params.dataIndex + zoomSize / 2, series.length - 1)]
            });
        });
    }

    function whMonth(cdate, ctype, series) {
        var dom = document.getElementById("mainMonth");
        var myChart = echarts.init(dom);
        option = null;
        option = {
            xAxis: {
                type: 'category',
                data: cdate,
            },
            yAxis: {
                type: 'value',
                name: "投诉总量",
            },
            legend: {
                data: ctype,
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'shadow',
                    label: {
                        show: true
                    }
                }
            },
            dataZoom: [
                {
                    show: true,
                    start: 0,
                    end: 100
                },
                {
                    type: 'inside',
                    start: 94,
                    end: 100
                },
                {
                    show: true,
                    yAxisIndex: 0,
                    filterMode: 'empty',
                    width: 30,
                    height: '80%',
                    showDataShadow: false,
                    left: '93%'
                }
            ],
            toolbox: {
                show: true,
                orient: 'vertical',
                left: 'right',
                top: 'center',
                feature: {
                    mark: {show: true},
                    dataView: {show: true, readOnly: false},
                    magicType: {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                    restore: {show: true},
                    saveAsImage: {show: true}
                }
            },
            calculable: true,
            series: series,
        };
        if (option && typeof option === "object") {
            myChart.setOption(option, true);
        }
        var zoomSize = 6;
        myChart.on('click', function (params) {
            console.log(cdate[Math.max(params.dataIndex - zoomSize / 2, 0)]);
            myChart.dispatchAction({
                type: 'dataZoom',
                startValue: cdate[Math.max(params.dataIndex - zoomSize / 2, 0)],
                endValue: cdate[Math.min(params.dataIndex + zoomSize / 2, series.length - 1)]
            });
        });
    }

    function whYear(cdate, ctype, series) {
        var dom = document.getElementById("mainYear");
        var myChart = echarts.init(dom);
        option = null;
        option = {
            xAxis: {
                type: 'category',
                data: cdate,
            },
            yAxis: {
                type: 'value',
                name: "投诉总量",
            },
            legend: {
                data: ctype,
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'shadow',
                    label: {
                        show: true
                    }
                }
            },
            dataZoom: [
                {
                    show: true,
                    start: 0,
                    end: 100
                },
                {
                    type: 'inside',
                    start: 94,
                    end: 100
                },
                {
                    show: true,
                    yAxisIndex: 0,
                    filterMode: 'empty',
                    width: 30,
                    height: '80%',
                    showDataShadow: false,
                    left: '93%'
                }
            ],
            toolbox: {
                show: true,
                orient: 'vertical',
                left: 'right',
                top: 'center',
                feature: {
                    mark: {show: true},
                    dataView: {show: true, readOnly: false},
                    magicType: {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                    restore: {show: true},
                    saveAsImage: {show: true}
                }
            },
            calculable: true,
            series: series,
        };
        if (option && typeof option === "object") {
            myChart.setOption(option, true);
        }
        var zoomSize = 6;
        myChart.on('click', function (params) {
            console.log(cdate[Math.max(params.dataIndex - zoomSize / 2, 0)]);
            myChart.dispatchAction({
                type: 'dataZoom',
                startValue: cdate[Math.max(params.dataIndex - zoomSize / 2, 0)],
                endValue: cdate[Math.min(params.dataIndex + zoomSize / 2, series.length - 1)]
            });
        });
    }

    function resizeChart(id) {
        window.addEventListener("resize", function () {
            var myChart = echarts.getInstanceByDom(document.getElementById(id));
            myChart.resize();
        });
    }

    $(function () {
        //默认查询当前月份
        var status = 0;
        var date = new Date();
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        var sDate = year + "-" + month;
        submitChange(status, sDate, sDate);
        //查询月份
        submitChangeMonth(2, year + "-01", year + "-12");
        //查询年份
        submitChangeYear(3, year, year);


        window.addEventListener("resize", function () {
            var myChart = echarts.getInstanceByDom(document.getElementById("main"));
            myChart.resize();
        });
        window.addEventListener("resize", function () {
            var myChart = echarts.getInstanceByDom(document.getElementById("mainMonth"));
            myChart.resize();
        });
        window.addEventListener("resize", function () {
            var myChart = echarts.getInstanceByDom(document.getElementById("mainYear"));
            myChart.resize();
        });

    });
</script>

<script>
    function formatNum(data) {
        var typeCount = data.typeCount;
        var arr = data.msg;
        var map = {};
        var dest = [];
        var realnum = [];
        for (var i = 0; i < arr.length; i++) {
            var ai = arr[i];
            if (!map[ai.date]) {
                var arrnum = new Array(typeCount);
                for (ek = 0; ek < arrnum.length; ek++) {
                    arrnum[ek] = 0;
                }
                arrnum[ai.type - 1] = ai.num;
                dest.push({
                    date: ai.date,
                    num: arrnum
                });
                map[ai.date] = ai;
            } else {
                for (var j = 0; j < dest.length; j++) {
                    var dj = dest[j];
                    if (dj.date == ai.date) {
                        dj.num[ai.type - 1] = ai.num;
                        break;
                    }
                }
            }
        }
        for (var i = 0; i < typeCount; i++) {
            var arrnewnum = new Array(dest.length);
            for (var j = 0; j < dest.length; j++) {
                arrnewnum[j] = dest[j].num[i];
            }
            realnum[i] = arrnewnum;
        }
        return {
            dest: dest,
            realnum: realnum
        }
    }

    $("#submit").click(function () {
        var key = true;
        if ($("#sDate").val() == '') {
            LW.message.show("请选择开始日期");
            key = false;
        }
        if ($("#eDate").val() == '') {
            LW.message.show("请选择结束日期");
            key = false;
        }
        if ($("#sDate").val() > $("#eDate").val()) {
            LW.message.show("日期不合法，请重新选择");
            $("#sDate").val("");
            $("#eDate").val("");
            key = false;
        }
        if (key) {
            var status = 1;
            var sDate = $("#sDate").val();
            var eDate = $("#eDate").val();
            submitChange(status, sDate, eDate);
            $("#tongji").html(sDate + "日至" + eDate + "日投诉统计图");
        }
    });

    $("#submitMonth").click(function () {
        var key = true;
        if ($("#sDateMonth").val() == '') {
            LW.message.show("请选择开始月份");
            key = false;
        }
        if ($("#eDateMonth").val() == '') {
            LW.message.show("请选择开始月份");
            key = false;
        }
        if ($("#sDateMonth").val() > $("#eDateMonth").val()) {
            LW.message.show("日期不合法，请重新选择");
            $("#sDateMonth").val("");
            $("#eDateMonth").val("");
            key = false;
        }
        if (key) {
            var status = 2;
            var sDate = $("#sDateMonth").val();
            var eDate = $("#eDateMonth").val();
            submitChangeMonth(status, sDate, eDate);
            $("#tongjiMonth").html(sDate.replace("-", "年") + "月至" + eDate.replace("-", "年") + "月投诉统计图");
        }
    });

    $("#submitYear").click(function () {
        var key = true;
        if ($("#sDateYear").val() == '') {
            LW.message.show("请选择开始日期");
            key = false;
        }
        if ($("#eDateYear").val() == '') {
            LW.message.show("请选择结束日期");
            key = false;
        }
        if ($("#sDateYear").val() > $("#eDateYear").val()) {
            LW.message.show("日期不合法，请重新选择");
            $("#sDateYear").val("");
            $("#eDateYear").val("");
            key = false;
        }
        if (key) {
            var status = 3;
            var sDate = $("#sDateYear").val();
            var eDate = $("#eDateYear").val();
            submitChangeYear(status, sDate, eDate);
            $("#tongjiYear").html(sDate + "年至" + eDate + "年投诉统计图");
        }
    });

    function getMonthByCode(code) {
        var status = 0;
        var date = new Date();
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        if (code === 1) {
            var sDate = year + "-" + month;
        }
        if (code === 2) {
            var sDate = year + "-" + (month - 1);
        }
        var eDate = sDate;
        submitChange(status, sDate, eDate);
        $("#tongji").html(sDate.replace("-", "年") + "月统计图");

    }

    function submitChange(status, sDate, eDate) {
        var cdate = [];
        var ctype = [];
        var series = [];
        $.ajax({
            type: "POST",
            dataType: "json",
            data: {
                "status": status,
                "sDate": sDate,
                "eDate": eDate
            },
            crossDomain: true,
            url: "/manage/crmcomplaints/Listtongji",
            success: function (data) {
                if (data.code !== 404) {
                    for (var i = 0; i < data.name.length; i++) {
                        ctype.push(data.name[i]);
                    }
                    var cos = formatNum(data);
                    for (var i = 0; i < cos.dest.length; i++) {
                        if (status === 0) {
                            cdate.push(new Date(cos.dest[i].date).format("yyyy-MM-dd"));
                        } else if (status === 1) {
                            cdate.push(new Date(cos.dest[i].date).format("yyyy-MM-dd"));
                        } else if (status === 2) {
                            cdate.push(new Date(cos.dest[i].date).format("yyyy-MM"));
                        } else if (status === 3) {
                            cdate.push(new Date(cos.dest[i].date).format("yyyy"));
                        }
                    }
                    for (var i = 0; i < data.typeCount; i++) {
                        series.push({
                            name: ctype[i],
                            type: 'bar',
                            label: {
                                normal: {
                                    show: true,
                                    formatter: function (params) {
                                        if (params.value > 0) {
                                            return params.value;
                                        } else {
                                            return '';
                                        }
                                    },
                                }
                            },
                            barGap: '0',
                            data: cos.realnum[i],
                        });
                    }
                    if (status == 0) {
                        $("#sDate").val(data.visdate);
                        $("#eDate").val(data.viedate);
                    }
                }
                wh(cdate, ctype, series);
                resizeChart("main");
            },
            error: function (data) {
                console.log("失败：" + data);
            }
        });
    }

    function submitChangeMonth(status, sDate, eDate) {
        var cdate = [];
        var ctype = [];
        var series = [];
        $.ajax({
            type: "POST",
            dataType: "json",
            data: {
                "status": status,
                "sDate": sDate,
                "eDate": eDate
            },
            crossDomain: true,
            url: "/manage/crmcomplaints/Listtongji",
            success: function (data) {
                if (data.code != 404) {
                    for (var i = 0; i < data.name.length; i++) {
                        ctype.push(data.name[i]);
                    }
                    var cos = formatNum(data);
                    for (var i = 0; i < cos.dest.length; i++) {
                        if (status == 0) {
                            cdate.push(new Date(cos.dest[i].date).format("yyyy-MM-dd"));
                        } else if (status == 1) {
                            cdate.push(new Date(cos.dest[i].date).format("yyyy-MM-dd"));
                        } else if (status == 2) {
                            cdate.push(new Date(cos.dest[i].date).format("yyyy-MM"));
                        } else if (status == 3) {
                            cdate.push(new Date(cos.dest[i].date).format("yyyy"));
                        }


                    }
                    for (var i = 0; i < data.typeCount; i++) {
                        series.push({
                            name: ctype[i],
                            type: 'bar',
                            label: {
                                normal: {
                                    show: true,
                                    formatter: function (params) {
                                        if (params.value > 0) {
                                            return params.value;
                                        } else {
                                            return '';
                                        }
                                    },
                                }
                            },
                            barGap: '0',
                            data: cos.realnum[i],
                        });
                    }
                }
                whMonth(cdate, ctype, series);
                resizeChart("mainMonth");
            },
            error: function (data) {
                console.log("失败：" + data);
            }
        });
    }

    function submitChangeYear(status, sDate, eDate) {
        var cdate = [];
        var ctype = [];
        var series = [];
        $.ajax({
            type: "POST",
            dataType: "json",
            data: {
                "status": status,
                "sDate": sDate,
                "eDate": eDate
            },
            crossDomain: true,
            url: "/manage/crmcomplaints/Listtongji",
            success: function (data) {
                if (data.code != 404) {
                    for (var i = 0; i < data.name.length; i++) {
                        ctype.push(data.name[i]);
                    }
                    var cos = formatNum(data);
                    for (var i = 0; i < cos.dest.length; i++) {
                        if (status == 0) {
                            cdate.push(new Date(cos.dest[i].date).format("yyyy-MM-dd"));
                        } else if (status == 1) {
                            cdate.push(new Date(cos.dest[i].date).format("yyyy-MM-dd"));
                        } else if (status == 2) {
                            cdate.push(new Date(cos.dest[i].date).format("yyyy-MM"));
                        } else if (status == 3) {
                            cdate.push(new Date(cos.dest[i].date).format("yyyy"));
                        }


                    }
                    for (var i = 0; i < data.typeCount; i++) {
                        series.push({
                            name: ctype[i],
                            type: 'bar',
                            label: {
                                normal: {
                                    show: true,
                                    formatter: function (params) {
                                        if (params.value > 0) {
                                            return params.value;
                                        } else {
                                            return '';
                                        }
                                    },
                                }
                            },
                            barGap: '0',
                            data: cos.realnum[i],
                        });
                    }
                }
                whYear(cdate, ctype, series);
                resizeChart("mainYear");
            },
            error: function (data) {
                console.log("失败：" + data);
            }
        });
    }

    Date.prototype.format = function (format) {
        var o = {
            "M+": this.getMonth() + 1, //month
            "d+": this.getDate(), //day
            "h+": this.getHours(), //hour
            "m+": this.getMinutes(), //minute
            "s+": this.getSeconds(), //second
            "q+": Math.floor((this.getMonth() + 3) / 3), //quarter
            "S": this.getMilliseconds() //millisecond
        }
        if (/(y+)/.test(format)) format = format.replace(RegExp.$1,
            (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(format))
                format = format.replace(RegExp.$1,
                    RegExp.$1.length == 1 ? o[k] :
                        ("00" + o[k]).substr(("" + o[k]).length));
        return format;
    }
</script>

<script>
</script>
</body>
</html>
