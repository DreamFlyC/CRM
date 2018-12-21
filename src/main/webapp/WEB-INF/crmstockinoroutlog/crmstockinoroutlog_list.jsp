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
		<script src="<%=basePath%>resources/duty/js/selectAll.js"></script>
		<title>${appName}_进出货记录管理</title>
		<style type="text/css">
			table thead tr th,table tbody tr td{
				text-align: center;
			}
		</style>

		<script type="text/javascript">
            $(function() {
                $("#export").click(function() {
                    var ids = "";
                    $("input:checkbox[name='box']:checked").each(function() {
                        ids += $(this).val() + ",";
                    });
                    if (ids != "") { //选中导出
                        //window.confirm("确定要导出吗？");
                        LW.message.confirm("id","确定要导出吗？",function(r){
                            if(r){
                                window.location.href = "manage/crmstockinoroutlog/export?ids="
                                    + ids.substring(0, ids.length - 1); //去掉最后一个逗号
                                $("input[type='checkbox']").attr("checked", false); //将所有的checkbox置为未选中状态
                            }
                        });

                    } else if (window.confirm('要导出全部数据吗？')) {
                        //LW.message.show("确定");
                        window.location.href = "manage/crmstockinoroutlog/export";
                    } else {
                        //LW.message.show("取消");
                        $("input[type='checkbox']").attr("checked", false); //将所有的checkbox置为未选中状态
                        return false;
                    }
                });
            });
		</script>
	</head>
	<body>
		<%@ include file="../top.jsp"%>
   		<%@ include file="../left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li><a href="<%=basePath%>manage/index.html">首页</a></li>
	    		<li><a href="<%=basePath%>manage/crmstockinoroutlog/crmstockinoroutlog_list.html">进出货记录列表</a></li>
    		</ul>
    	</div>
		<div class="rightContainer">
			<button class="btn btn-primary" onclick="javascript:window.location.reload()">
				<span class="glyphicon glyphicon-refresh"></span> 刷新
			</button>
			<button class="btn btn-primary" onclick="LW.location.forward('<%=basePath%>manage/crmstockinoroutlog/post.html')">
				<span class="glyphicon glyphicon-plus"></span> 新增
			</button>
			<button class="btn btn-primary" onclick="LW.location.forward('<%=basePath%>manage/crmstockinoroutlogitem/add.html')">
				<span class="glyphicon glyphicon-plus"></span> 新增明细
			</button>
			<button type="button" class="btn btn-primary" id="statistics"
					onclick="LW.location.forward('<%=basePath%>manage/crmstockinoroutlog/crmstockinoroutlog_statistics')">
				<span class="glyphicon glyphicon-glass"></span> 统计数据
			</button>
			<button type="button" class="btn btn-primary" id="export">
				<span class="glyphicon glyphicon-download-alt"></span> 导出Excel列表
			</button>
			<div class="cls"></div>
			<table fit="true" fitColumns="true" class="table table-striped table-hover table-bordered">
				<thead>
					<tr>
						<th><input type="checkbox" id="all" name="allCK"
							onclick="selectAll()" /></th>
						<th>单号</th>
						<th>标题</th>
						<th>总金额</th>
						<th>类型</th>
						<th>日期</th>
						<th>录入人</th>
						<th>takeuid</th>
						<th>备注</th>
						<th>地址</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pager.datas}" var="item" varStatus="status">
						 
							<tr>
								<td class="a" ><input type="checkbox" name="box"
									onclick="selectOne()" value="${item.id}" /></td>
								<td>${item.number}</td>
								<td>${item.title}</td>
								<td>${item.price}</td>
								<td>${item.crmStockType.name}</td>
								
								<td><fmt:formatDate value="${item.date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td><lw:SysUserTag  style=""   htmltype="1"  value="${item.uid}" /></td>
								<td><lw:SysUserTag  style=""   htmltype="1"  value="${item.takeuid}" /></td>
								<td>${item.note}</td>
								<td>${item.address}</td>
								<td>
								   <a href="<%=basePath%>manage/crmstockinoroutlog/display/${item.id}.html">查看</a>
								   <a href="<%=basePath%>manage/crmstockinoroutlog/view/${item.id}.html">打印</a>
					               <a href="<%=basePath%>manage/crmstockinoroutlog/${item.id}.html">编辑</a> 
					   			   <a href="javascript:void(0)" onclick="LW.crmstockinoroutlog.del(${item.id})">删除</a></td>
							</tr>
						 
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${pager.datas.size()<=0||pager.datas.size()==null}">
			<div style="text-align: center;">
				<p>没有找到数据记录</p>
			</div>
			</c:if>
			<nav>
				<span>当前${pager.pageNo}/${pager.totalPage} 共${pager.totalCount}条数据</span>
				<div class="btn-group pull-right" role="group">
			      	<a href="<%=basePath%>manage/crmstockinoroutlog/crmstockinoroutlog_list.html" class="btn btn-default">首页</a>
			      	<a href="<%=basePath%>manage/crmstockinoroutlog/crmstockinoroutlog_list.html?pageNo=${pager.prePage}" class="btn btn-default">上一页</a>
			      	<a href="<%=basePath%>manage/crmstockinoroutlog/crmstockinoroutlog_list.html?pageNo=${pager.nextPage}" class="btn btn-default">下一页</a>
			      	<a href="<%=basePath%>manage/crmstockinoroutlog/crmstockinoroutlog_list.html?pageNo=${pager.totalPage}" class="btn btn-default">尾页</a>
			    </div>
			</nav>
    	</div>
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