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
<title>${appName}_工单列表信息管理</title>

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
						url : "duty/delete?ids="
							+ ids.substring(0, ids.length - 1),
						type : "get",
						success : function(e) {
							if (e == "success") {
									//移除被删除的列表
								 for (var did = 0; did < ids.split(',').length; did++) {
									if (ids.split(',')[did] != "") {
										console.log(ids.split(',')[did]);
										$("#id" + ids.split(',')[did]).remove();
									}
								} 
								LW.message.show("删除成功！");
							} else if (e == "error") {
								LW.message.show("删除失败！");
							} else {
								LW.message.show("未知错误！");
							}
						},
						error:function(e){
							LW.message.show("删除失败！");
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
			<li><a href="javascript:void(0);">工单列表</a></li>
		</ul>
	</div>
	
	<div class="rightContainer">
	<ul class="nav nav-tabs">
		<li class="active" style="margin-left: 10px;"><a href="duty/duty_list.html"> 所有工单 </a></li>
		<li><a href="duty/duty_list.html?dkey=3"> 未接受工单 </a></li>
		<li><a href="duty/duty_list.html?dkey=2"> 进行中工单 </a></li>
		<li><a href="duty/duty_list.html?dkey=1"> 已完成工单 </a></li>
	</ul>
		<form action="duty/duty_list" method="post" onsubmit="return isValid(this)"
			id="form1" name="indexForm">
			<input type="hidden" name="dkey" value="${dkey}" id="dkey"> <input
				type="hidden" name="type" value="1" id="type">
			<table class="table table-striped" >
				<tr>
					<td style="line-height: 2.8rem ;"><label>工单编号：</label></td>
					<td><input type="text" name="number" id="number" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5a-zA-Z0-9\w]/g,'')"
						value="${number}" class="form-control">
					<td style="line-height: 2.8rem"><label>工单名称：</label></td>
					<td><input type="text" name="title" id="title" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5a-zA-Z0-9\w]/g,'')"
						class="form-control" value="${title}"></td>
					<td style="line-height: 2.8rem"><label>工单周期：</label></td>
					<td><input type="text" name="sdate" id="sdate"
						class="form-control"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd '})" value="${sdate}"></td>
					<td style="line-height: 2.8rem"><label>至</label></td>
					<td><input type="text" name="edate" id="edate"
						class="form-control"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd '})" value="${edate}"></td>
					<td><input type="submit" value="查&nbsp;询" class="form-control btn-primary"></td>
				</tr>
			</table>
		</form>
				<%-- <c:forEach items="${pager.datas}" var="duty">
					<p>${duty.dutyUser}</p>
					<c:forEach items="${duty.dutyUser}" var="user">
					<p>${user.dutyLog.progress}</p>
					</c:forEach>
				</c:forEach>  --%>
		<button class="btn btn-primary"
			onclick="javascript:window.location.reload()">
			<span class="glyphicon glyphicon-refresh"></span> 刷新
		</button>
		<button class="btn btn-primary"
			onclick="LW.location.forward('<%=basePath%>duty/duty_add.html')">
			<span class="glyphicon glyphicon-plus"></span> 新增
		</button>
		<button class="btn btn-primary" id="delete">
			<span class="glyphicon glyphicon-trash"></span> 清理数据
		</button>
		<button type="button" class="btn btn-primary" id="export">
			<span class="glyphicon glyphicon-download-alt"></span> 导出查询列表
		</button>
		<div class="cls"></div>
		<table fit="true" fitColumns="true" 
			class="table table-striped table-hover table-bordered">
			<thead>
				<tr>
					<th style="width: 2%"><input type="checkbox" id="all" name="allCK"
						onclick="selectAll()" /></th>
					<th class="a" style="width: 10%">工单编号</th>
					<th class="a" style="width: 15%">工单名称</th>
					<th class="a" style="width: 5%">类型</th>
					<th class="a" style="width: 6%">执行部门</th>
					<th class="a" style="width: 10%">工单执行人</th>
					<th class="a" style="width: 15%">工单周期</th>
					<th class="a" style="width: 4%">进度</th>
					<th class="a" style="width: 5%">发起人</th>
					<th class="a" style="width: 8%">发起时间</th>
					<th class="a" style="width: 6%">状态</th>
					<th class="a" style="width: 20%">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${pager.datas.size() >0}">
						<c:forEach items="${pager.datas}" var="duty" >
						<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
							<input type="hidden" value="${duty.id}" id="id">
							<tr id="id${duty.id}">
								<td class="a"  ><input type="checkbox" name="box"
									onclick="selectOne()" value="${duty.id}"></td>
								<td class="a" style="line-height: 2.5em;"><a href="duty/dutycontent/${duty.id}.html">${duty.number}</a></td>
								<td class="a" style="line-height: 2.5em;" title="${duty.title}" >
									<div style=" overflow: hidden; white-space: nowrap;text-overflow: ellipsis;width: 100px;margin-left: auto;margin-right: auto;">${duty.title}</div>
								</td>
								<td class="b" style="line-height: 2.5em;">${duty.level==1?"<span style='color:#62b900'>普通</span>":(duty.level==2?"<span style='color:red'>紧急</sapn>":"") }</td>
								<td class="a" style="line-height: 2.5em;" >
									<c:forEach items="${duty.dutyDepart}" var="depart">
										${depart.depart}<br>
									</c:forEach>
								</td>
								<td class="a"  id="user${duty.id}" style="line-height: 2.5em;"  title="${duty.user}">${duty.user}</td>
								<td class="a"><span>从</span><fmt:formatDate value="${duty.startdate}"
										pattern="yyyy-MM-dd HH:mm:ss" /><br> 
										<span>至</span><fmt:formatDate
										value="${duty.enddate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td class="a" style="line-height: 2.5em;">
									<a href="duty/logmanager.html?id=${duty.id }">
										<c:set var="sum" value="0"/>
										<c:if test="${duty.dutyUser.size()>0}">
											<c:forEach items="${duty.dutyUser}" var="user" varStatus="status">
												 <c:if test="${status.last}">
												<c:set var="count" value="${status.count}"></c:set> 
											    </c:if>
												<c:set var="sum" value="${(sum+user.dutyLog.progress)}"/>
											</c:forEach>
											<fmt:formatNumber value="${sum/count>=100?100:sum/count}" pattern="#.#" />%
										</c:if>
										<c:if test="${duty.dutyUser.size()<=0}">
											0%
										</c:if>
									</a>
								</td>
								<td class="a" style="line-height: 2.5em;" >管理员</td>
								<td class="a"  ><fmt:formatDate value="${duty.date}"
										pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td class="a dkey${duty.id}"  style="line-height: 2.5em;" name="dkey${duty.id}">${duty.dkey==1?"<span style='color:#e91ca7;'>已完成</span>":(duty.dkey==2 ? "<span style='color:#09b4f9'>进行中</span>":"<span style='color:#EE0000;'>未接受</span>")}
								</td>
								<td style="line-height: 2.5em;">
								<c:if test="${duty.dkey==3}"><!-- 工单还未接受，可以编辑   -->
									</c:if>
										<a class="" href="duty/edit_detail_duty.html?id=${duty.id}" style="color:#295f8f;" >编辑</a>
									<c:if test="${duty.user!=null&&duty.user!=''}">
										<a class=""  href="duty/usermanag.html?id=${duty.id}" style="color:#295f8f;"  >执行人管理</a>
									<a class="" href="duty/logmanager.html?id=${duty.id}"  style="color:#295f8f;" >查看进度</a>
									</c:if>
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
				<a href="<%=basePath%>duty/duty_list.html" class="btn btn-default">首页</a>
				<a href="<%=basePath%>duty/duty_list.html?dkey=${dkey}&pageNo=${pager.prePage}"
					class="btn btn-default">上一页</a> <a
					href="<%=basePath%>duty/duty_list.html?dkey=${dkey}&pageNo=${pager.nextPage}"
					class="btn btn-default">下一页</a> <a
					href="<%=basePath%>duty/duty_list.html?dkey=${dkey}&pageNo=${pager.totalPage}"
					class="btn btn-default">尾页</a>
			</div>
		</nav>
	</div>
	<div class="cls"></div>
	 	<script type="text/javascript">
			$("#page_duty_list").parent().attr("class","active");
		</script> 
	<%@ include file="../foot.jsp"%>
<!-- 	<script type="text/javascript">
		$(document).ready(function() {
			$(".btn").click(function() { //触发class="btn"的点击事件
				var id = $(this).attr("name");// 将class="btn"的name属性的值给id
				$.ajax({
					type : "post",
					url : "duty/editDkey?id=" + id,
					success : function() {
						$(".dkey" + id).html("进行中"); //将class="dkey+id"改为进行中
						$("#e" + id).show(); // 显示其余三个
						$("#b" + id).remove(); //将接受工单按钮移除
					}
				});
			});
		});
	</script>
	-->
 	<script type="text/javascript">
		$(function() {
			
			/* //将执行人换行显示
			var id=$("#id").val();
			//LW.message.show(id);
			var user=$("#user"+id).text().replace(new RegExp(',','gm'),'<br>');
			//LW.message.show(user);
			$("#user"+id).html(user); */
			
			//导航栏智能提示选中
			switch ($("#dkey").val()) {

			case "1":
				$("ul.nav-tabs li").removeClass("active"); //移除ul.nav-tabs li的active类
				$("ul.nav-tabs li").eq(3).addClass("active"); //eq()
				break;

			case "2":
				$("ul.nav-tabs li").removeClass("active");
				$("ul.nav-tabs li").eq(2).addClass("active");
				break;

			case "3":
				$("ul.nav-tabs li").removeClass("active");
				$("ul.nav-tabs li").eq(1).addClass("active");
				break;

			default:
				$("ul.nav-tabs li").removeClass("active");
				$("ul.nav-tabs li").eq(0).addClass("active");
				break;
			}
			$("#export").click(
					function() {
						var ids = "";
						$("input:checkbox[name='box']:checked").each(
								function() {
									ids += $(this).val() + ",";
								});
						if (ids != "") { //选中导出
							window.confirm("确定要导出吗？");
							window.location.href = "duty/export?ids="
									+ ids.substring(0, ids.length - 1); //去掉最后一个逗号
						} else if (window.confirm('要导出当前列表全部数据吗？')) {
							//LW.message.show("确定");
							window.location.href = "duty/export?dkey="+$("#dkey").val();
						} else {
							//LW.message.show("取消");
							$("input[type='checkbox']").attr("checked", false); //将所有的checkbox置为未选中状态
							return false;
						}
					});
		});

		function isValid() {
			if (form1.sdate.value != "" && form1.edate.value == "") {
				LW.message.show("请选择工单结束日期!");
				form1.edate.select();
				return false;
			}
			if (form1.edate.value != "" && form1.sdate.value == "") {
				LW.message.show("请选择工单开始日期!");
				form1.sdate.select();
				return false;
			}

			if (form1.number.value == "" && form1.title.value == ""
					&& form1.edate.value == "" && form1.sdate.value == "") {
				LW.message.show("请输入查询条件！");
				form1.number.select();
				return false;
			}
			if ($("#edate").val() < $("#sdate").val()) {
				LW.message.show("日期不合法，请重新选择日期!");
				document.getElementById("sdate").value = "";
				document.getElementById("edate").value = "";
				form1.sdate.select();
				return false;
			}
		}
		
		
	</script>
</body>
</html>