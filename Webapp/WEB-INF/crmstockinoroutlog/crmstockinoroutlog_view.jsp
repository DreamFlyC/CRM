<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@ page import="java.text.*"%>
<%@ page import="java.lang.String"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
		<%@ include file="../tag.jsp" %>
		<title>${appName}_出货记录列表管理</title>
		<style type="text/css">
			table thead tr th,table tbody tr td{
				text-align: center;
			}
			
			.log{
				margin: 0px auto; width:90%;
				border: 1px solid #ddd;
			}
			
			.centerlog{
				margin: 0px auto; width:80%;
			}
			
			.text-center p{
				font-size: 16px;
				font-weight: bold;
			}
			
			.print{
			    position: relative;
			    left: 91%;
			    top: 30px;
			}
		</style>
		
		<script language="javascript">
			function preview(oper){
			    if (oper < 10){
			    bdhtml=window.document.body.innerHTML;//获取当前页的html代码
			    sprnstr="<!--startprint"+oper+"-->";//设置打印开始区域
			    eprnstr="<!--endprint"+oper+"-->";//设置打印结束区域
			    prnhtml=bdhtml.substring(bdhtml.indexOf(sprnstr)+18); //从开始代码向后取html
			    prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr));//从结束代码向前取html
			    window.document.body.innerHTML=prnhtml;
			    window.print();
			    window.document.body.innerHTML=bdhtml;
			    } 
			    else {
			        window.print();
			    }
			}
		</script>
	</head>
	<body>
		<%@ include file="../top.jsp"%>
   		<%@ include file="../left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li><a href="<%=basePath%>manage/index.html">首页</a></li>
	    		<li><a href="<%=basePath%>manage/crmstockinoroutlog/crmstockinoroutlog_list.html">出货记录列表</a></li>
    		</ul>
    	</div>
		<div class="rightContainer">
			
			<div class="cls"></div>
			<input type="button" class="print" name="button_export" value="打&nbsp;印"  onclick="preview(1)" />
			<!--startprint1-->
			<div class="log">
				<div class="centerlog">
					<div class="text-center">
						<p>深圳市一米云站科技有限公司</p>
						<p style="">${log.title}</p>
					</div>
					<div>
						<p>日期：<fmt:formatDate value="${log.date}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
						<p>领取人：<lw:SysUserTag  style=""   htmltype="1"  value="${log.takeuid}" /></p>
						<span>地址：${log.address}</span><span style="float: right" class="text-right">单号：${log.number}</span>
					</div>
					<table fit="true" fitColumns="true" class="table  table-bordered" style="margin-top: 10px;">
						<thead>
							<tr>
								<th>序号</th>
								<th>名称</th>
								<th>单价</th>
								<th>数量</th>
								<th>类别</th>
								<th>日期</th>
								<th>备注</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${logitemlist}" var="logitem" varStatus="status">
							<tr>
								<td>${status.index+1}</td>
								<td>${logitem.title}</td>
								<td>${logitem.price}</td>
								<td>${logitem.num}</td>
								<td>${logitem.crmName.name}</td>
								<td><fmt:formatDate value="${logitem.date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td>${logitem.note}</td>
							</tr>
						</c:forEach>
							<tr>
								<td colspan="4">合计</td>
								<td colspan="4">${log.price}</td>
							</tr>
						</tbody>
					</table>
					<div style="height:20px;" >
						<p style="float:right;margin-top: -8px;">制单人：<lw:SysUserTag  style=""   htmltype="1"  value="${log.uid}" /></p>
					</div>
				</div>
			</div>
    	</div>
    	<!--endprint1-->
    	<div class="cls"></div>
    	<script type="text/javascript">
			$("#page_crmstockinoroutlog_list").parent().attr("class","active");
			
			LW.crmstockinoroutlog=new Object();
			LW.crmstockinoroutlog.del=function(id)
			{
				LW.message.confirm("id","您确认要继续删除吗?",function(r){if(r){LW.location.forward("manage/crmstockinoroutlog/del/"+id+".html");}});
			}
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>