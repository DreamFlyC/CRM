<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>${appName}_采购信息管理</title>

<style type="text/css">
table thead tr th, table tbody tr td {
	text-align: center;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#delete").click(function() {
			var ids = "";
			$("input:checkbox[name='box']:checked").each(function() {
				ids += $(this).val() + ",";
			});
			if (ids != "") {
				if (window.confirm('你确定要删除吗？')) {
					//fuzhi daozheg did
					$.ajax({
						url : "manage/crm/crm_delete?ids="
							+ ids.substring(0, ids.length - 1),
						type : "get",
						success : function(e) {
							if (e == "success") {
									//移除被删除的列表
								/* for (var did = 0; did < ids.split(',').length; did++) {
									if (ids.split(',')[did] != "") {
										$("#id" + ids.split(',')[did]).remove();
									}
								} */
								window.location.reload(true);
								LW.message.show("删除成功！");
							} else if (e == "error") {
								LW.message.show("删除失败！");
							} else {
								LW.message.show("未知错误！");
							}
						},
						error : function(e) {
							LW.message.show("删除失败!");
						}
					});
				} else {
					$("input[type='checkbox']").attr("checked", false); //将所有的checkbox置为未选中状态
					return false;
				}
			} else {
				LW.message.show("请勾选您要删除的记录");
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
			<li><a href="javascript:void(0);">采购信息列表</a></li>
		</ul>
	</div>
	<div class="rightContainer">

		<button class="btn btn-primary"
			onclick="javascript:window.location.reload()">
			<span class="glyphicon glyphicon-refresh"></span> 刷新
		</button>
		<button class="btn btn-primary"
			onclick="LW.location.forward('<%=basePath%>manage/crmpurchacse/post.html')">
			<span class="glyphicon glyphicon-plus"></span> 新增
		</button>
		<button class="btn btn-primary"
				onclick="LW.location.forward('<%=basePath%>manage/crmpurchacse/add.html')">
			<span class="glyphicon glyphicon-plus"></span> 新增明细
		</button>
		<button class="btn btn-primary" id="delete">
			<span class="glyphicon glyphicon-trash"></span> 清理数据
		</button>
		<div class="cls"></div>
		<table fit="true" fitColumns="true"
			class="table table-striped table-hover table-bordered">
			<thead>
				<tr>
					<th class="a"><input type="checkbox" id="all" name="allCK"
						onclick="selectAll()" /></th>
					<th class="a">ID</th>
					<th class="a">采购编号</th>
					<th class="a">标题</th>
					<th class="a">申请人ID</th>
					<th class="a">申请日期</th>
					<th class="a">价格</th>
					<th class="a">地址</th>
					<th class="a">备注</th>
					<th class="a">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${pager.datas.size() >0}">
						<c:forEach items="${pager.datas}" var="crmPurchacse">
							<input type="hidden" value="${crmPurchacse.id}">
							<tr id="id${crmPurchacse.id}">
								<td ><input type="checkbox" name="box"
									onclick="selectOne()" value="${crmPurchacse.id}"></td>
								<td >${crmPurchacse.id}</td>
								<td >${crmPurchacse.number}</td>
								<td >${crmPurchacse.title==''||crmPurchacse.title==null?"无":crmPurchacse.title}</td>
								<td >${crmPurchacse.uid}</td>
								<td ><fmt:formatDate value="${crmPurchacse.date}"
										pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td >${crmPurchacse.price}元</td>
								<td >${crmPurchacse.address}</td>
								<td >${crmPurchacse.note}</td>
								<td >
									<a href="manage/crmpurchacse/${crmPurchacse.id}.html">修改订单</a>
									<a href="manage/crmpurchacse/showitem.html?number=${crmPurchacse.number}">查看明细</a>
								</td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>
			</tbody>
		</table>
		<c:if test="${pager.datas.size()<=0||pager.datas.size()==null}">
			<div style="text-align: center;">
				<p>没有找到数据记录</p>
			</div>
		</c:if>		
		<nav>
			<span>当前${pager.pageNo}/${pager.totalPage}
				共${pager.totalCount}条数据</span>
			<div class="btn-group pull-right" role="group">
				<a href="<%=basePath%>manage/crmpurchacse/crmpurchacse_list" class="btn btn-default">首页</a>
				<a href="<%=basePath%>manage/crmpurchacse/crmpurchacse_list?pageNo=${pager.prePage}"
					class="btn btn-default">上一页</a> <a
					href="<%=basePath%>manage/crmpurchacse/crmpurchacse_list?pageNo=${pager.nextPage}"
					class="btn btn-default">下一页</a> <a
					href="<%=basePath%>manage/crmpurchacse/crmpurchacse_list?pageNo=${pager.totalPage}"
					class="btn btn-default">尾页</a>
			</div>
		</nav>
	</div>
	<div class="cls"></div>
	<!--左侧导航栏智能显示  -->
		<script type="text/javascript">
			$("#page_crmpurchacse_list").parent().attr("class","active");
            sessionStorage.clear();
		</script>
	<%@ include file="../foot.jsp"%>
</body>
</html>