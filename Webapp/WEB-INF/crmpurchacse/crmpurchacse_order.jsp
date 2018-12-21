<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%
java.util.Date date = new java.util.Date();
DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
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
   pageContext.setAttribute("id",request.getParameter("id").trim());
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
		<title>${appName}_库存信息管理</title>
		<style>
			table tr th, table tr td {
				text-align: center;
				font-size: 14px;
				vertical-align: middle !important;
			}
			input{
				outline: none;
			}
			.btn-num{
				border: 1px solid #ddd;
				width: 50px;

			}
			.main{
				font-family: "Microsoft Yahei", "Helvetica Neue", Arial, Helvetica, sans-serif;
			}
			.wuas{
				font-size: 20px;
				font-family: "Microsoft Yahei", "Helvetica Neue", Arial, Helvetica, sans-serif;
			}
			.sup-xx{
				color: #c9d0c6;
				position: absolute;
				top: 5px;
				right: 25px;
				font-size: 24px;
				cursor:pointer;
			}
			.sup-xx:hover {
				color: #a3a9a0;
			}
			.address{
				width: 6%;
				float: left;
				font-size: 14px;
				line-height: 34px;
			}
		</style>
	</head>
	<body>
		<%@ include file="../top.jsp"%>
   		<%@ include file="../left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li><a href="<%=basePath%>manage/index.html">首页</a></li>
	    		<li><a href="<%=basePath%>manage/crmpurchacse/crmpurchacse_list.html">采购信息列表</a></li>
	    		<li><a href="javascript:void(0);">采购订单详情</a></li>
    		</ul>
    	</div>
		<div class="rightContainer">
			<div class="main">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title" style="position: relative;">
							<div class="col-md-12">
								<%
									SimpleDateFormat sdf1 = new SimpleDateFormat("YYYYMMddhhmm");
									Date now1 = new Date();
									int random = (int) (Math.random() * 10000 + 1);
									String number = sdf1.format(now1) + random;
								%>
								<div class="address">
									<label>采购编号：</label>
								</div>
								<div style="width: 94%;float: left;">
									<label class="form-control" id="number" disabled><%=number%></label>
								</div>
							</div>
							<div class="col-md-12">
								<div class="address">
									<label>标题：</label>
								</div>
								<div style="width: 94%;float: left;">
									<input type="text" class="form-control" id="title" placeholder="在这里填写标题" autocomplete="off" />
								</div>
							</div>
							<div class="col-md-12" style="margin-top: 5px;">
								<div class="address">
									<label>收货地址：</label>
								</div>
								<div style="width: 94%;float: left;">
									<input type="text" placeholder="在这里填写收货地址" name="address" id="address" class="form-control" autocomplete="off"  />
								</div>
							</div>
						</h3>
						<div class="cls"></div>
					</div>
					<table class="table">
						<tr>
							<th>商品编号</th>
							<th>商品名称</th>
							<th>单价</th>
							<th>计量单位</th>
							<th>供应商名称</th>
							<th>数量</th>
							<th>备注</th>
						</tr>
						<c:forEach items="${list}" var="item">
							<input type="hidden" id="id${item.id}" class="itemId" value="${item.id}" />
							<tr>
								<td>${item.snumber}</td>
								<td>${item.name}</td>
								<td id="price${item.id}" class="price">${item.price}</td>
								<td>${item.unit}</td>
								<td>${item.crmSupplier.supplier}</td>
								<td>
									<div class="btn-group">
										<button type="button" class="btn btn-default" onclick="decr(${item.id},${item.price})" id="decr${item.id}">
											<span class="glyphicon glyphicon-minus"></span>
										</button>
										<input type="text" class="btn btn-num" data-count="0" id="num${item.id}" placeholder="0" value="0" data-count="" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"  
											       onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'0')}else{this.value=this.value.replace(/\D/g,'')}" />
										<button type="button" class="btn btn-default" onclick="incr(${item.id},${item.price})" id="incr${item.id}">
											<span class="glyphicon glyphicon-plus"></span>
										</button>
									</div>
								</td>
								<td style="position: relative;">
									<input type="text" class="form-control note" maxlength="20" datatype="*0-20" placeholder="这里可以填写备注信息" autocomplete="off"  />
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<div style="text-align: right;">
				<p style="display: inline-block;margin: 0px 10px;padding-top: 2px;">
					<span class="wuas">合计：</span>
					<span class="wuas">￥</span>
					<span class="wuas" id="count">0</span>
					<span class="wuas">元</span>
				</p>
				<div class="btn btn-primary" id="submit">去结算</div>
			</div>
		</div>
    	<div class="cls"></div>
    	<script type="text/javascript">
			$("#page_crmpurchacse_list").parent().attr("class","active");
			var count=0;
            function decr(id,price) {
                var num=Number($("#num"+id).val());
                num=Number(Number(num)-1);
                if(num<=0){
                    num=Number(0);
                }
                $("#num"+id).val(num).attr("data-count",Number(accMul(price,num)));
                sumCount();
            }
            function incr(id,price) {
                var num = Number($("#num" + id).val());
                num = Number(Number(num) + 1);
                $("#num"+id).val(num).attr("data-count",Number(accMul(price,num)));
                sumCount();
            }
            function sumCount(){
                var count=0;
				$(".btn-num").each(function () {
                    count+=Number($(this).attr("data-count"));
				});
				count=count.toFixed(2);
				$("#count").text(count);
			}
			$(".btn-num").on('input propertychange',function () {
			    $(this).each(function () {
			        $count=$(this);
			        $price=$(this).parent().parent().siblings(".price");
					var price=$price.html();
					var count=$count.attr("data-count",Number(accMul(price,$(this).val())));
                });
                sumCount();
            })
			$("#submit").click(function () {
                var ids = [];
                var nums= [];
                var notes=[];
			    var key=true;
				$(".itemId").each(function () {
					ids.push($(this).val());
                });
				$(".btn-num").each(function () {
					nums.push($(this).val());
                });
                $(".note").each(function () {
                    notes.push($(this).val());
                });
                if($("#title").val()==""){
                    key=false;
                   LW.message.show("采购名称还没有填写哦");
                    return false;
				};
                if($("#address").val()==""){
                    key=false;
                    LW.message.show("收货地址不能为空");
                    return false;
                };
                if($("#number").text()==""){
                    key=false;
                    LW.message.show("非法的订单");
                    return false;
                };
				$(".btn-num").each(function () {
                    if ($(this).val() == 0) {
                        LW.message.show("有未选择数量的订单");
                        $(this).select();
                        key=false;
                        return false;
                    }
                });
				if(key) {
					$.ajax({
						url: "manage/crmpurchacse/do_order",
						type: "POST",
                        traditional: true,
						data: {
                            ids: ids,
                           	nums: nums,
							notes:notes,
							title:$("#title").val(),
							number:$("#number").text(),
							address:$("#address").val(),
                        },
                        cache: false,
						success: function (data) {
						    console.log(data);
							if (data=="false") {
								console.log(data);
                                LW.message.show("结算失败！");
							} else {
                                LW.message.show("结算成功！");
								$("#submit").attr("disabled",true);
                                setTimeout(function () {
                                    window.location.href="manage/crmpurchacse/crmpurchacse_list";
                                }, 1500);
							}

						},
						error: function (data) {
							console.log(data);
                            LW.message.show("未知错误，结算失败！");
						}

					});
				}
            });
            //乘法
            function accMul(arg1,arg2)
            {
                var m=0,s1=arg1.toString(),s2=arg2.toString();
                try{m+=s1.split(".")[1].length}catch(e){}
                try{m+=s2.split(".")[1].length}catch(e){}
                return (Number(s1.replace(".",""))*Number(s2.replace(".",""))/Math.pow(10,m))
            }
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>