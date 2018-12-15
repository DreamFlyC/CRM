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
<%--<link rel="stylesheet" href="<%=basePath%>resources/css/awesome-bootstrap-checkbox.css">--%>
<title>${appName}供应商商品报价表管理</title>

	<style type="text/css">
		table thead tr th, table tbody tr td {
			text-align: center;
		}
        .checkbox, .radio {
            margin-top: 0px;
            margin-bottom: 0px;
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
					window.location.href = "manage/crmsupplierprice/export?ids="
					+ ids.substring(0, ids.length - 1); //去掉最后一个逗号
					$("input[type='checkbox']").attr("checked", false); //将所有的checkbox置为未选中状态
				}else {
                    $("input[type='checkbox']").attr("checked", false); //将所有的checkbox置为未选中状态
                    return false;
                }
			});
		}
		if(ids=="" || ids ==null){
            LW.message.confirm("id","要导出全部数据吗",function(r){
                if(r) {
                    window.location.href = "manage/crmsupplierprice/export";
                }
            });
		}
	});
});
</script>
	<script type="text/javascript">
	$(function(){
		$("#keyword1").click(function(){
			$("#keyword").val("");
		});
		$("#keyword2").click(function(){
			$("#titleitem").val("");
		});
	});
</script>
	<script type="text/javascript">
        $(function() {
            $("#createOrder").click(function() {
                var ids = "";
                $("input:checkbox[name='box']:checked").each(function() {
                    ids += $(this).val() + ",";
                });
                if (ids != "") {
                    LW.message.confirm("id","确定订单无误后点击确认",function(r){
                        if(r){
                            httpPost('manage/crmpurchacse/create_order', {ids :ids.substring(0, ids.length - 1)});
                        }else {
                            $("input[type='checkbox']").attr("checked", false); //将所有的checkbox置为未选中状态
                            return false;
						}
                    });
                } else {
                    LW.message.show("请勾选您要采购的商品");
                    $("input[type='checkbox']").attr("checked", false); //将所有的checkbox置为未选中状态
                    return false;
                }
            });
        });
        function httpPost(URL, PARAMS) {
            var temp = document.createElement("form");
            temp.action = URL;
            temp.method = "post";
            temp.style.display = "none";

            for (var x in PARAMS) {
                var opt = document.createElement("textarea");
                opt.name = x;
                opt.value = PARAMS[x];
                temp.appendChild(opt);
            }

            document.body.appendChild(temp);
            temp.submit();
            return temp;
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
			<li><a href="javascript:void(0);">库存列表</a></li>
		</ul>
	</div>
	<div class="rightContainer">
		
		<button class="btn btn-primary"
			onclick="javascript:window.location.reload()">
			<span class="glyphicon glyphicon-refresh"></span> 刷新
		</button>
		<button class="btn btn-primary"
			onclick="LW.location.forward('<%=basePath%>manage/crmsupplierprice/post.html')">
			<span class="glyphicon glyphicon-plus"></span> 新增
		</button>
		<button class="btn btn-primary"
			onclick="LW.location.forward('<%=basePath%>manage/crmsupplierprice/crmsupplierprice_fruit')">
			<span class="glyphicon glyphicon-open"></span> 导入Excel数据
		</button>
		<button type="button" class="btn btn-primary" id="export">
			<span class="glyphicon glyphicon-download-alt"></span> 导出Excel列表
		</button>
		<button class="btn btn-primary" id="createOrder">
			<span class="glyphicon glyphicon-check"></span> 生成采购订单
		</button>
		<div class="cls"></div>
		<table fit="true" fitColumns="true"
			class="table table-striped table-hover table-bordered">
			<thead>
				<tr>
					<th>
                        <input type="checkbox" id="all" name="allCK"
						onclick="selectAll()" />
                       <%-- <div class="checkbox checkbox-primary">
                            <input class="styled" type="checkbox" id="all" name="allCK"
                                   onclick="selectAll()" >
                            <label for="all"></label>
                        </div>--%>
                    </th>
					<th>商品编号</th>
					<th>商品名称</th>
					<th>商品分类</th>
					<th>商品价格</th>
					<th>计量单位</th>
					<th>供应商名称</th>
					<th>发布人</th>
					<th>seq</th>
					<th>发布时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${pager.datas}" var="item">
					<tr id="id${item.id}">
						<td>
							<input type="checkbox" name="box" onclick="selectOne()"value="${item.id}">
                            <%--<div class="checkbox checkbox-primary">
                                <input class="styled" type="checkbox" id="one${item.id}" name="box" onclick="selectOne()"value="${item.id}" >
                                <label for="one${item.id}"></label>
                            </div>--%>
						</td>
						<td>${item.snumber}</td>
						<td>${item.name}</td>
						<td>${item.type}</td>
						<td>${item.price}</td>
						<td>${item.unit}</td>
						<td>${item.crmSupplier.supplier}</td>
						<td>${item.uid}</td>
                        <td>${item.seq}</td>
						<td><fmt:formatDate value="${item.date}"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td>
                            <a href="<%=basePath%>manage/crmsupplierprice/${item.id}.html">编辑</a>
                            <a href="javascript:void(0)" onclick="LW.crmsupplierprice.del(${item.id})">删除</a></td>
                        </td>
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
				<a href="<%=basePath%>manage/crmsupplierprice/crmsupplierprice_list.html"
					class="btn btn-default">首页</a> <a
					href="<%=basePath%>manage/crmsupplierprice/crmsupplierprice_list.html?pageNo=${pager.prePage}"
					class="btn btn-default">上一页</a> <a
					href="<%=basePath%>manage/crmsupplierprice/crmsupplierprice_list.html?pageNo=${pager.nextPage}"
					class="btn btn-default">下一页</a> <a
					href="<%=basePath%>manage/crmsupplierprice/crmsupplierprice_list.html?pageNo=${pager.totalPage}"
					class="btn btn-default">尾页</a>
			</div>
		</nav>
	</div>
	<div class="cls"></div>
	
	<script type="text/javascript">
			$("#page_crmsupplierprice_list").parent().attr("class","active");
			$("#page_crmsupplierprice_list").parent().parent().parent().parent().addClass("in");

            LW.crmsupplierprice=new Object();
            LW.crmsupplierprice.del=function(id)
            {
                //alert(id);
                LW.message.confirm("id","您确认要继续删除吗?",function(r){if(r){LW.location.forward("manage/crmsupplierprice/del/"+id+".html");}});
            }
		</script>
	<%@ include file="../foot.jsp"%>
</body>
</html>