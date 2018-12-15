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
<title>${appName}_库存列表信息管理</title>

<style type="text/css">
	table thead tr th, table tbody tr td {
		text-align: center;
	}
      .search
      {
          left: 0;
          position: relative;
      }
      #auto_div
      {
     width:calc(100% - 30px) !important;
     margin-left:15px !important;
    display: none;
    border: 1px #74c0f9 solid;
    background: #FFF;
    position: absolute;
    top: 55px;
    left: 0;
    color: #323232;
    border-radius: 10px;
    box-shadow: 5px 5px 5px #888888;
    height: 200px;
    overflow: auto;
    z-index: 1;
      }
      .sup-xx{
      	color: #c9d0c6;
	    position: absolute;
	    top: 27px;
	    right: 24px;
	    font-size: 24px;
	    cursor:pointer;
      }
      .sup-xx:hover {
			color: #a3a9a0;
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
					
					$.ajax({
						url : "manage/crm/delete?ids="
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
					window.location.href = "manage/crmstock/export?ids="
					+ ids.substring(0, ids.length - 1); //去掉最后一个逗号
					$("input[type='checkbox']").attr("checked", false); //将所有的checkbox置为未选中状态
				}
			});
			
		} else if (window.confirm('要导出全部数据吗？')) {
			//LW.message.show("确定");
			window.location.href = "manage/crmstock/export";
		} else {
			//LW.message.show("取消");
			$("input[type='checkbox']").attr("checked", false); //将所有的checkbox置为未选中状态
			return false;
		}
	});
});
</script>
<script type="text/javascript">
	function isValid() {
		/* if (form1.number.value == "" && form1.title.value == ""
				&& form1.snumber.value == "" && form1.supplier.value == "") {
			LW.message.show("请输入查询条件！");
			form1.number.select();
			return false;
		} */
	}
	$(function(){
		$("#keyword1").click(function(){
			$("#keyword").val("");
		});
		$("#keyword2").click(function(){
			$("#titleitem").val("");
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
			<li><a href="javascript:void(0);">库存列表</a></li>
		</ul>
	</div>
	<div class="rightContainer">
		
		<form action="manage/crmstock/crmstock_list" method="post" onsubmit="return isValid(this)"
			id="form1" name="indexForm">
			<div style="margin:20px 0px;">
				<div class="col-md-5">
					<label style="">商品编号、商品名称、供应商编号：</label>
					<input type="text" name="keyword" id="keyword" autocomplete="off" placeholder="输入商品编号、商品名称、供应商编号" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5a-zA-Z0-9\w]/g,'')"
					value="${keyword}" class="form-control">
					<i class="fa fa-times-circle sup-xx" id="keyword1" aria-hidden="true"></i>
				</div>
				<div class="col-md-5" style="position: relative;">
					<label for="titleitem">供应商名称：</label>
					<input type="text" name="supplier" id="titleitem" autocomplete="off" placeholder="输入供应商名称" maxlength="20" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5a-zA-Z0-9\w]/g,'')"
						class="form-control" value="${supplier}">
						<i class="fa fa-times-circle sup-xx" id="keyword2" aria-hidden="true"></i>
					<div id="auto_div" class=""></div>
				</div>
				<div class="col-md-2">
					<label style="margin-bottom: 5px">&nbsp;</label>
					<input type="submit" value="查&nbsp;询" class="form-control btn-primary">
				</div>
				<div style="clear: both"></div>
			</div>
		</form>
	
	
		<button class="btn btn-primary"
			onclick="javascript:window.location.reload()">
			<span class="glyphicon glyphicon-refresh"></span> 刷新
		</button>
		<button class="btn btn-primary"
			onclick="LW.location.forward('<%=basePath%>manage/crm/crm_add')">
			<span class="glyphicon glyphicon-plus"></span> 新增
		</button>
		<button class="btn btn-primary"
			onclick="LW.location.forward('<%=basePath%>manage/crmstock/crm_fruit')">
			<span class="glyphicon glyphicon-plus"></span> 导入Excel数据
		</button>
		<button type="button" class="btn btn-primary" id="export">
			<span class="glyphicon glyphicon-download-alt"></span> 导出Excel列表
		</button>
		<button class="btn btn-primary" id="delete">
			<span class="glyphicon glyphicon-trash"></span> 清理数据
		</button>
		<div class="cls"></div>
		<table fit="true" fitColumns="true"
			class="table table-striped table-hover table-bordered">
			<thead>
				<tr>
					<th><input type="checkbox" id="all" name="allCK"
						onclick="selectAll()" /></th>
					<th>商品编号</th>
					<th>商品名称</th>
					<th>商品分类</th>
					<th>商品价格</th>
					<th>计量单位</th>
					<th>商品总量</th>
					<th>供应商商品编号</th>
					<th>供应商名称</th>
					<th>发布人</th>
					<th>发布时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${pager.datas}" var="crm">
					<input type="hidden" name="crm_id" value="${crm.id}">
					<tr id="id${crm.id}">
						<td><input type="checkbox" name="box" onclick="selectOne()"
							value="${crm.id}"></td>
						<td><a href="manage/crm/crm_history/${crm.id}.html"
							title="查看历史出货详情">${crm.number}</a></td>
						<td>${crm.title}</td>
						<td>${crm.type}</td>
						<td>${crm.price}</td>
						<td>${crm.unit}</td>
						<td>${crm.stocknum}</td>
						<td>${crm.snumber}</td>
						<td>${crm.crmSupplier.supplier}</td>
						<td>${crm.uid}</td>
						<td><fmt:formatDate value="${crm.date}"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td><a href="manage/crm/crm_buy/${crm.id}">商品出货</a> <a
							href="manage/crm/crm_update/${crm.id}">编辑</a> <a
							href="manage/crm/crm_stock/${crm.id}">查看库存</a></td>
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
			<span>当前${pager.pageNo}/${pager.totalPage}
				共${pager.totalCount}条数据</span>
			<div class="btn-group pull-right" role="group">
				<a href="<%=basePath%>manage/crm/crm_list.html"
					class="btn btn-default">首页</a> <a
					href="<%=basePath%>manage/crm/crm_list.html?pageNo=${pager.prePage}"
					class="btn btn-default">上一页</a> <a
					href="<%=basePath%>manage/crm/crm_list.html?pageNo=${pager.nextPage}"
					class="btn btn-default">下一页</a> <a
					href="<%=basePath%>manage/crm/crm_list.html?pageNo=${pager.totalPage}"
					class="btn btn-default">尾页</a>
			</div>
		</nav>
	</div>
	<div class="cls"></div>
	
	
	
<script type="text/javascript">
			var title_list = [];

			//只请求一次
			var key = false;
			$("#titleitem").click(function() {
				var width = $(".search").width() - 7;
				$("#auto_div").css("width", width + "px");
			});
			if (!key) {
				$.ajax({
					url:"manage/crmstock/getListBySupplier",
					type: "post",
					error: function() {
						LW.message.show("查询失败，请重新输入");
						$("#titleitem").val("");
						$("#titleitem").select();
					},
					success: function(data) {
						if (data.code != 404) {
							for (var i = 0; i < data.msg.length; i++) {
								title_list.push(data.msg[i].supplier);
							}
							/* console.log(title_list);
							console.log(price_list);
							console.log(type_list); */
						} else {
							title_list.push("没有找到数据记录");
						}
					}
				});
			}
			key = true;
			var old_value = "";
			var highlightindex = -1; //高亮
			//自动完成
			function AutoComplete(auto, search, mytitle_list) {
				if ($("#" + search).val() != old_value || old_value == "") {
					var autoNode = $("#" + auto); //缓存对象（弹出框）

					var titlelist = new Array();
					var n = 0;
					old_value = $("#" + search).val();
					for (i in mytitle_list) {
						if (mytitle_list[i].indexOf(old_value) >= 0) {
							titlelist[n++] = mytitle_list[i];
						}
					}
					if (titlelist.length == 0) {

						//autoNode.hide();
						autoNode.empty();
						var result = "";
						result += "<p style='text-align: center;font-size: 13px; margin-top: 15px;' >";
						result += "没有找到数据记录";
						result += "</p>";
						$("#auto_div").html(result);
						return;
					}
					autoNode.empty(); //清空上次的记录
					for (i in titlelist) {
						var wordNode = titlelist[i]; //弹出框里的每一条内容
						var newDivNode = $("<div>").attr("id", i); //设置每个节点的id值
						newDivNode.attr("style", "font:14px/25px arial;height:30px;padding:0 8px;cursor: pointer;");
						newDivNode.html(wordNode).appendTo(autoNode); //追加到弹出框
						//鼠标移入高亮，移开不高亮
						newDivNode.mouseover(function() {
							if (highlightindex != -1) { //原来高亮的节点要取消高亮（是-1就不需要了）
								autoNode.children("div").eq(highlightindex).css("background-color", "white");
							}
							//记录新的高亮节点索引
							highlightindex = $(this).attr("id");
							$(this).css("background-color", "#ebebeb");
						});
						newDivNode.mouseout(function() {
							$(this).css("background-color", "white");
						});
						//鼠标点击文字上屏
						newDivNode.click(function() {
							//取出高亮节点的文本内容
							var titleText = autoNode.hide().children("div").eq(highlightindex).text();
							highlightindex = -1;
							//文本框中的内容变成高亮节点的内容
							$("#" + search).val(titleText);
						})
						if (titlelist.length > 0) { //如果返回值有内容就显示出来
							autoNode.show();
						} else { //服务器端无内容返回 那么隐藏弹出框
							autoNode.show();
							var result = "";
							result += "<p style='text-align: center;font-size: 13px; margin-top: 15px;' >";
							result += "没有找到数据记录";
							result += "</p>";
							$("#auto_div").html(result);
							//弹出框隐藏的同时，高亮节点索引值也变成-1
							highlightindex = -1;
						}
					}
				}
				//点击页面隐藏自动补全提示框
				document.onclick = function(e) {
					var e = e ? e : window.event;
					var tar = e.srcElement || e.target;
					if (tar.id != search) {
						if ($("#" + auto).is(":visible")) {
							$("#" + auto).css("display", "none")
						}
					}
				}
			}
			$(function() {
				old_value = $("#titleitem").val();
				$("#titleitem").focus(function() {
					if ($("#titleitem").val() == "") {
						AutoComplete("auto_div", "titleitem", title_list);

					}
				});
				$("#titleitem").keyup(function() {
					AutoComplete("auto_div", "titleitem", title_list);
				});
			});
		</script>	
	
	<script type="text/javascript">
			$("#page_crm_list").parent().attr("class","active");
			$("#page_crm_list").parent().parent().parent().parent().addClass("in");
		</script>
	<%@ include file="../foot.jsp"%>
</body>
</html>