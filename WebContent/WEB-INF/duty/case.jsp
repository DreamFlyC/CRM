
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
<title>受理工单</title>
<script src="<%=basePath%>resources/js/echarts.min.js"></script>

<script type="text/javascript">
function isValid() {
	if (form1.username.value == ""&&form1.stime.value == ""
			&& form1.etime.value == "") {
		LW.message.show("请输入查询条件！");
		form1.username.select();
		return false;
	}
	if (form1.stime.value != "" && form1.etime.value == "") {
		LW.message.show("请选择任务结束日期!");
		form1.etime.select();
		return false;
	}
	if (form1.etime.value != "" && form1.stime.value == "") {
		LW.message.show("请选择任务开始日期!");
		form1.stime.select();
		return false;
	}
	if ($("#etime").val() < $("#stime").val()) {
		LW.message.show("日期不合法，请重新选择日期!");
		form1.stime.select();
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
</head>
<body>
	<%@ include file="../top.jsp"%>
	<%@ include file="../left.jsp"%>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="<%=basePath%>manage/index.html">首页</a></li>
			<li><a href="javascript:void(0);">受理工单</a></li>
		</ul>
	</div>
	<div class="rightContainer">
		<div class="cls"></div>
		<script type="text/javascript">
			$("#page_case").parent().attr("class","active");
		</script> 
		<!--main  -->
		<div style="width: 100%; height: 50px; background-color: #92ebd3">
			<form method="post" action="duty/case" onsubmit="return isValid(this)"
				id="form1" class="form-horizontal">
				<table class="table table-striped">
					<tr>
						<td style="line-height: 2.8rem"><label>执行人：</label></td>
						<td><input type="text" name="username" id="username"
							value="${username}" class="form-control"></td> 
						<td style="line-height: 2.8rem"><label>发布日期：</label></td>
						<td><input type="text" name="stime" id="stime"
							class="form-control" value="${stime}"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd '})"></td>
						<td style="line-height: 2.8rem"><label>至</label></td>
						<td><input type="text" name="etime" id="etime"
							class="form-control" value="${etime}"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd '})"></td>
						<td><input type="submit" value="查&nbsp;询" class="form-control btn btn-primary"></td>
					</tr>
				</table>
			</form>
		</div>
		<div id="container1" style="height: 200px; width: 25%; float: left;"></div>
		<div id="container2" style="height: 200px; width: 25%; float: left;"></div>
		<div id="container3" style="height: 200px; width: 25%; float: left;"></div>
		<div id="container4" style="height: 200px; width: 25%; float: left;"></div>
		<div style="margin-top: -20px; position: relative; top: -20px;">
			<div class="duty">
				<p class="gd">${now==null||now==""?0:now}/${nowCount==null||nowCount==""?0:nowCount}</p>
				<p class="gd">今日受理工单</p>
			</div>
			<div class="duty">
				<p class="gd">${urgent==null||urgent==""?0:urgent}/${urgentCount==null||urgentCount==""?0:urgentCount}</p>
				<p class="gd">紧急受理工单</p>
			</div>
			<div class="duty"">
				<p class="gd">
				${common==null||common==""?0:common}/${commonCount==null||commonCount==""?0:commonCount}
				</p>
				<p class="gd">普通受理工单</p>
			</div>
			<div class="duty">
				<p class="gd">
				${complete==null||complete==""?0:complete}/${count==null||count==""?0:count}
				</p>
				<p class="gd">完成工单</p>
			</div>
		</div>
		<div class="cls"></div>
		<script type="text/javascript">	/*1.今日受理工单  */
		var now='${now}';
		var nowCount='${nowCount}';
		var count='${count}';
		var urgent='${urgent}';
		var urgentCount='${urgentCount}';
		var common='${common}';
		var commonCount='${commonCount}';
		var complete='${complete}';

		var option = {
				backgroundColor : null,
				color : [ '#38a8da', '#efe5e5' ],
				series : [ {
					name : '来源',
					type : 'pie',
					radius : [ '60%', '75%' ],
					avoidLabelOverlap : false,
					hoverAnimation : false,
					label : {
						normal : {
							show : false,
							position : 'center',
							textStyle : {
								fontSize : 26,
								fontWeight : 'bold'
							},
							formatter : '{c}%'
						}
					},
					data : [ {
						value : nowCount==0?0:Math.round(now /nowCount * 100),
						label : {
							normal : {
								show : true
							}
						}
					},
						{
							value : (nowCount==0?1:100 - Math.round(now /nowCount * 100)),
							name : '',
						}
					]
				} ]
			};
			echarts.init(document.getElementById("container1")).setOption(option);
		</script>

		<script type="text/javascript">	/*2.紧急受理工单  */
			var option = {
				backgroundColor : null,
				color : [ '#f02c23', '#efe5e5' ],
				series : [ {
					name : '来源',
					type : 'pie',
					radius : [ '60%', '75%' ],
					avoidLabelOverlap : false,
					hoverAnimation : false,
					label : {
						normal : {
							show : false,
							position : 'center',
							textStyle : {
								fontSize : 26,
								fontWeight : 'bold'
							},
							formatter : '{c}%'
						}
					},
					data : [ {
						value : urgentCount==0?0:Math.round('${urgent}' / '${urgentCount}' * 100),
						name : '',
						label : {
							normal : {
								show : true
							}
						}
					},
						{
							value : urgentCount==0?1:(100 - Math.round('${urgent}' / '${urgentCount}' * 100)),
							name : '',
						}
					]
				} ]
			};
			echarts.init(document.getElementById("container2")).setOption(option);
		</script>
		<script type="text/javascript">	/*3.普通受理工单  */
			var option = {
				backgroundColor : null,
				color : [ '#62b900', '#efe5e5' ],
				series : [ {
					name : '来源',
					type : 'pie',
					radius : [ '60%', '75%' ],
					avoidLabelOverlap : false,
					hoverAnimation : false,
					label : {
						normal : {
							show : false,
							position : 'center',
							textStyle : {
								fontSize : 26,
								fontWeight : 'bold'
							},
							formatter : '{c}%'
						}
					},
					data : [ {
						value : commonCount==0?0:Math.round('${common}' / '${commonCount}' * 100),
						name : '',
						label : {
							normal : {
								show : true
							}
						}
					},
						{
							value : commonCount==0?1:100 - Math.round('${common}' / '${commonCount}' * 100),
							name : '',
						}
					]
				} ]
			};
			echarts.init(document.getElementById("container3")).setOption(option);
		</script>
		<script type="text/javascript">	/*4.完成工单  */
			var option = {
				backgroundColor : null,
				color : [ '#e91ca7', '#efe5e5' ],
				series : [ {
					name : '来源',
					type : 'pie',
					radius : [ '60%', '75%' ],
					avoidLabelOverlap : false,
					hoverAnimation : false,
					label : {
						normal : {
							show : false,
							position : 'center',
							textStyle : {
								fontSize : 26,
								fontWeight : 'bold'
							},
							formatter : '{c}%'
						}
					},
					data : [ {
						value : count==0?0:Math.round('${complete}' / '${count}' * 100),
						name : '',
						label : {
							normal : {
								show : true
							}
						}
					},
						{
							value : count==0?1:(100 - Math.round('${complete}' / '${count}' * 100)),
							name : '',
						}
					]
				} ]
			};
			echarts.init(document.getElementById("container4")).setOption(option);
		</script>

		<div class="panel panel-default col-lg-6">
			<div class="panel-heading">
				<h3 class="panel-title" style="font-size: 24px;">
					<b style="font-size: 24px;">我的工单</b>
				</h3>
			</div>
			<div style="width: auto; height: 400px; overflow: auto;">
				<table class="table table-hover table-bordered table-striped">
					<tr style="position: relative;">
						<th class="a">状态</th>
						<th class="a">标题</th>
						<th class="a">优先度</th>
						<th class="a">最后更新时间</th>
						<th class="a">查看详情</th>
					</tr>
					<c:forEach items="${dutyUserList}" var="dutyUser">
						<tr>
							<td class="b" style="line-height: 2.7em;">${dutyUser.dkey==2?"<span style='color:#09b4f9'>进行中</span>":(dutyUser.dkey==1?"<span style='color:#e91ca7'>已完成</span>":(dutyUser.dkey==3?"<span style='color:red'>未开始</span>":"无"))}</td>
							<td class="b" style="line-height: 2.7em;" title="${dutyUser.duty.title}"><a
								href="duty/usermanag.html?id=${dutyUser.duty.id}">
								<div style=" overflow: hidden; white-space: nowrap;text-overflow: ellipsis;color:#295f8f;
							width: 80px;margin-left: auto;margin-right: auto;">${dutyUser.duty.title}</div></a></td>
							<td class="b" style="line-height: 2.7em;">${dutyUser.duty.level==1?"<span style='color:#62b900'>普通</span>":(dutyUser.duty.	level==2?"<span style='color:red'>紧急</sapn>":"") }</td>
							<c:choose>
								<c:when test="${dutyUser.lastTime!=null || dutyUser.lastTime !=''}">
									<td class="b"><fmt:formatDate value="${dutyUser.lastTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td> 
								</c:when>
								<c:otherwise>
									无
								</c:otherwise>
							</c:choose>
							<td class="b" style="line-height: 2.7em;"><a class="" target="_blank"
								href="duty/usermanag.html?id=${dutyUser.dutyid}"><i
									class="fa fa-search fa-2x" aria-hidden="true"></i></a></td>
						</tr>
					</c:forEach>
				</table>
				<c:if test="${dutyUserList.size()<=0||dutyUserList.size()==null}">
					<div style="text-align: center;">
						<p>没有数据记录</p>
					</div>
				</c:if>
			</div>
		</div>
		<div class="panel panel-default col-lg-6">
			<div class="panel-heading">
				<h3 class="panel-title" style="font-size: 24px;">
					<b style="font-size: 24px;">信息提醒</b>
				</h3>
			</div>
			<div style="width: auto; height: 400px; overflow: auto;">
				<table class="table table-hover table-bordered table-striped">
					<tr>
						<th class="a">状态</th>
						<th class="a">标题</th>
						<th class="a">执行人</th>
						<th class="a">优先度</th>
						<th class="a">工单发布时间</th>
					</tr>
					<c:forEach items="${dutyDkeyList}" var="dutyDkey">
						<tr>
							<td class="b" style="line-height: 2.7em;width: 12%">${dutyDkey.dkey==2?"<span style='color:#09b4f9'>进行中</span>":(dutyDkey.dkey==1?"<span style='color:e91ca7'>已完成</span>":(dutyDkey.dkey==3?"<span style='color:red'>未开始</span>":"无"))}</td>
							<td class="b" style="line-height: 2.7em;">
							<a  class="" target="_blank" title="${dutyDkey.duty.title}" 
							href="duty/usermanag.html?id=${dutyDkey.duty.id}">
							<div style=" overflow: hidden; white-space: nowrap;text-overflow: ellipsis;color:#295f8f;
							width: 80px;margin-left: auto;margin-right: auto;">${dutyDkey.duty.title}</div></a></td>
							<td class="b" style="line-height: 2.7em;" title="${dutyDkey.duty.user}"><div style=" overflow: hidden; 
							white-space: nowrap;text-overflow: ellipsis;
							width: 80px;margin-left: auto;margin-right: auto;">${dutyDkey.duty.user}</div></td>
							<td class="b" style="line-height: 2.7em;width: 12%">${dutyDkey.duty.level==1?"<span style='color:#62b900'>普通</span>":(dutyDkey.level==2?"<span style='color:red'>紧急</sapn>":"") }</td>
							<td class="b"><fmt:formatDate
									value="${dutyDkey.duty.date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						</tr>
					</c:forEach>
				</table>
				<c:if test="${dutyDkeyList.size()<=0||dutyDkeyList.size()==null}">
					<div style="text-align: center;">
						<p>你目前还没有未接受的工单</p>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>