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
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<%@ include file="../tag.jsp"%>
<link href="<%=basePath%>resources/duty/css/dutymobile.css" rel="stylesheet" type="text/css" />
<title>${appName}_执行人管理</title>
<style type="text/css">
.btn {
     margin: 0px;
}
.dutylist{
	margin: 0px; 
	margin-bottom:30px;
}
</style>
</head>
<body>
		<c:choose>
			<c:when test="${dutyUserList.size() <=0}">
				<div style="text-align: center;">
					<p>没有找到数据记录</p>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${dutyUserList}" var="dutyUser">
					<div class="dutylist">
					<div class="container dutycontent" style="position:relative;padding: 10px 15px;">
					<b style="font-size: 24px !important;">${dutyUser.dutyUsername.user}</b>
						<div>
							<span class="dutytitle">${dutyUser.duty.title}</span>
						</div>
						<div>
							<span class="dutyname">工单编号：</span>
							<span>${dutyUser.duty.number}</span>
						</div>
						<div>
							<span class="dutyname">发起人：</span>
							<span>吴慧</span>
						</div>
						<div>
							<span class="dutyname">截止时间：</span>
							<span><fmt:formatDate value="${dutyUser.enddate}" pattern="yyyy-MM-dd HH:mm:ss" /><span>
						</div>
						<div>
							<span class="dutyname">发布时间：</span>
							<span><fmt:formatDate value="${dutyUser.duty.date}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
						</div>
						<div>
							<span class="dutyname a dkey${dutyUser.dutyid}"style="line-height: 2.5em;" name="dkey${dutyUser.dutyid}">状态：</span>
							<span>${dutyUser.duty.dkey==1?"<span style='color:#e91ca7;'>已完成</span>":(dutyUser.duty.dkey==2 ? "<span style='color:#09b4f9'>进行中</span>":"<span style='color:#EE0000;'>未接受</span>")}</span>
						</div>
						<div class="dutylevel">
							${dutyUser.duty.level==1?"<span style='color:#62b900;font-size:20px;'>普通</span>":(dutyUser.duty.level==2?"<span style='color:red;font-size:20px;'>紧急</sapn>":"") }
						</div>
						<div>
							<span class="dutyname">内容：</span>
							<span>${dutyUser.content==null?"无":dutyUser.content}</span>
						</div>
						<div>
							<span class="dutyname">备注：</span>
							<span>${dutyUser.note==null?"无":dutyUser.note}</span>
						</div>
						<div>
							<span class="dutyname">附件：</span>
							<span>
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
							</span>
						</div>
						<c:if test="${dutyUser.dkey==3||dutyUser.dkey==0}">
										<button class="btn btn-primary col-sm-12 col-md-12" style="width:100%"
											onclick="edit(${dutyUser.userid},${dutyUser.dutyid})"
											id="b${dutyUser.userid}"
											name="${dutyUser.userid}/${dutyUser.dutyid}">接受工单</button>
										<!--默认隐藏  -->
										<div id="e${dutyUser.userid}" style="display: none;">
											<a href="duty/dolog/${dutyUser.dutyid}/${dutyUser.userid}.html"  class="btn btn-default" style="width:40%;margin:15px;">录入进度</a>
											<a href="duty/loghistory/${dutyUser.dutyid}/${dutyUser.userid}.html"  class="btn btn-default" style="width:40%;margin:15px;">查看历史录入</a></td>
										</div>
								</c:if>
								<c:if test="${dutyUser.dkey==2||dutyUser.dkey==1}">
									<c:if test="${dutyUser.dkey!=1}">
									<a href="duty/dolog/${dutyUser.dutyid}/${dutyUser.userid}.html" class="btn btn-default" style="width:40%;margin:15px;">录入进度</a>
									</c:if>
									<a
										href="duty/loghistory/${dutyUser.dutyid}/${dutyUser.userid}.html" class="btn btn-default" style="width:40%;margin:15px;">查看历史录入</a>
									</td>
								</c:if>
					</div>
				</div>
				
				</c:forEach>
			</c:otherwise>
		</c:choose>
	<div class="cls"></div>
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