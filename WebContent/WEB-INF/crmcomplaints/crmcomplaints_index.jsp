<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	java.util.Date date = new java.util.Date();
	DateFormat formatter = new SimpleDateFormat("HH:mm:ss");
	String Fordate="";
	String Todate="";
	try
	{
		Fordate = request.getParameter("Fordate").trim();
		Todate = request.getParameter("Todate").trim();
	}
	catch (Exception e)
	{
	}
	if(Fordate == null || Fordate.equals("") || Todate == null || Todate.equals("")){
		pageContext.setAttribute("Fordate",formatter.format(date));
		pageContext.setAttribute("Todate",formatter.format(date));
	}else{
		pageContext.setAttribute("Fordate",Fordate);
		pageContext.setAttribute("Todate",Todate);
	}
	try
	{
		pageContext.setAttribute("lotteryid",request.getParameter("lotteryid").trim());
	}
	catch (Exception e)
	{
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta content="no-cache,must-revalidate" http-equiv="Cache-Control">
	<meta content="no-cache" http-equiv="pragma">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>折线图表和柱形图表</title>
	<%@ include file="../tag.jsp" %>
	<script type="text/javascript" src="<%=basePath%>resources/js/jQuery.js"></script>
	<%--<script type="text/javascript" src="<%=basePath%>resources/js/jqplot.js"></script>--%>
	<script type="text/javascript" src="<%=basePath%>resources/js/jqplot/jquery.jqplot.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>resources/js/jqplot/examples/syntaxhighlighter/scripts/shCore.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>resources/js/jqplot/examples/syntaxhighlighter/scripts/shBrushJScript.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>resources/js/jqplot/examples/syntaxhighlighter/scripts/shBrushXml.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>resources/js/jqplot/plugins/jqplot.logAxisRenderer.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>resources/js/jqplot/plugins/jqplot.canvasTextRenderer.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>resources/js/jqplot/plugins/jqplot.canvasAxisLabelRenderer.min.js"></script>

	<script type="text/javascript" src="<%=basePath%>resources/js/jqplot/plugins/jqplot.canvasAxisTickRenderer.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>resources/js/jqplot/plugins/jqplot.dateAxisRenderer.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>resources/js/jqplot/plugins/jqplot.categoryAxisRenderer.min.js"></script>

	<script type="text/javascript" src="<%=basePath%>resources/js/jqplot/plugins/jqplot.barRenderer.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>resources/js/jqplot/plugins/jqplot.pointLabels.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>resources/js/jqplot/plugins/jqplot.dateAxisRenderer.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>resources/js/jqplot/plugins/jqplot.dateAxisRenderer.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>/resources/js/m_jqplot.js"></script>




	<script src="<%=basePath%>resources/My97DatePicker/WdatePicker.js"></script>
	<style>
		@media screen and (orientation : landscape) {
			pphtml {
				width: 100vh;
				height: 100vm;
				transform: rotate(90deg);
				transform-origin: 50vw 50vw;
			}
		}
	</style>
</head>
<body>
<form method="get" action="crmcomplaints_list"
	  id="form1" class="form-horizontal">
	<table class="table table-striped">
		<tr>
			<td style="line-height: 2.8rem"><label>类型：</label></td>
			<td>
				<input type="checkbox" name="type" value="1" <c:forEach  items="${type}" var="item" >${item == 1 ? "checked" : "" }</c:forEach>>A
				<input type="checkbox" name="type" value="2" <c:forEach  items="${type}" var="item"  >${item == 2 ? "checked" : "" }</c:forEach>>B
				<input type="checkbox" name="type" value="3" <c:forEach  items="${type}" var="item"  >${item == 3 ? "checked" : "" }</c:forEach>>C
				<input type="checkbox" name="type" value="4" <c:forEach  items="${type}" var="item"  >${item == 4 ? "checked" : "" }</c:forEach>>D
				<input type="checkbox" name="type" value="5" <c:forEach  items="${type}" var="item"  >${item == 5 ? "checked" : "" }</c:forEach>>E<br>
				<input type="checkbox" name="type" value="6" <c:forEach  items="${type}" var="item"  >${item == 6 ? "checked" : "" }</c:forEach>>F
			<td style="margin-left:20px">
				<input type="text" name="stime" id="stime" value="" class="form-control"
					   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" ></td>
			<td>至</td>
			<td><input type="text" name="etime" id="etime" class="form-control"
					   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"></td>
			<td><input type="button" value="查&nbsp;询" class="form-control" id="submit"">
			</td>
		</tr>
	</table>
</form>
<div id="chart1"></div>
<div style="text-align:center;clear:both;">
</div>
<div id="chart2"></div>
<script type="text/javascript">
    //$(function(){
    $("#submit").click(function (){
        $("#chart2").html(""); //每次点击 id="submit"时，移除id="chart2"的内容  (HTML()函数代表里面的内容 （“”）表示为空)
        var result="";
        obj = document.getElementsByName("type");
        check_val = [];
        for(k in obj){
            if(obj[k].checked)
                check_val.push(obj[k].value);
        }
        var id=1003;
        var stime=$("#stime").val();
        var etime=$("#etime").val();
        if(etime<stime){
            alert("日期有误");
            //$("#stime").val(""); //清空id="stime"的值为空
            $("#etime").val("");
            $("#etime").select(); //将鼠标光标定位在id="stime"的输入框
        }else{
            var type=check_val.join(",");
            $.ajax({
                url:"getlistbynumber",
                data:{
                    "stime":stime,
                    "etime":etime,
                    "type":type
                },
                error:function(){  //失败调用的方法
                    alert("error");
                },
                success:function(data){ //成功调用的方法
                    var date=[];
                    var count1=[];
                    var count2=[];
                    var count3=[];
                    var count4=[];
                    var count5=[];
                    var count6=[];
                    var type=[];
                    for(var i=0;i<data.msg.length;i++){
                        date.push(data.msg[i].days);
                        count1.push(data.msg[i].count1);
                        count2.push(data.msg[i].count2);
                        count3.push(data.msg[i].count3);
                        count4.push(data.msg[i].count4);
                        count5.push(data.msg[i].count5);
                        count6.push(data.msg[i].count6);
                    }
                    console.log(date);
                    var data_max = 10; //Y轴最大刻度
                    //  var line_title = ["A","B","C","D","E","F"]; //曲线名称
                    var line_title=[];
                    var y_label = "投诉次数"; //Y轴标题
                    var x_label = "日期"; //X轴标题
                    var title = "这是标题"; //统计图标标题
                    //当counti 数组全部为0 时代表时空的就不push到type数组里面，否则push
                    for(var i=0;i<count1.length;i++)
                    {
                        var flag1=false;
                        if(count1[i]!=0)
                        {
                            flag1=true;
                            break;
                        }
                    }
                    for(var i=0;i<count2.length;i++)
                    {
                        var flag2=false;
                        if(count2[i]!=0)
                        {
                            flag2=true;
                            break;
                        }
                    }
                    for(var i=0;i<count3.length;i++)
                    {
                        var flag3=false;
                        if(count3[i]!=0)
                        {
                            flag3=true;
                            break;
                        }
                    }
                    for(var i=0;i<count4.length;i++)
                    {
                        var flag4=false;
                        if(count4[i]!=0)
                        {
                            flag4=true;
                            break;
                        }
                    }
                    for(var i=0;i<count5.length;i++)
                    {
                        var flag5=false;
                        if(count5[i]!=0)
                        {
                            flag5=true;
                            break;
                        }
                    }
                    for(var i=0;i<count6.length;i++)
                    {
                        var flag6=false;
                        if(count6[i]!=0)
                        {
                            flag6=true;
                            break;
                        }
                    }

                    if(flag1){
                        type.push(count1);
                        line_title.push("A");//拼接成新数组
                    }else{
                        //alert(count1.length);
                        type.push();
                        line_title.push();
                    }
                    if(flag2){
                        type.push(count2);
                        line_title.push("B");

                    }else{
                        type.push();
                        line_title.push();
                    }
                    if(flag3){
                        type.push(count3);
                        line_title.push("C");

                    }else{
                        type.push();
                        line_title.push();
                    }
                    if(flag4){
                        type.push(count4);
                        line_title.push("D");
                    }else{
                        type.push();
                        line_title.push();
                    }
                    if(flag5){
                        type.push(count5);
                        line_title.push("E");
                    }else{
                        type.push();
                        line_title.push();
                    }
                    if(flag6){
                        type.push(count6);
                        line_title.push("F");
                    }else{
                        type.push();
                        line_title.push();
                    }
                    console.log("----------------");
                    console.log(type);
                    console.log("----------------");
                    // type=[count1,count2,count3,count4,count5,count6];
                    // console.log("type:"+type);
                    //j.jqplot.diagram.base("chart1", type, line_title, "订单走势图", date, x_label, y_label, data_max, 1);
                    j.jqplot.diagram.base("chart2", type, line_title, "投诉统计", date, x_label, y_label, data_max, 2);
                    //}
                }
            });
        }
    });
			//转换日期
			Date.prototype.format =function(format)
			{
				var o = {
					"M+" : this.getMonth()+1, //month
					"d+" : this.getDate(), //day
					"h+" : this.getHours(), //hour
					"m+" : this.getMinutes(), //minute
					"s+" : this.getSeconds(), //second
					"q+" : Math.floor((this.getMonth()+3)/3), //quarter
					"S" : this.getMilliseconds() //millisecond
				}
				if(/(y+)/.test(format)) format=format.replace(RegExp.$1,
					(this.getFullYear()+"").substr(4- RegExp.$1.length));
				for(var k in o)if(new RegExp("("+ k +")").test(format))
					format = format.replace(RegExp.$1,
						RegExp.$1.length==1? o[k] :
							("00"+ o[k]).substr((""+ o[k]).length));
				return format;
			}
</script>
</body>
</html>

