<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@ page import="java.text.*"%>
<%@ page import="java.lang.String"%>   
<%
java.util.Date date = new java.util.Date();
DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
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


String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
	 	<base href="<%=basePath%>" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8;"/>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<%@ include file="../tag.jsp" %>
		<link href="<%=basePath%>resources/duty/css/dutymobile.css" rel="stylesheet" type="text/css" />
		<title>历史录入进度</title>
		
		<style type="text/css">
			table thead tr th,table tbody tr td{
				text-align: center;
			}
			 .loghistory{
			 	padding:6px 12px;
			 	height: 40px;
			 }
		</style>
	</head>
	<body>
		<div class="rightContainer">
				<c:choose>
					<c:when test="${dutyLogList.size() >0}">
						<c:forEach items="${dutyLogList}" var="dutyLog" varStatus="i">
							<input type="hidden" value="${dutyLog.id}">
							<div  style="margin-bottom:20px;background-color:#fff;border-radius:4px;">
								<div style="text-align: center;padding-top:6px;">第${i.index+1}条记录</div>
							<div class="loghistory">
								<span class="dutyname">工单ID：</span>
								<span>${dutyLog.dutyid}</span>
							</div>
							<div class="loghistory">
								<span class="dutyname">工单名称：</span>
								<span>${dutyLog.duty.title}</span>
							</div>
							<div class="loghistory">
								<span class="dutyname">工单内容：</span>
								<span>${dutyLog.content}</span>
							</div>
							<div class="loghistory">
								<span class="dutyname">历史录入：</span>
								<span>
									<c:choose>
										<c:when test="${i.last}">
										已接受
										</c:when>
										<c:otherwise>
											${(dutyLog.progress=="" ||dutyLog.progress==null)?0:dutyLog.progress}%
										</c:otherwise>
									</c:choose>
								</span>
							</div>
							<div class="loghistory">
								<span class="dutyname">附件：</span>
								<span>
									${dutyLog.appendix==null||dutyLog.appendix==''?"无":""}
									<a href="${picServer}${dutyLog.appendix}" id="page_user">${dutyLog.appendix}</a>
								</span>
							</div>
							<div class="loghistory">
								<span class="dutyname">备注：</span>
								<span>${dutyLog.note==null||dutyLog.note==''?"无":dutyLog.note}</span>
							</div>
							<div class="loghistory">
								<span class="dutyname">录入时间：</span>
								<span><fmt:formatDate value="${dutyLog.date}"
										pattern="yyyy-MM-dd HH:mm:ss" /></span>
							</div>
						</div>
						</c:forEach>
					</c:when>
				</c:choose>
				<div>
					<p style="text-align: center;color: #aaa;">没有更多了</p>
				</div>
			<c:if test="${dutyLogList.size()<=0}">
				<div style="text-align: center;">
				<p>没有找到数据记录</p>
				</div>
			</c:if>
    	
		</div>
    	<div class="cls"></div>
	</body>
</html>