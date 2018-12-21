<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0, user-scalable=0" />
<script src="/toa_duty/js/jquery.min.js"></script>
<script src="/toa_duty/js/jquery.pagination.js"></script>
<script src="../js/My97DatePicker/WdatePicker.js"></script>
<script src="/toa_duty/js/bootstrap.min.js"></script>
<script src="/toa_duty/js/selectAll.js"></script>

<link href="/toa_duty/css/bootstrap.min.css" rel="stylesheet" />
<link href="/toa_duty/css/pagination.css" rel="stylesheet" />
<link href="/toa_duty/css/bootstrap-reset.css" rel="stylesheet">
<link href="/toa_duty/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
 <link href="/toa_duty/css/style.css" rel="stylesheet"> 
<link href="/toa_duty/css/style-responsive.css" rel="stylesheet" />
<link href="/toa_duty/css/font.css" rel="stylesheet" />

<script type="text/javascript">
	$(function() {

		$('#add').click(function() {
			window.open("crm_add");
		});

		$('.M-box').pagination({
			totalData : $("#total").val(),
			showData : $("#pagesize").val(),
			current : $("#currentpage").val(),
			callback : function(api) {
				var url = "/toa_duty/manage/crm/crm_index?currentpage=" + api;
				if ($("#number").val() != "") {
					url += "&number=" + $("#number").val();
				}
				window.location.href = url;
			}
		});
		$("#delete").click(
				function() {
					var ids = "";
					$("input:checkbox[name='box']:checked").each(function() {
						ids += $(this).val() + ",";
					});
					if (ids != "") {
						if(window.confirm('你确定要删除吗？')){
			                 //LW.message.show("确定");
						window.location.href = "delete?ids="
								+ ids.substring(0, ids.length - 1); //去掉最后一个逗号
			                 
			              }else{
			                 //LW.message.show("取消");
			                  $("input[type='checkbox']").attr("checked",false); //将所有的checkbox置为未选中状态
			                 return false;
			             }
					} else {
						LW.message.show("请勾选您要删除的记录");
						 $("input[type='checkbox']").attr("checked",false); //将所有的checkbox置为未选中状态
						return false;
					}
				});

		$("#export").click(
				function() {
					var ids = "";
					$("input:checkbox[name='box']:checked").each(function() {
						ids += $(this).val() + ",";
					});
					if (ids != "") { //选中导出
						window.location.href = "export?ids="
								+ ids.substring(0, ids.length - 1); //去掉最后一个逗号
					} else if(window.confirm('要导出全部数据？')){
			                 //LW.message.show("确定");
						window.location.href = "export";
			              }else{
			                 //LW.message.show("取消");
			                  $("input[type='checkbox']").attr("checked",false); //将所有的checkbox置为未选中状态
			                 return false;
			             }
				});
	});
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

		if (form1.number.value == "" && form1.title.value == ""
				&& form1.edate.value == "" && form1.sdate.value == "") {
			LW.message.show("请输入查询条件！");
			form1.number.select();
			return false;
		}
		if ($("#edate").val() < $("#sdate").val()) {
			LW.message.show("日期不合法，请重新选择日期!");
			form1.sdate.select();
			return false;
		}
	}
</script>
<title>产品信息管理</title>

<style>
.a {
	text-align: center;
}
</style>
</head>
<body>
	<span style="width: 300px; font-size: 30px;">产品信息列表</span> 
	<div>
		<form action="crm_index" method="post" onsubmit="return isValid(this)"
			id="form1">
			<input type="hidden" name="type" value="1" id="type">
			<table class="table table-striped">
				<tr>
					<td style="line-height: 2.8rem"><label>产品编号：</label></td>
					<td><input type="text" name="number" id="number"
						value="${number}" class="form-control">
					<td style="line-height: 2.8rem"><label>起止日期：</label></td>
					<td><input type="text" name="date" id="sdate"
						class="form-control"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd '})" value="${date}"></td>
					<td style="line-height: 2.8rem"><label>至</label></td>
					<td><input type="text" name="date" id="edate"
						class="form-control"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd '})" value="${date}"></td>
					<td><input type="submit" value="查&nbsp;&nbsp;找" class="form-control"></td>
				</tr>
			</table>
		</form>
		<div style="float: left;">
			<button type="button" class="btn btn-primary"
				style="background-color: #35aa47" onclick="add" id="add">添加产品</button>
		</div>
		<div style="float: left; margin-left: 20px;">
			<button type="button" class="btn btn-primary"
				style="background-color: #d54937" id="delete">清理数据</button>
		</div>
		<div style="float: left; margin-left: 20px;">
			<button type="button" class="btn btn-primary" id="export">下载查询列表</button>
		</div>
		<br>
		<div style="clear: both; margin-top: 40px">
			<table class="table table-hover table-bordered table-striped">
				<thead>
					<tr>
						<th class="a"><input type="checkbox" id="all" name="allCK" onclick="selectAll()"/></th>
						<th class="a">产品编号</th>
						<th class="a">产品名称</th>
						<th class="a">产品分类</th>
						<th class="a">产品价格</th>
						<th class="a">计量单位</th>
						<th class="a">产品总量</th>
						<th class="a">产品剩余量</th>
						<th class="a">发布人</th>
						<th class="a">发布时间</th>
						<th class="a">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${crmList.size() >0}">
							<c:forEach items="${crmList}" var="crm">
								<input type="hidden" value="${crm.id}">
								<tr>
									<td style="line-height: 2.7" class="a"><input type="checkbox" name="box"  onclick="selectOne()"
										value="${crm.id}"></td>
									<td style="line-height: 2.7" class="a"><a href="crm_history?id=${crm.id}">${crm.number}</a></td>
									<td style="line-height: 2.7" class="a">${crm.title}</td>
									<td style="line-height: 2.7" class="a">${crm.type}</td>
									<td style="line-height: 2.7" class="a">${crm.price}</td>
									<td style="line-height: 2.7" class="a">元</td>
									<td style="line-height: 2.7" class="a">${crm.crmStock.stocknum}&nbsp;件</td>
									<td style="line-height: 2.7" class="a">${crm.crmBuyInfo.leavstock}&nbsp;件</td>
									<td style="line-height: 2.7" class="a">${crm.uid}</td>
									<td style="line-height: 2.7" class="a"><fmt:formatDate value="${crm.date}"
										pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td style="line-height: 2.7" class="a">
									<a class="btn btn-default" href="crm_buy?id=${crm.id}">产品出货</a>&nbsp;&nbsp;&nbsp;
									<a class="btn btn-default" href="crm_update?id=${crm.id}">编辑</a>&nbsp;&nbsp;&nbsp;
									<a class="btn btn-default" href="crm_stock?id=${crm.id}">查看库存</a>
									</td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</tbody>
			</table>
			<c:if test="${crmList.size()>0||crmList.size()!=null}">
			<div>
				<input type="hidden" id="currentpage" name="currentpage"
					value="${currentpage}" /> <input type="hidden" id="total"
					name="total" value="${total}" /> <input type="hidden"
					id="pagesize" name="pagesize" value="${pagesize}" />
				<div class="m-style M-box"></div>
			</div>
			</c:if>
		</div>
	</div>
	<c:if test="${crmList.size()<=0||crmList.size()==null}">
		<div style="text-align: center;">
			<p>没有找到数据记录</p>
		</div>
	</c:if>
</body>
</html>