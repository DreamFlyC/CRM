<%--
  Created by IntelliJ IDEA.
  User: CZP
  Date: 2018/11/22
  Time: 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.lang.String"%>
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
<html>
<head>
    <base href="<%=basePath%>" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8;" />
    <script src="<%=basePath%>resources/js/echarts.min.js"></script>
    <%@ include file="../tag.jsp"%>
    <style type="text/css">
        #pie{
            height: 350px !important;
        }
        #main{
            height: 350px !important;
        }
        table thead tr th, table tbody tr td {
            text-align: center;
        }
        .search
        {
            left: 0;
            position: relative;
        }
        #auto_div
        {
            width:calc(100% - 30px) !important;
            margin-left:15px !important;
            display: none;
            border: 1px #74c0f9 solid;
            background: #FFF;
            position: absolute;
            top: 55px;
            left: 0;
            color: #323232;
            border-radius: 10px;
            box-shadow: 5px 5px 5px #888888;
            height: 200px;
            overflow: auto;
            z-index: 1;
        }
        .sup-xx{
            color: #c9d0c6;
            position: absolute;
            top: 5px;
            right: 24px;
            font-size: 24px;
            cursor:pointer;
        }
        .sup-xx:hover {
            color: #a3a9a0;
        }
        .dateText{
            float: left;
            height: 34px;
            line-height: 34px;
            text-align: right;
            margin-left: 15px;
        }
    </style>
    <title>统计</title>
</head>
<body>
<%@ include file="../top.jsp" %>
<%@ include file="../left.jsp" %>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="<%=basePath%>manage/index.html">首页</a></li>
        <li><a href="<%=basePath%>manage/crmstock/crmstock_list.html">库存列表</a></li>
        <li>库存统计</li>
    </ul>
</div>
<div class="rightContainer">
        <%--搜索框--%>
        <div style="margin:20px 0px;">
            <div class="dateText">
                <label for="sDate">日期：</label>
            </div>
            <div class="col-md-3" style="position: relative;">
                <input type="text" name="sDate" id="sDate" autocomplete="off" placeholder="开始时间" maxlength="20" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5a-zA-Z0-9\w]/g,'')"
                       class="form-control" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value="">
                <i class="fa fa-times-circle sup-xx" id="keyword1" aria-hidden="true"></i>
            </div>
            <div class="col-md-3" style="position: relative;">
                <input type="text" name="eDate" id="eDate" autocomplete="off" placeholder="结束时间" maxlength="20" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5a-zA-Z0-9\w]/g,'')"
                       class="form-control" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value="">
                <i class="fa fa-times-circle sup-xx" id="keyword2" aria-hidden="true"></i>
            </div>
            <div class="col-md-2">
                <input type="button" id="submit" value="查&nbsp;询" class="form-control btn-primary" >
            </div>
            <div style="clear: both"></div>
        </div>
    <%--统计图展示--%>
    <div id="pie"  class="col-md-7"></div>
    <div id="main" class="col-md-5"></div>
</div>
<div class="cls"></div>
    <script>
        var pieData = [];
        var type = []; // type数组
        var stocknum = []; // stockunum数组
        function showchartPie() {
            var dom = document.getElementById("pie");
            var myChartPie = echarts.init(dom);
            option = null;
            option = {
                aira: {
                    show: true
                },
                title: {
                    text: '库存统计',
                    // x: 'center'
                    left:'50%',
                },
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    type: 'scroll',
                    orient: 'vertical',
                    left: 10,
                    top: 20,
                    bottom: 20,
                },
                series: [
                    {
                        name: '库存统计',
                        type: 'pie',   //类型 pie为饼 bar为柱
                        radius : '55%',
                        center: ['55%', '50%'], // 位置 x y
                        label: {
                            normal: {
                                show: true,
                                formatter: '{b}: {c}({d}%)',
                                fontSize:14,
                            }
                        },
                        data: pieData,
                        // data: data.seriesData,
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        },
                    }
                ],
                //color:['red','green','yellow','#e3e332','#222']
            };
            if (option && typeof option === "object") {
                myChartPie.setOption(option, true);
            }
        }




        //条形图
        function showchartBar(){
            var myChartBar = echarts.init(document.getElementById('main'));
            option = {
                title: {
                    text: '库存统计',
                    textStyle:{                 //---主标题内容样式

                    },
                    x:'center',
                    y:'top',
                    textAlign:'left',
                },
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {
                        type: 'shadow'
                    }
                },
                legend: {
                    show:false,
                },
                grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                xAxis: {
                    type: 'value',
                    name:'库存总量',
                    nameLocation:'middle',
                    nameGap:'20',
                },
                yAxis: {
                    type: 'category',
                    data: type,
                    name:'类别',
                },
                series: [
                    {
                        name: '挖掘机',
                        type: 'bar',
                        data: stocknum,
                        center: ['50%', '50%'], // 位置 x y
                        itemStyle: {
                            normal: {
                                color: function (params) {
                                    var colorList = [
                                        'rgb(243,33,62)',
                                        'rgb(139,145,161)',
                                        'rgb(214,172,0)',
                                        'rgb(156,184,47)',
                                        'rgb(29,126,159)',
                                        'rgb(141,110,115)',
                                        'rgb(209,48,63)',
                                        'rgb(123,181,201)',
                                    ];
                                    return colorList[params.dataIndex];
                                }
                            },
                            //鼠标悬停
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0,0,0,0.5)'
                            }
                        },
                        label: {
                            normal: {
                                show: true,
                                formatter: '{c}'
                            }
                        },
                    }
                ]
            };

            myChartBar.setOption(option);
        }
        $(function () {
            $.ajax({
                url:"manage/crmstock/crmstock_getstatistics",
                type:"POST",
                dataType:"json",
                error:function(data){
                    console.log(data);
                },
                success:function(data){
                    for(var i=0;i<data.msg.length;i++){
                        var name=data.msg[i].crmName.name;
                        type.push(name);
                        stocknum.push(data.msg[i].stocknum);
                        var msg={};
                        msg.value=data.msg[i].stocknum;
                        msg.name=data.msg[i].crmName.name;
                        pieData.push(msg);
                    }
                    console.log(type);
                    showchartBar();   //图表执行
                    showchartPie();
                }

            });
        });
        $(function(){
            $("#keyword1").click(function(){
                $("#sDate").val("");
            });
            $("#keyword2").click(function(){
                $("#eDate").val("");
            });

            $("#submit").click(function(){
                var key=true;
                if($("#sDate").val()==''){
                    LW.message.show("请选择开始日期");
                    key=false;
                }
                if($("#eDate").val()==''){
                    LW.message.show("请选择结束日期");
                    key=false;
                }
                if($("#sDate").val()>$("#eDate").val()){
                    LW.message.show("日期不合法，请重新选择");
                    $("#sDate").val("");
                    $("#eDate").val("");
                    key=false;
                }
                if(key){
                    type=[];
                    stocknum=[];
                    pieData=[];
                    $.ajax({
                        url:"manage/crmstock/crmstock_getstatistics",
                        type:"POST",
                        dataType:"json",
                        data:{
                            "sDate":$("#sDate").val(),
                            "eDate":$("#eDate").val()
                        },
                        error:function(data){
                            console.log(data);
                        },
                        success:function(data){
                            for(var i=0;i<data.msg.length;i++){
                                var name=data.msg[i].crmName.name;
                                type.push(name);
                                stocknum.push(data.msg[i].stocknum);
                                var msg={};
                                msg.value=data.msg[i].stocknum;
                                msg.name=data.msg[i].crmName.name;
                                pieData.push(msg);
                            }
                            // 图表执行
                            showchartBar();
                            showchartPie();
                        }

                    });
                }
            });
        });
    </script>
</body>
</html>
