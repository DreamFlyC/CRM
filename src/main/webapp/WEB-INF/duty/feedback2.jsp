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
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8;" />
<%@ include file="../tag.jsp"%>
<title>历史录入进度</title>

<script type="text/javascript">
function isValid() {
	if (form1.sdate.value != "" && form1.edate.value == "") {
		LW.message.show("请选择任务结束日期!");
		form1.edate.select();
		return false;
	}
	if (form1.edate.value != "" && form1.sdate.value == "") {
		LW.message.show("请选择任务开始日期!");
		form1.sdate.select();
		return false;
	}

	if ( form1.edate.value == "" && form1.sdate.value == "") {
		LW.message.show("请输入查询条件！");
		form1.sdate.select();
		return false;
	}
	if ($("#edate").val() < $("#sdate").val()) {
		LW.message.show("日期不合法，请重新选择日期!");
		form1.sdate.select();
		return false;
	}
	
}
</script>

<style>
th {
	text-align: center;
	width: 100px;
}

.a {
	text-align: center;
	width: 100px;
}
</style>
</head>
<body>
	<%@ include file="../top.jsp"%>
	<%@ include file="../left.jsp"%>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="<%=basePath%>manage/index.html">首页</a></li>
			<li><a href="javascript:void(0);">投诉统计</a></li>
		</ul>
	</div>
	<div class="rightContainer">
		<button class="btn btn-primary"
			onclick="javascript:window.location.reload()">
			<span class="glyphicon glyphicon-refresh"></span> 刷新
		</button>
		<div class="cls"></div>
		<form method="post" action="duty/doFeedBack" onsubmit="return isValid(this)"
			id="form1" class="form-horizontal">
			<table class="table table-striped">
				<tr>
					<td style="line-height: 2.8rem"><label>投诉类型：</label></td>
					<td><input type="checkbox" name="type" value="1" <c:forEach  items="${type}" var="item"  >${item == 1 ? "checked" : "" }</c:forEach>>菜份量
					<input type="checkbox" name="type" value="2" <c:forEach  items="${type}" var="item"  >${item == 2 ? "checked" : "" }</c:forEach>>菜口感
					<input type="checkbox" name="type" value="3" <c:forEach  items="${type}" var="item"  >${item == 3 ? "checked" : "" }</c:forEach>>饭份量
					<input type="checkbox" name="type" value="4" <c:forEach  items="${type}" var="item"  >${item == 4 ? "checked" : "" }</c:forEach>>饭口感
					<input type="checkbox" name="type" value="5" <c:forEach  items="${type}" var="item"  >${item == 5 ? "checked" : "" }</c:forEach>>汤份量<br>
					<input type="checkbox" name="type" value="6" <c:forEach  items="${type}" var="item"  >${item == 6 ? "checked" : "" }</c:forEach>>汤品质
					<input type="checkbox" name="type" value="7" <c:forEach  items="${type}" var="item"  >${item == 7 ? "checked" : "" }</c:forEach>>有严重异物
					<input type="checkbox" name="type" value="8" <c:forEach  items="${type}" var="item"  >${item == 8 ? "checked" : "" }</c:forEach>>其他问题或建议
					<input type="checkbox" name="type" value="9" <c:forEach  items="${type}" var="item"  >${item == 9 ? "checked" : "" }</c:forEach>>好评</td>
					<td style="line-height: 2.8rem"><label>投诉日期：</label></td>
					<td><input type="text" name="sdate" id="sdate" value="${sdate}"
						class="form-control" autocomplete="off"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value=""></td>
					<td style="line-height: 2.8rem"><label>至</label></td>
					<td><input type="text" name="edate" id="edate" value="${edate}"
						class="form-control" autocomplete="off"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value=""></td>
					<td><input type="submit" value="查&nbsp;询" class="form-control btn-primary"></td>
				</tr>
			</table>
		</form>
		<div id="chart1"></div>
	<div style="text-align:center;clear:both;">
</div>
<div id="chart2"></div>


	<script type="text/javascript">
	
 var data = [];  //数值
	 var x = [];
	 var count1Arr = [];//定义类型为1的数组
	 var count2Arr = [];//定义类型为2的数组
	 var count3Arr = [];
	 var count4Arr = [];
	 var count5Arr = [];
	 var count6Arr = [];
	 var count7Arr = [];
	 var count8Arr = [];
	 var count9Arr = [];
<c:forEach items="${dutyList}" var="duty"  varStatus="vs">

	count1Arr.push('${duty.count1}');//取对应数据
	count2Arr.push('${duty.count2}');
	count3Arr.push('${duty.count3}');
	count4Arr.push('${duty.count4}');
	count5Arr.push('${duty.count5}');
	count6Arr.push('${duty.count6}');
	count7Arr.push('${duty.count7}');
	count8Arr.push('${duty.count8}');
	count9Arr.push('${duty.count9}');
	 x.push([
		'${duty.days}'
	 ]);
</c:forEach>   
	
   var line_title=[];  //曲线名称
	
	
	/*
	判断count1Arr-count9Arr的值是否全为0，是则push()空的，否则push(count_Arr).
	*/
	for(var i=0;i<count1Arr.length;i++){
	var flag1=false;
		if(count1Arr[i]!=0){
			flag1=true;
			break;
		}
	}
	for(var i=0;i<count2Arr.length;i++){
		var flag2=false;
		if(count2Arr[i]!=0){
			flag2=true;
			break;
		}
	}
	for(var i=0;i<count3Arr.length;i++){
		var flag3=false;
		if(count3Arr[i]!=0){
			flag3=true;
			break;
		}
	}
	for(var i=0;i<count4Arr.length;i++){
		var flag4=false;
		if(count4Arr[i]!=0){
			flag4=true;
			break;
		}
	}
	for(var i=0;i<count5Arr.length;i++){
		var flag5=false;
		if(count5Arr[i]!=0){
			flag5=true;
			break;
		}
	}
	for(var i=0;i<count6Arr.length;i++){
		var flag6=false;
		if(count6Arr[i]!=0){
			flag6=true;
			break;
		}
	}
	for(var i=0;i<count7Arr.length;i++){
		var flag7=false;
		if(count7Arr[i]!=0){
			flag7=true;
			break;
		}
	}
	for(var i=0;i<count8Arr.length;i++){
		var flag8=false;
		if(count8Arr[i]!=0){
			flag8=true;
			break;
		}
	}
	for(var i=0;i<count9Arr.length;i++){
		var flag9=false;
		if(count9Arr[i]!=0){
			flag9=true;
			break;
		}
	}
	
					
			if(flag1){
			//	LW.message.show(count1Arr.length);
				data.push(count1Arr);
				line_title.push("菜份量");//拼接成新数组
		    }else{
		    	//LW.message.show(count1Arr.length);
		   	 data.push();
		   	line_title.push();
		    }     
             if(flag2){
				data.push(count2Arr);
				line_title.push("菜口感");
				 
              }else{
             	 data.push();
             	line_title.push();
              }
             if(flag3){
 				data.push(count3Arr);
 				line_title.push("饭份量");
 				
               }else{
              	 data.push();
              	line_title.push();
               }
             if(flag4){
 				data.push(count4Arr);
 				line_title.push("饭口感");
               }else{
              	 data.push();
              	line_title.push();
               }
             if(flag5){
  				data.push(count5Arr);
  				line_title.push("汤份量");
                }else{
               	 data.push();
               	line_title.push();
                }
             if(flag6){
  				data.push(count6Arr);
  				line_title.push("汤品质");
                }else{
               	 data.push();
               	line_title.push();
                }
             if(flag7){
  				data.push(count7Arr);
  				 line_title.push("有严重异物");
                }else{
               	 data.push();
               	line_title.push();
                }
             if(flag8){
  				data.push(count8Arr);
  				 line_title. push("其他问题或建议");
                }else{
               	 data.push();
               	line_title.push();
                }
             if(flag9){
  				data.push(count9Arr);
  				line_title.push("好评");
                }else{
               	 data.push();
               	line_title.push();
                }
          
            

            //求data数组的最大值与最小值
            //data[][]为二维数组
             var ta=data.join(",").split(",");//转化为一维数组
             //LW.message.show(Math.max.apply(null,ta));//最大值
             //LW.message.show(Math.min.apply(null,ta));//最小值
             
             var max=Math.ceil((Math.max.apply(null,ta))*1.5);
             if(max<5){   //设置max最小为5
            	 max=5;
             }else{
            	 max=max;
             }
var data_max = max; //Y轴最大刻度
//	var line_title = ["菜份量","菜口感" ,"饭份量","饭口感","汤份量","汤品质","有严重异物","其他问题或建议","好评" ]; //曲线名称  
	var y_label = "投诉总量"; //Y轴标题
	var x_label = "日期"; //X轴标题
	//var x = []; //定义X轴刻度值
	var title = "这是标题"; //统计图标标题
	
	j.jqplot.diagram.base("chart1", data, line_title, "投诉统计", x, x_label, y_label, data_max,2); 
	j.jqplot.diagram.base("chart2", data, line_title, "投诉统计", x, x_label, y_label, data_max,1);
</script>

	<center>
		<table>
			<tr>
				<th>投诉时间</th>
				<th>菜份量</th>
				<th>菜口感</th>
				<th>饭份量</th>
				<th>饭口感</th>
				<th>汤份量</th>
				<th>汤品质</th>
				<th>有严重异物</th>
				<th>其他问题或建议</th>
				<th>好评</th>
			</tr>
			<c:if test="${dutyList.size()<=0}">
				<div style="text-align: center;">
					<p>没有找到数据记录</p>
				</div>
			</c:if>
			<c:forEach items="${dutyList}" var="duty" varStatus="vs">
				<tr>
					<td class="a">${duty.days }</td>
					<td class="a">${duty.count1 }</td>
					<td class="a">${duty.count2 }</td>
					<td class="a">${duty.count3 }</td>
					<td class="a">${duty.count4 }</td>
					<td class="a">${duty.count5 }</td>
					<td class="a">${duty.count6 }</td>
					<td class="a">${duty.count7 }</td>
					<td class="a">${duty.count8 }</td>
					<td class="a">${duty.count9 }</td>
				</tr>

			</c:forEach>
		</table>
	</center>
	</div>
	<div class="cls"></div>
	<script type="text/javascript">
			$("#page_feedback").parent().attr("class","active");
	</script>
	<%@ include file="../foot.jsp"%>
</body>
</html>