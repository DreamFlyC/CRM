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
<title>${appName}_执行人管理</title>
<style type="text/css">
table thead tr th, table tbody tr td ,table tfoot tr th{
	text-align: center;
}
table tfoot tr td{
	text-align: left;
}
table tbody tr td a{
	color:#295f8f;
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
			<li><a href="<%=basePath%>duty/duty_list.html">工单列表</a></li>
			<li><a href="javascript:void(0);">执行人管理</a></li>
		</ul>
	</div>
	<div class="rightContainer">
		<button class="btn btn-primary"
			onclick="javascript:window.location.reload()">
			<span class="glyphicon glyphicon-refresh"></span> 刷新
		</button>
		<div class="cls"></div>
		<c:choose>
			<c:when test="${dutyUserList.size() <=0}">
				<div style="text-align: center;">
					<p>没有找到数据记录</p>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${dutyUserList}" var="dutyUser">
					<div class="panel-heading">
							<b style="font-size: 24px;">【${dutyUser.dutyUsername.user}】执行人管理</b>
					</div>
					<table fit="true" fitColumns="true"
						class="table table-striped table-hover table-bordered">
						<thead>
							<tr>
								<!--  <th class="a"><input type="checkbox" id="all" name="allCK" onclick="selectAll()"/></th> -->
								<th class="a">工单编号</th>
								<th class="a">工单名称</th>
								<th class="a">执行人</th>
								<th class="a">工单周期</th>
								<th class="a">状态</th>
								<th class="a">完成进度</th>
								<th class="a" colspan="2">操作</th>
							</tr>
						</thead>
						<tbody>
							<input type="hidden" value="${dutyUser.id}">
							<tr>
								<%-- <td class="a"><input type="checkbox" name="box"
									onclick="selectOne()" value="${dutyUser.id}"></td> --%>
								<td class="a">${dutyUser.duty.number}</td>
								<td class="a">${dutyUser.duty.title}</td>
								<td class="a" id="${dutyUser.id}">${dutyUser.dutyUsername.user}</td>
								<td class="a"><fmt:formatDate value="${dutyUser.startdate}"
										pattern="yyyy-MM-dd HH:mm:ss" /><span>至</span> <fmt:formatDate
										value="${dutyUser.enddate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<%-- <td class="a">${dutyUser.appendix}</td> --%>
								<td class="a dkey${dutyUser.userid}">${dutyUser.dkey==1?"<span style='color:#0466cb;'>已完成</span>":(dutyUser.dkey==2?"进行中":"<span style='color:#EE0000;'>未接受</span>")}</td>
								<td class="a">${dutyUser.dutyLog.progress==null?0:(dutyUser.dutyLog.progress)>100?100:dutyUser.dutyLog.progress}%</td>
								<td style="text-align: center;" style="padding: 0px;"><c:if
										test="${dutyUser.dkey==3||dutyUser.dkey==0}">
										<button class="btn btn-default"
											onclick="edit(${dutyUser.userid},${dutyUser.dutyid})"
											id="b${dutyUser.userid}"
											name="${dutyUser.userid}/${dutyUser.dutyid}">接受工单</button>
										<!--默认隐藏  -->
										<div id="e${dutyUser.userid}" style="display: none;">
											<a href="duty/dolog/${dutyUser.dutyid}/${dutyUser.userid}.html">录入进度</a>
											<a href="duty/loghistory/${dutyUser.dutyid}/${dutyUser.userid}.html">查看历史录入</a></td>
										</div>
								</c:if>
								<c:if test="${dutyUser.dkey==2||dutyUser.dkey==1}">
									<c:if test="${dutyUser.dkey!=1}">
									<a href="duty/dolog/${dutyUser.dutyid}/${dutyUser.userid}.html">录入进度</a>
									</c:if>
									<a
										href="duty/loghistory/${dutyUser.dutyid}/${dutyUser.userid}.html">查看历史录入</a>
									</td>
								</c:if>
								</td>
							</tr>
						</tbody>
						<tfoot>
						<tr>
							<th class="a">内容:</th>
							<td class="a"colspan="6">${dutyUser.content==null?"无":dutyUser.content}</td>
						</tr>
						<tr>
							<th class="a">备注:</th>
							<td class="a"colspan="6">${dutyUser.note==null?"无":dutyUser.note}</td>
						</tr>
						<tr>
							<th class="a">附件:</th>
							<td style="text-align: left;" colspan="6">
							<c:if test="${dutyUser.dutyLogList.size()>0}">
								<c:forEach items="${dutyUser.dutyLogList}" var="dutyLog" varStatus="var">
										<c:if test="${dutyLog.appendix!=null&&dutyLog.appendix!=''}">
											${var.index+1}.${dutyLog.appendix}<br>
										</c:if> 
								</c:forEach>
							</c:if>
							<c:if test="${dutyUser.dutyLogList.size()<=0}">
							 	无
							</c:if> 
							</td>
						</tr>
						</tfoot>
					</table>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="cls"></div>
	<%@ include file="../foot.jsp"%>
	<script type="text/javascript">
			function edit(userid,dutyid){ //传两个参数，useid和dutyid
				//LW.message.show("userid="+userid+"dutyid="+dutyid);
				$.ajax({
					type:"post",
					url:"dutyUser/editDkey/"+userid+"/"+dutyid,
					success: function(){
						$(".dkey"+userid).html("进行中");
						$("#e"+userid).show();
						$("#b"+userid).remove();
					}
				});
			}
	</script>

</body>
</html>