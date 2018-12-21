<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.lang.String"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.lw.crm.crmname.entity.CrmName"%>
<%@ page import="com.lw.crm.crmstocktype.entity.CrmStockType"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.UUID"%>
<%
	ArrayList<CrmName> crmNameList = (ArrayList) request.getAttribute("crmNameList");

	ArrayList<CrmStockType> crmStockTypeList = (ArrayList) request.getAttribute("crmStockTypeList");
%>
<%
	java.util.Date date = new java.util.Date();
	DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
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
		pageContext.setAttribute("id", request.getParameter("id").trim());
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
<link href="<%=basePath%>resources/plugin/bootstrap3.3.2/css/bootstrap.min.css" rel="stylesheet" />
<link href="<%=basePath%>resources/css/system.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>resources/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>resources/fonts/fontawesome-webfont.woff2" />
<script src="<%=basePath%>resources/js/jquery.min.js"type="text/javascript"></script>
<script src="<%=basePath%>resources/js/jquery-ui.min.js"type="text/javascript"></script>
<script src="<%=basePath%>resources/plugin/bootstrap3.3.2/js/bootstrap.min.js"></script>
<script src="<%=basePath%>resources/valid/Validform_v5.3.2_min.js"></script>
<script src="<%=basePath%>resources/plugin/kindeditor/kindeditor-min.js"></script>
<script src="<%=basePath%>resources/js/weixin.js"></script>
<script src="<%=basePath%>resources/duty/js/selectAll.js"></script>
<script src="<%=basePath%>resources/duty/js/My97DatePicker/WdatePicker.js"></script><link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
<title>${appName}_进出货记录明细</title>
<style>
.modal {margin-top: 100px;}
.nav {width: auto;height: 380px;overflow: auto;}
ul {list-style: none;padding: 0px;}
.center {width: 200px;height: auto;margin: 0px auto;}
.nav-takeuid  ul {list-style: none;padding:0px;}
.nav-takeuid  ul li .btn { margin: 10px;height: 35px;}
.nav-takeuid ul li p{ text-align:center;font-family:Microsoft YaHei;font-size:16px;}
table thead tr th,table tbody tr td{text-align: center;}
.returnuser{display: none;}
.modal-open{overflow-y: scroll;}
.stockitem{display: none;width:100%;}
.stockresult:hover{background-color:#d9edf7;}
.stockresult-ed{background-color:#d9edf7;}
.modal{position: fixed;top: -10%;}
</style>
<script>
			function IsNum(number) {
				//var reNum = /(^\+?|^\d?)\d*\.\d+$/; //正浮点数
				var reNum=/^[0-9]+(.[0-9]{2})?$/;
				return (reNum.test(number));
			}
		function isValid() {
			/*if (!IsNum(form1.price.value))
			{
				LW.message.show("单价需为数字!")
				return false;
			}
			if (!IsNum(form1.price.value))
			{
				LW.message.show("单价需为数字!")
				return false;
			}*/
			if (form1.type.value==0 ||form1.type.value=="" )
			{
				LW.message.show("请选择类型");
				return false;
			}
			if ($("#choose1").text()=="请选择人员" || $("#choose1").text()=="")
			{
				LW.message.show("请选择人员");
				return false;
			}
			else
			{
				$("#form1").submit();
			}
		}
	    </script>

</head>
<body >
	<%@ include file="../top.jsp"%>
	<%@ include file="../left.jsp"%>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="<%=basePath%>manage/index.html">首页</a></li>
			<li><a
				href="<%=basePath%>manage/crmstockinoroutlogitem/crmstockinoroutlogitem_list.html">进出货记录明细列表</a></li>
			<li>添加明细</li>
		</ul>
	</div>

	<div class="rightContainer">
		<form class="form-horizontal" role="form" method="post"
			action="<%=basePath%>manage/crmstockinoroutlogitem/add.html" id="form1"
			name="form1">
			<div class="list-group-item active glyphicon glyphicon-chevron-up" 
				data-toggle="collapse" data-parent="#accordion" href="#panelInfo">新增进出货记录明细</div>
			<div id="panelInfo" class="panel-collapse collapse in">
				<div class="panel-body">
					<table class="table table-bordered">
						<tr>
							<td class="info col-md-1 text-right"><span class="red">*</span>单号:</td>
							<td class="col-md-11"><label class="form-control  text-left" id="label">${number}</label></td>
							<input type="hidden" name="number" id="number"
								value="${number}">
						</tr>
						<tr>
							<td class="info col-md-1 text-right"><span class="red">*</span>标题:</td>
							<td class="col-md-11"><input type="text"
								class="form-control" name="title" id="title" value=""
								maxlength="50" placeholder="请输入标题" autocomplete="off" nullmsg="请输入标题"
								datatype="*1-50" errormsg="至少1个字符,最多50个字符！"></td>
						</tr>
						<tr>
							<td class="info col-md-1 text-right"><span class="red">*</span>总金额:</td>
							<td class="col-md-11">
							
							<input type="number" step="0.01"
								class="form-control" name="price" id="price" value="0"
								maxlength="50" placeholder="0" autocomplete="off" nullmsg="总金额不能为空"
								datatype="*1-50" errormsg="至少1个字符,最多50个字符！"></td>
						</tr>
						<tr>
							<td class="info col-md-1 text-right"><span class="red">*</span>类型:</td>
							<td class="col-md-11"><select name="type" id="selcrmStockTypeList"
								class="form-control {required:true}">
									<option value="" selected="selected">请选择类型</option>
									<!--动态从数据库查数据并组合成option  -->
									<%
										for (int i = 0; i < crmStockTypeList.size(); i++) {
									%>
									<option value="<%=crmStockTypeList.get(i).getId()%>">
										<%=crmStockTypeList.get(i).getName()%>
									</option>
									<%
										}
									%>
							</select></td>
						</tr>
						<tr style="display: none" id="showuser">
					    	<td class="info col-md-1 text-right" id="case"><span class="red">*</span>领取人员:</td>
					    	<td class="col-md-11">
					    		<label id="choose1" class="form-control" style="text-align: left;" data-toggle="modal" data-target="#myModaltakeuid">请选择人员</label>
								<input type="hidden" name="takeuid" id="takeuid"  value=""  >
							</td>
					    </tr>
						<tr>
							<td class="info col-md-1 text-right"><span class="red">*</span>地址:</td>
							<td class="col-md-11"><input type="text"
								class="form-control" name="address" id="address" value="" nullmsg="地址不能为空"
								maxlength="300" autocomplete="off" datatype="*1-300"
								errormsg="至少1个字符,最多300个字符！"></td>
						</tr>
						<tr>
							<td class="info col-md-1 text-right"><span class="red">*</span>备注:</td>
							<td class="col-md-11"><input type="text"
								class="form-control" name="note" id="note" value="" nullmsg="请填写备注"
								maxlength="300" autocomplete="off" datatype="*1-300"
								errormsg="至少1个字符,最多300个字符！"></td>
						</tr>
					</table>
					<div class="alert alert-warning alert-dismissible" role="alert"
						style="display: none;" id="alert">
						<button type="button" class="close" data-dismiss="alert">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<strong>系统提示</strong> <span id="savemsg"></span>
					</div>
					<br />
					<div class="col-md-12 text-center">
						<button type="button" class="btn btn-primary btn-lg"
							onclick="isValid(this);">保 存</button>
					</div>
				</div>
			</div>
		</form>
		<!--明细列表 -->
		<table fit="true" fitColumns="true" class="table table-striped table-hover table-bordered" id="table">
			<thead>
				<tr id="bar" style="display: none;">
					<th><input type="checkbox" id="all" name="allCK"
						onclick="selectAll()" /></th>
					<th>单号</th>
					<th>名称</th>
					<th>价格</th>
					<th>类别</th>
					<th>发布时间</th>
					<th>发布人</th>
					<th>pid</th>
					<th>数量</th>
					<th>备注</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody id="item">
			</tbody>
		</table>
		<div class="col-md-12 text-center">
			<button class="btn btn-danger " data-toggle="modal" id="add"
			data-target="#myModal">添加明细</button>
		</div>
	</div>
	<div class="cls"></div>
	<div class="center"></div>

	<!-- 模态框（Modal） -->
	<div class="modal fade " id="myModal" tabindex="-1" role="dialog" data-backdrop="false"
		aria-labelledby="myModalLabelAdd" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content"><!--  style="width:800px; height: 550px;" -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabelAdd"
						style="text-align: center;">添加明细</h4>
				</div>
				<div class="modal-body"><!--  style="height: 428px;" -->
					<div class="nav">

						<table class="table ">
							<tr>
								<td class="info col-md-2 text-right"><span class="red">*</span>单号:</td>

								<td class="col-md-11 " colspan="2"><label class="form-control text-left" disabled
									id="numberitem">${number}</label></td>

							</tr>
							<tr>
								<td class="info col-md-2 text-right"><span class="red">*</span>名称:</td>
								<td class="col-md-11"  colspan="2">
								<div class="search">
									<input type="text" name="title" class="form-control" id="titleitem"  value=""  autocomplete="off"
									nullmsg="请输入名称" placeholder="搜索名称" errormsg="输入有误，请重新输入" datatype="*1-10">
							        <div id="auto_div"></div>
							    </div>
								</td>
							</tr>
							<div class="stockitem" id="stockitem">
							</div>
							<tr>
								<td class="info col-md-2 text-right"><span class="red">*</span>价格:</td>
								<td class="col-md-11" colspan="2">
								<label id="priceitem1" class="form-control text-left" disabled></label>
								<input type="hidden" step="0.01"
									class="form-control" name="price" id="priceitem" value=""
									maxlength="50" placeholder="请输入价格" autocomplete="off"
									datatype="*1-50" errormsg="至少1个字符,最多50个字符！"></td>
							</tr>
							<tr>
								<td class="info col-md-2 text-right"><span class="red">*</span>类别:</td>
								<td class="col-md-11" colspan="2"><select name="type" id="typeitem"	disabled
									class="form-control">
										<option value="0" selected="selected">请选择类别</option>
										<!--动态从数据库查数据并组合成option  -->
										<%
											for (int i = 0; i < crmNameList.size(); i++) {
										%>
										<option value="<%=crmNameList.get(i).getId()%>">
											<%=crmNameList.get(i).getName()%>
										</option>
										<%
											}
										%>
								</select></td>
							</tr>
							<input type="hidden" class="form-control" name="pid" id="piditem" value="" />
							<tr>
								<td class="info col-md-2 text-right"><span class="red">*</span>数量:</td>
								<td class="col-md-11" colspan="2"><input type="number"
									class="form-control" name="num" id="numitem" value=""
									maxlength="50" nullmsg="数量不能为空" placeholder="数量"
									autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
								</td>
							</tr>
							<tr>
								<td class="info col-md-2 text-right"><span class="red">*</span>备注:</td>
								<td class="col-md-11" colspan="2"><textarea type="text" rows="3"
									class="form-control" name="note" id="noteitem" value=""
									maxlength="300" autocomplete="off" datatype="*1-300"
									errormsg="至少1个字符,最多300个字符！"></textarea></td>
							</tr>
						</table>
					</div>
				</div>
				<div class="modal-footer" style="text-align: center">
					<button type="button" class="btn btn-default" data-dismiss="modal" onclick="clearitem()">
						关闭</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal" id="submit">
						提交</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>

	<!--编辑 弹出的modal  -->

			<!-------------------------------------------------------------------------------------------------------------------------  -->
	<!-- 模态框（Modal） -->
	<div class="modal fade " id="myModaledit" tabindex="-1" role="dialog" data-backdrop="false"
		aria-labelledby="myModalLabelEdit" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabelEdit"
						style="text-align: center;">编辑明细</h4>
				</div>
				<div class="modal-body">
					<div class="nav">
						<table class="table table-bordered" id="edittable">
							<input type="hidden" name="id" id="idedit" value="" />
							<tr>
								<td class="info col-md-2 text-right"><span class="red">*</span>单号:</td>

								<td class="col-md-11 "><label class="form-control text-left"
									id="numberitem">${number}</label></td>

							</tr>
							<tr>
								<td class="info col-md-2 text-right"><span class="red">*</span>名称:</td>
								<td class="col-md-11">
								<label id="titleedit1" class="form-control text-left"></label>
								<input type="hidden"
									class="form-control" name="title" id="titleedit" value=""
									maxlength="50" placeholder="请输入名称" autocomplete="off"
									datatype="*1-50" errormsg="至少1个字符,最多50个字符！"></td>
							</tr>
							<tr>
								<td class="info col-md-2 text-right"><span class="red">*</span>价格:</td>
								<td class="col-md-11">
								<label id="priceedit1" class="form-control text-left"></label>
								<input type="hidden" step="0.01"
									class="form-control" name="price" id="priceedit" value=""
									maxlength="50" placeholder="请输入价格" autocomplete="off"
									datatype="*1-50" errormsg="至少1个字符,最多50个字符！"></td>
							</tr>
							<tr>
								<td class="info col-md-2 text-right"><span class="red">*</span>类别:</td>
								<td class="col-md-11"><select name="type" id="typeedit"
									class="form-control">
										<option value="0" selected="selected">请选择类别</option>
										<!--动态从数据库查数据并组合成option  -->
										<%
											for (int i = 0; i < crmNameList.size(); i++) {
										%>
										<option value="<%=crmNameList.get(i).getId()%>">
											<%=crmNameList.get(i).getName()%>
										</option>
										<%
											}
										%>
								</select></td>
							</tr>
							<tr>
								<td class="info col-md-2 text-right"><span class="red">*</span>数量:</td>
								<td class="col-md-11"><input type="number"
									class="form-control" name="num" id="numedit" value=""
									maxlength="50" nullmsg="数量" placeholder="数量"
									autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
								</td>
							</tr>
							<tr>
								<td class="info col-md-2 text-right"><span class="red">*</span>备注:</td>
								<td class="col-md-11">
								<textarea type="text" rows="3"
									class="form-control" name="note" id="noteedit" value=""
									maxlength="300" autocomplete="off" datatype="*1-300"
									errormsg="至少1个字符,最多300个字符！"></textarea>
									<!-- <input type="text"
									class="form-control" name="note" id="noteedit" value=""
									maxlength="300" autocomplete="off" datatype="*1-300"
									errormsg="至少1个字符,最多300个字符！"> --></td>
							</tr>
						</table>
					</div>
				</div>
				<div class="modal-footer" style="text-align: center">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						关闭</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal" id="edit">
						提交</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<script type="text/javascript">
		$("#submit").click(function(){
			var key=true;
			 if($("#numberitem").text()==""){
				LW.message.show("单号不能为空");
				key=false;
				return false;
			}
			if($("#titleitem").val()==""){
				LW.message.show("请输入名称");
				key=false;
				return false;
			}
			if($("#priceitem").val()==""){
				$("#titleitem").select();
				LW.message.show("未找到该名称，请重新输入");
				key=false;
				return false;
			}
			if($("#piditem").val()==""){
				$("#titleitem").select();
				LW.message.show("未找到该名称，请重新输入");
				key=false;
				return false;
			}
			if($("#numitem").val()==""){
				LW.message.show("请输入数量");
				key=false;
				return false;
			}
			if(key){
				$.ajax({
					url:"manage/crmstockinoroutlogitem/saveitem",
					type:"post",
					data:{
						"number":$("#numberitem").text(),"title":$("#titleitem").val(),
						"price":$("#priceitem").val(),"type":$("#typeitem").val(),
						"pid":$("#piditem").val(),
						"num":$("#numitem").val(),"note":$("#noteitem").val()
						},
					type:"post",
					error : function() {
							LW.message.show('提交失败 ');
						},
						success : function() {
							$("#myModal").hide();
							$("#bar").show();
							$("#myModal input").each(function(){
								$(this).val("");
							});
							$("#priceitem1").text("");
							clearitem();
							$.get("manage/crmstockinoroutlogitem/getlistbynumber",
									{'number':$("#numberitem").text()},function(data){
									var result = "";
									var count="";
									var dateCount=[];
									var priceNum="";
									window.priceCount=[];
									for(var i=0;i<data.msg.length;i++)
										{
										result+="<tr id='s"+data.msg[i].id+"'>";
										result+="<td class='a'><input type='checkbox' name='box' onclick='selectOne()' value='"+data.msg[i].id+"'></td>";
										result+="<td id='numbershow"+data.msg[i].id+"'>"+data.msg[i].number+"</td>";
										result+="<td id='titleshow"+data.msg[i].id+"'>"+data.msg[i].title+"</td>";
										result+="<td id='priceshow"+data.msg[i].id+"'>"+data.msg[i].price+"</td>";
										result+="<td id='typeshow"+data.msg[i].id+"'>"+data.msg[i].type+"</td>";
										result+="<td id='dateshow"+data.msg[i].id+"'>"+new Date(data.msg[i].date).format('yyyy-MM-dd hh:mm:ss')+"</td>";
										result+="<td id='uidshow"+data.msg[i].id+"'>"+data.msg[i].uid+"</td>";
										result+="<td id='pidshow"+data.msg[i].id+"'>"+data.msg[i].pid+"</td>";
										result+="<td id='numshow"+data.msg[i].id+"'>"+data.msg[i].num+"</td>";
										/* result+="<td id='inoroutlognoshow'>"+data.msg[i].inoroutlogno+"</td>";
										result+="<td id='addressshow'>"+data.msg[i].address+"</td>"; */
										result+="<td id='noteshow"+data.msg[i].id+"'>"+data.msg[i].note+"</td>";
										result+="<td>";
										result+="<a href='javascript:void(0)' data-toggle='modal' data-target='#myModaledit' onclick='editmodal("+data.msg[i].id+")'>编辑&nbsp;</a>" ;
										result+="<a href='javascript:void(0)' onclick='del("+data.msg[i].id+")'>删除</a>";
										result+="</td>";
										result+="</tr>";
										var number=$("#number").val(data.msg[0].number);
										dateCount.push(data.msg[i].date);
										count=Number(count)+Number(Number(data.msg[i].price)*Number(data.msg[i].num));
										priceNum=Number(Number(data.msg[i].price)*Number(data.msg[i].num));
										priceCount.push(priceNum);
										}
										//$("#price").text(count);
										$("#price").val(count);
										$("#item").html(result);
							},"json");

						}

					});

				}
		});
	</script>

			<!--时间格式化  -->
			<script>
			Date.prototype.format =function(format)
			  {
			  var o = {
			  "M+" : this.getMonth()+1, //month
			  "d+" : this.getDate(), //day
			  "h+" : this.getHours(), //hour
			  "m+" : this.getMinutes(), //minute
			  "s+" : this.getSeconds(), //second
			  "q+" : Math.floor((this.getMonth()+3)/3),
			  "S" : this.getMilliseconds() //millisecond
			  }
			  if(/(y+)/.test(format)) format=format.replace(RegExp.$1,
			  (this.getFullYear()+"").substr(4- RegExp.$1.length));
			  for(var k in o)if(new RegExp("("+ k +")").test(format))
			  format = format.replace(RegExp.$1,
			  RegExp.$1.length==1? o[k] :
			  ("00"+ o[k]).substr((""+ o[k]).length));
			  return format;
			  }
		</script>

	<script>
	$("#editmodal").click(function(){
		var key=true;
		if($("#numberitem").text()==""){
			LW.message.show("单号不能为空");
			key=false;
			return false;
		}
		if($("#titleitem").val()==""){
			LW.message.show("请输入名称");
			key=false;
			return false;
		}
		if($("#priceitem").val()==""){
			LW.message.show("请输入价格");
			key=false;
			return false;
		}
		if($("#piditem").val()==""){
			LW.message.show("请输入pid");
			key=false;
			return false;
		}
		if($("#numitem").val()==""){
			LW.message.show("请输入数量");
			key=false;
			return false;
		}
		/* if($("#inoroutlognoitem").val()==""){
			LW.message.show("inoroutlogno");
			key=false;
			return false;
		}
		if($("#addressitem").val()==""){
			LW.message.show("请输入出货地址");
			key=false;
			return false;
		} */
		if($("#noteitem").val()==""){
			LW.message.show("请输入备注");
			key=false;
			return false;
		}
	});
	</script>	
	
	<!--onchange事件  -->
	<script>
		$(function(){
			$("#selcrmStockTypeList").change(function(){
				var selval=$(this).find("option:selected").val();
				//console.log(selval);
				switch (selval) {

				case "1":
					$("#case").text("收货人:");
					break;

				case "2":
					$("#case").text("领货人:");
					break;

				case "3":
					$("#case").text("退货人:");
					break;
					
				case "4":
					$("#case").text("领货人:");
					break;

				case "5":
					$("#case").text("相关人员:");
					break;

				case "6":
					$("#case").text("相关人员:");
					break;
				 case "7":
					$("#case").text("相关人员:");
					break; 

				default:
					$("#case").text("相关人员:");
					break;
				}
				
				$("#showuser").show();
				$("#choose1").html("请选择人员");
				$("li").children(".btn-primary").removeClass("btn-primary uid");
			});
		});
		
		$("#titleitem").change(function(){
			$("#priceitem1").text("");
			$("#priceitem").val("");
			$("#typeitem").val("");
			$("#piditem").val("");
		});
	</script>	
	
	<script type="text/javascript">
	
		//拖动
		$(document).on("show.bs.modal", ".modal", function(){
		    $(this).draggable({
		//handle: ".modal-header"   // 只能点击头部拖动
		    });
		    $(this).css("overflow", "hidden"); // 防止出现滚动条，出现的话，你会把滚动条一起拖着走的
		});
	</script>
		
	<script>
		function editmodal(id){
			 $("#table tbody>tr").click(function() {
		        window.trSeq = $(this).parent().find("tr").index($(this)[0])+1; //所获取的当前行的行号
			 });
			$.ajax({
				url:"manage/crmstockinoroutlogitem/getbyid?id="+id,
				type:"post",
				success:function(data){
					var ids=$("#idedit").val(id);
					console.log("edit的id为："+id);
					var title=$("#titleedit").val(data.msg.title);
					/*label  */
					$("#titleedit1").text(data.msg.title);
					$("#priceedit1").text(data.msg.price);
					var price=$("#priceedit").val(data.msg.price);
					var type=$("#typeedit").val(data.msg.type);
					var pid=$("#pidedit").val(data.msg.pid);
					var num=$("#numedit").val(data.msg.num);
					var inoroutlogno=$("#inoroutlognoedit").val(data.msg.inoroutlogno);
					var address=$("#addressedit").val(data.msg.address);
					var note=$("#noteedit").val(data.msg.note);
				}
			});
		}
			$("#edit").click(function(){
				var key=true;
				if($("#titleedit").val()==""){
					LW.message.show("请输入名称");
					key=false;
					return false;
				}
				if($("#priceedit").val()==""){
					LW.message.show("请输入价格");
					key=false;
					return false;
				}
				if($("#pidedit").val()==""){
					LW.message.show("请输入pid");
					key=false;
					return false;
				}
				if($("#numedit").val()==""){
					LW.message.show("请输入数量");
					key=false;
					return false;
				}
				if($("#inoroutlognoedit").val()==""){
					LW.message.show("inoroutlogno");
					key=false;
					return false;
				}
				if($("#addressedit").val()==""){
					LW.message.show("请输入出货地址");
					key=false;
					return false;
				}
				if($("#noteedit").val()==""){
					LW.message.show("请输入备注");
					key=false;
					return false;
				}
				if(key){
					var id=$("#idedit").val();
					console.log("得到的id为:"+id);
					$.ajax({
						url:"manage/crmstockinoroutlogitem/edititem?id="+id,
						data:{
							"number":$("#numberedit").text(),"title":$("#titleedit").val(),
							"price":$("#priceedit").val(),"type":$("#typeedit").val(),
							"pid":$("#pidedit").val(),
							"num":$("#numedit").val(),"inoroutlogno":$("#inoroutlognoedit").val(),
							"address":$("#addressedit").val(),"note":$("#noteedit").val()
							},
						type:"post",
						error : function() {
						        LW.message.show('提交失败 ');
						    },
					    success : function() {
					    	$("#myModal").hide();
					    	//editmodal(id);
					    	$.ajax({
								url:"manage/crmstockinoroutlogitem/getbyid?id="+id,
								type:"post",
								success:function(data){
									 var count="";
									 $("#idshow"+id).html(id);
									 $("#titleshow"+id).html(data.msg.title);
									 $("#priceshow"+id).html(data.msg.price);
									 $("#typeshow"+id).html(data.msg.type);
									 $("#pidshow"+id).html(data.msg.pid);
									 $("#numshow"+id).html(data.msg.num);
									 $("#inoroutlognoshow"+id).html(data.msg.inoroutlogno);
									 $("#addressshow"+id).html(data.msg.address);
									 $("#noteshow"+id).html(data.msg.note);
									 count=Number(Number(data.msg.price)*Number(data.msg.num));
									 //count="";
									 console.log("count为："+count);
									 console.log("当前行号为："+trSeq);
									 priceCount[trSeq-1]=count;
									 console.log(priceCount);
									 console.log(priceCount[trSeq-1]);
									 var price="";
									 for(var i=0;i<priceCount.length;i++)
										 {
										 price=Number(price)+Number(priceCount[i]);
										 }
									 console.log("price:"+price);
									 $("#price").val(price);
								}
							});
						}
					});
				}
			});
	</script>
	
	<script>
		function del(id){
			$("#table tbody>tr").click(function() {
		        window.trSeq = $(this).parent().find("tr").index($(this)[0])+1; //所获取的当前行的行号
			 });
			var key=true;
			if (window.confirm('你确定要删除吗？')) {
				$.ajax({
					type:"post",
					url:"manage/crmstockinoroutlogitem/del?id="+id,
					error:function(){
						LW.message.show("删除失败");
					},
					success:function(){
					//	LW.message.show("删除成功");
						$("#s"+id).remove();
						var count="";
						 console.log("当前行号为："+trSeq);
						 priceCount[trSeq-1]=count;
						 console.log(priceCount[trSeq-1]);
						 var price="";
						 for(var i=0;i<priceCount.length;i++)
							 {
							 if(priceCount[i] == undefined || priceCount[i] == "")
							   {
								 priceCount.splice(i,1);
							      i = i - 1; // i - 1 ,因为空元素在数组下标 2 位置，删除空之后，后面的元素要向前补位，
							                       // 这样才能真正去掉空元素,觉得这句可以删掉的连续为空试试，然后思考其中逻辑
							    }
							 }
						 for(var i=0;i<priceCount.length;i++)
							 {
							 	price=Number(price)+Number(priceCount[i]);
							 }
						 	 console.log(priceCount);
							 console.log("price:"+price);
							 $("#price").val(price);
					}
				});
			}
		}
	</script>

	<!--takeuid  -->
	<!-- modal begin -->
		<div class="modal fade " id="myModaltakeuid" tabindex="-1" role="dialog"
		 aria-labelledby="myModalLabelTake" aria-hidden="true" data-backdrop="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabelTake" style="text-align:center;font-weight: bold;">
                        指定人员
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="nav-takeuid" style="width:auto;height:300px;overflow:auto;">

                    	<!--搜索框  -->
                    	<table class="table">
                    	<tr>
			                 <td><label for="user" class="form-control" style="border:0px">姓名:</label></td>
			                 <td><input type="text" name="user" id="user" class="form-control"></td>
			                 <td>
			              		 <button  class="form-control btn btn-default" onclick="select();">查询</button>
			                 </td>
                    	</tr>
                    	</table>
                    	<div class="returnuser" id="returnuser">

                    	</div>
                        <ul>
                            <li id="takeli">
							<c:choose>
								<c:when test="${shiroActionUsersGroupList.size() <=0}">
									<p>没有找到数据记录</p>
								</c:when>

								<c:otherwise>

										<c:forEach items="${dutyUsernameList}" var="dutyUsername">
											<div class="btn btn-default" id="u${dutyUsername.id}" data-id="${dutyUsername.id}" data-name="${dutyUsername.user}" onclick="addUser(${dutyUsername.id})">${dutyUsername.user}</div>
										</c:forEach>

								</c:otherwise>
							</c:choose>

                            </li>

                        </ul>
                    </div>
                </div>
                <div class="modal-footer" style="text-align:center">
                   <button type="button" class="btn btn-default" data-dismiss="modal">
                        关闭
                    </button>
                    <button type="button" class="btn btn-primary" id="saveuser" data-dismiss="modal">
                       确定
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->

		<!--tackeuid  -->
		<script>
		 function addUser(id) {
			 $("li").children(".btn-primary").removeClass("btn-primary uid");
			 $("#returnuser").children(".btn-primary").removeClass("btn-primary uid");
            if ($("#u" + id).hasClass("btn-primary")) {
                $("#u" + id).removeClass("btn-primary uid");
            } else {
                $("#u" + id).addClass("btn-primary uid");
            }
        }

		$("#saveuser").click(function(){
    				uid="";user="";
    				$(".uid").each(function(){
    					uid+=$(this).data("id")+",";
    					user+=$(this).data("name")+",";
    				});
    				uid=uid.substring(0, uid.length - 1);
        			$("#choose1").html(user.substring(0, user.length - 1));
        			if(user==null ||user==""){
    				$("#choose1").html("请选择人员");
    			}
				$("#takeuid").attr("value", uid);
    			});

		function select() {
			var user=$("#user").val();
			if(user!=null &&user!="")
			{
				/* console.log(user); */
				$.ajax({
					url:"manage/crmstockinoroutlogitem/getuser?user="+user,
					type:"post",
					error:function(){
						LW.message.show("查询失败，请重新输入");
					},
					success:function(data){
						var result="";
						if(data.code!=404)
						{  //查询正常
							for(var i=0;i<data.msg.length;i++)
							{
								result+="<div class='btn btn-default' style='margin-left:20px;' id='u"+data.msg[i].id+"' data-id='"+data.msg[i].id+"' data-name='"+data.msg[i].user+"' onclick='addUser("+data.msg[i].id+")'>";
								result+=data.msg[i].user;
								result+="</div>";
							}
						}
						else
						{
							result+="<div style='text-align:center'>";
							result+="未找到数据记录";
							result+="</div>";
							$("#user").click(function(){
								$("#user").val("");
							});
						}
							$("#returnuser").html(result);
							$("#takeuid").val(data.msg.id);
							$("#returnuser").show();
							$("#takeli").remove(); //隐藏li


					}
				});
			}
		}
		</script>

		<script type="text/javascript">
			function selectstock() {
				var title=$("#titleitem").val();
				//LW.message.show(title);
				if(title!="" && title!=null)
				{
					$.ajax({
						url:"manage/crmstockinoroutlogitem/getStockByTitle?title="+title,
						type:"post",
						error:function(){
							LW.message.show("查询失败，请重新输入");
						},
						success:function(data)
						{
							var result="";
							if(data.code!=404)
							{
								for(var i=0;i<data.msg.length;i++)
								{
									result+="<label class='form-control stockresult'  id='t"+data.msg[i].id+"' onclick='confirmstock("+data.msg[i].id+","+data.msg[i].price+","+data.msg[i].type+");'>";
									result+=data.msg[i].title;
									result+="</label>";
								}
							}
							else
							{
								result+="<div style='text-align:center'>";
								result+="未找到数据记录";
								result+="</div>";
							}
							$("#stockitem").html(result);
							$("#stockitem").show();
							/* console.log(result); */
						}
					});
				}
				else
				{
					LW.message.show("请输入名称！");
					$("#titleitem").select();
				}
			}

			function confirmstock(id,price,type){
				var title=$("#t"+id).html();
				$("#titleitem").val(title);
				$("#piditem").val(id);
				$("#priceitem").val(price);
				$("#priceitem1").text(price);
				$("#typeitem").val(type);
				//选中状态
				$("#t"+id).siblings().removeClass("stockresult-ed");  //找出同级并删除
					if($("#t"+id).hasClass("stockresult-ed"))
					{
						$("#t"+id).removeClass("stockresult-ed");
					}
					else
					{
						$("#t"+id).addClass("stockresult-ed");
					}
				//$("#t"+id).css("background-color","#d9edf7");
			}

			function clearitem(){
				$("#stockitem").hide();
			}
		</script>

	<script type="text/javascript">
		$("#page_crmstockinoroutlogitem_list").parent().attr("class","active");
		$(function(){LW.form.validate("form1");});
		//$(function(){LW.form.validate("additem");});
	</script>

	 <!-- 监听页面刷新  -->
	<!--
	<script type="text/javascript">
	window.onbeforeunload = onbeforeunload_handler;
	window.onunload = onunload_handler;
	function onbeforeunload_handler(){
	    var warning="确认退出?";
	return warning;
	    }

	function onunload_handler(){
	    var warning="谢谢光临";
	    LW.message.show(warning);
	    }
	</script>  -->
	<script type="text/javascript">
   	var title_list=[];
   	var price_list=[];
   	var type_list=[];
   	var pid_list=[];

   	//只请求一次
		var key=false;
	    $("#add").click(function(){
	    	$("#titleitem").click(function(){
	    	  var width= $(".search").width()-7;
	    	  $("#auto_div").css("width",width+"px");
	    	});
	   	if(!key)
	   	{
	    	$.ajax({
	    		url:"manage/crmstockinoroutlogitem/getStockByTitle",
	    		type:"post",
	    		error:function(){
	    			LW.message.show("查询失败，请重新输入");
	    			$("#titleitem").val("");
	    			$("#titleitem").select();
	    		},
	    		success:function(data){
	    			if(data.code!=404)
	   				{
	    				for(var i=0;i<data.msg.length;i++)
						{
	    					title_list.push(data.msg[i].title);
	    					price_list.push(data.msg[i].price);
	    					type_list.push(data.msg[i].type);
	    					pid_list.push(data.msg[i].id);
						}
	    				/* console.log(title_list);
	    				console.log(price_list);
	    				console.log(type_list); */
					}
					else
					{
						title_list.push("没有找到数据记录");
					}
	    		}
	    	});
		 }
   		 key=true;
	   	 });
     var old_value = "";
     var highlightindex = -1;   //高亮
     //自动完成
     function AutoComplete(auto, search, mytitle_list,myprice_list,mytype_list,mypid_list)
     {
         if ($("#" + search).val() != old_value || old_value == "")
         {
             var autoNode = $("#" + auto);   //缓存对象（弹出框）

             var titlelist = new Array();
             var pricelist = new Array();
             var typelist  = new Array();
             var pidlist  = new Array();
             var n = 0;
             var j=0;
             var k=0;
             var m=0;
             old_value = $("#" + search).val();
             for (i in mytitle_list)
             {
                 if (mytitle_list[i].indexOf(old_value) >= 0)
                 {
                     titlelist[n++] = mytitle_list[i];
                     pricelist[j++] = myprice_list[i];
                     typelist[k++] = mytype_list[i];
                     pidlist[m++] = mypid_list[i];
                 }
             }
             if (titlelist.length == 0)
             {

                 //autoNode.hide();
                 autoNode.empty();
                 var result="";
                 result+="<p style='text-align: center;font-size: 13px; margin-top: 15px;' >";
                 result+="没有找到数据记录";
                 result+="</p>";
                 $("#auto_div").html(result);
                 return;
             }
             autoNode.empty();  //清空上次的记录
             for (i in titlelist)
             {
                 var wordNode = titlelist[i];   //弹出框里的每一条内容
                 var priceNode=pricelist[i];
                 var typeNode=typelist[i];
                 var pidNode=pidlist[i];
                 var newDivNode = $("<div>").attr("id", i).attr("data-price",priceNode).attr("data-type",typeNode).attr("data-pid",pidNode);    //设置每个节点的id值
                 newDivNode.attr("style", "font:14px/25px arial;height:30px;padding:0 8px;cursor: pointer;");
                 newDivNode.html(wordNode).appendTo(autoNode);  //追加到弹出框
                 //鼠标移入高亮，移开不高亮
                 newDivNode.mouseover(function (){
                     if (highlightindex != -1)
	                     {        //原来高亮的节点要取消高亮（是-1就不需要了）
	                         autoNode.children("div").eq(highlightindex).css("background-color", "white");
	                     }
	                     //记录新的高亮节点索引
	                     highlightindex = $(this).attr("id");
	                     $(this).css("background-color", "#ebebeb");
                 });
                 newDivNode.mouseout(function () {
                     $(this).css("background-color", "white");
                 });
                 //鼠标点击文字上屏
                 newDivNode.click(function () {
                     //取出高亮节点的文本内容
                     var titleText = autoNode.hide().children("div").eq(highlightindex).text();
                     var priceText = autoNode.hide().children("div").eq(highlightindex).attr("data-price");
                     var typeText = autoNode.hide().children("div").eq(highlightindex).attr("data-type");
                     var pidText = autoNode.hide().children("div").eq(highlightindex).attr("data-pid");
                     highlightindex = -1;
                     //文本框中的内容变成高亮节点的内容
                     $("#" + search).val(titleText);
                     $("#priceitem1").text(priceText);
                     $("#priceitem").val(priceText);
                     $("#typeitem").val(typeText);
                     $("#piditem").val(pidText);
                     $("#numitem").select();
                 })
                 if (titlelist.length > 0)
                 {    //如果返回值有内容就显示出来
                     autoNode.show();
                 }
                 else
              	 {               //服务器端无内容返回 那么隐藏弹出框
                     autoNode.show();
                     var result="";
                     result+="<p style='text-align: center;font-size: 13px; margin-top: 15px;' >";
                     result+="没有找到数据记录";
                     result+="</p>";
                     $("#auto_div").html(result);
                     //弹出框隐藏的同时，高亮节点索引值也变成-1
                     highlightindex = -1;
                 }
             }
         }
         //点击页面隐藏自动补全提示框
         document.onclick = function (e)
         {
             var e = e ? e : window.event;
             var tar = e.srcElement || e.target;
             if (tar.id != search)
             {
                 if ($("#" + auto).is(":visible"))
                 {
                     $("#" + auto).css("display", "none")
                 }
             }
         }
     }
     $(function () {
         old_value = $("#titleitem").val();
         $("#titleitem").focus(function () {
             if ($("#titleitem").val() == "") {
                 AutoComplete("auto_div", "titleitem", title_list,price_list,type_list,pid_list);

             }
         });
         $("#titleitem").keyup(function () {
             AutoComplete("auto_div", "titleitem", title_list,price_list,type_list,pid_list);
         });
     });
	</script>
	<style type="text/css">
        .search
        {
            left: 0;
            position: relative;
        }
        #auto_div
        {
        	width:450px;
            display: none;
		    border: 1px #74c0f9 solid;
		    background: #FFF;
		    position: absolute;
		    top: 34px;
		    left: 0;
		    color: #323232;
		    border-radius: 10px;
		    box-shadow: 5px 5px 5px #888888;
		    height: 200px;
		    overflow: auto;
        }
    </style>
</div>

	<%@ include file="../foot.jsp"%>
</body>
</html>