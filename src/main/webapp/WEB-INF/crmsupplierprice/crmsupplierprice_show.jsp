<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<link href="<%=basePath%>resources/plugin/bootstrap3.3.2/css/bootstrap.min.css" rel="stylesheet" />
		<script src="<%=basePath%>resources/js/jquery.min.js" type="text/javascript"></script>
		<script src="<%=basePath%>resources/plugin/bootstrap3.3.2/js/bootstrap.min.js"></script> 
		<script src="<%=basePath%>resources/js/weixin.js"></script>
		<title></title>
		<style>
			h1 {
				FONT-SIZE: 24px;
			}
			.js {
				font-size: 13px;
				line-height: 16px;
				width: 720px;
				margin: 15px  auto 10px auto;
			}
			.li{
				background: #ECF9ED;
				padding-right: 5px;
				color: #006600;
			}
			.table-bordered>tbody>tr>td{
				border: 1px solid green;
			}
			.biao {
				width: 40%;
				margin: 0px auto;
            }
			table>thead>tr>th,table>tbody>tr>td{
				text-align: center;
			}
			.table-bordered>thead>tr>th {
					border-bottom-width: 0;
				}
			.table-bordered>thead>tr>th {
					border: 1px solid green !important;
				}
			</style>
		<style type="text/css">
				.nav-takeuid  ul {
            list-style: none;
            padding:0px;
        }

         .nav-takeuid   ul li .btn {
                margin: 10px;
               
                height: 35px;
               
            }
			
			.nav-takeuid ul li p{
				 text-align:center;
				 font-family:Microsoft YaHei;
				 font-size:16px;
			}
		.loading{
			width: 100px;
		    margin: 0px auto;
		    position: fixed;
		    left: 50%;
		    margin-left: -50px;
		    top: 150px;
		    text-align:center;
		    display:none;
		}
		.loadbg{
			background-color: 
		}
		</style>
	</head>
	<body>
		<div class="loading">
	    	<img alt="loading" src="<%=basePath%>resources/adpic/img/loading.gif" style="width:100%;">
	   		<p>上传中</p>
	    </div>
		<h1 style="text-align: center;font-size: 30px;">
		<strong>${title}</strong>
		</h1>
		<div class="biao">
			<table class="table table-bordered">
			<thead>
				<tr>
					<th class="li">序号</th>
					<th class="li">商品编号</th>
					<th class="li">品名及规格</th>
					<th>单位</th>
					<th>单价</th>
				</tr> 
			</thead>
			<tbody>
			<input type="hidden" name="fileName" value="${fileName}" id="fileName">
			<c:forEach items="${list}" var="list">
				<tr>
					<td class="li">${list.seq}</td>
					<td class="li">${list.snumber}</td>
					<td class="li">${list.name}</td>
					<td>${list.unit}</td>
					<td>${list.price}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		
		<div style="" class="text-center">
			<div>
			<label id="choose1" class="form-control" style="text-align: left;" data-toggle="modal" data-target="#myModalSupplier">请选择供应商</label>
			<input type="hidden" name="supplier" id="supplier"  value=""  >
			</div>
			<div class="" style="padding: 20px 0px">
				<button type="button" class="btn btn-success col-md-5" id="success">确认无误，去提交</button>
				<button type="button" class="btn btn-danger col-md-5" style="float: right;" id="error">信息有误，重新上传</button>
			</div>
		</div>
		</div>
		
	<!--供应商  -->
	<!-- modal begin -->
		<div class="modal fade " id="myModalSupplier" tabindex="-1" role="dialog"
		 aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel" style="text-align:center;font-weight: bold;">
                        选择供应商
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="nav-takeuid" style="width:auto;height:300px;overflow:auto;">
                    
                    	<!--搜索框  -->
                    	<table class="table">
                    	<tr>
			                 <td><label for="user" class="form-control" style="border:0px">供应商名称:</label></td> 
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
								<c:when test="${crmSupplierList.size() <=0}">
									<p>没有找到数据记录</p>
								</c:when>

								<c:otherwise>
									
										<c:forEach items="${crmSupplierList}" var="supplier">
											<div class="btn btn-default" id="u${supplier.id}" data-id="${supplier.id}" data-name="${supplier.supplier}" onclick="addUser(${supplier.id})">${supplier.supplier}</div>
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
    				$("#choose1").html("请选择供应商");
    			}
				$("#supplier").attr("value", uid);
    			});
		
		function select() {
			var user=$("#user").val();
			if(user!=null &&user!="")
			{
				/* console.log(user); */
				$.ajax({
					url:"getListBySupplier?supplier="+user,
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
								result+="<div class='btn btn-default' style='margin-left:20px;' id='u"+data.msg[i].id+"' data-id='"+data.msg[i].id+"' data-name='"+data.msg[i].supplier+"' onclick='addUser("+data.msg[i].id+")'>";
								result+=data.msg[i].supplier;
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
							$("#supplier").val(data.msg.id);
							$("#returnuser").show();
							$("#takeli").remove(); //隐藏li
							
							
					}
				});
			}
		}
		</script>
		<script type="text/javascript">
		var fileName=$("#fileName").val();
		$("#success").click(function(){
			if($("#choose1").text()=="请选择供应商")
			{
				LW.message.show("请选择供应商！");
			}
			else
			{
				$(this).attr("disabled",true);
				$("#error").attr("disabled",true);
				$(".loading").show();
				$.ajax({
					url:"importexcel",
					type:"get",
					dataType:"json",
					data:{
						//"list":JSON.stringify('${list}'),
						//"fileName":fileName,
						"sid":$("#supplier").val()
					},
					success:function(data){
						if(data.code==200){
							LW.message.show("提交成功！");
							$(".loading").hide();
							setTimeout(function () {
							window.location.href="crmsupplierprice_list";
			                }, 3000);
						}
					},
					error:function(){
						LW.message.show("提交失败！");
						$(".loading").hide();
					}
				});
			}
		});
		$("#error").click(function(){
			$.ajax({
				url:"quxiao",
				data:{
					"fileName":fileName,
				},
				success:function(data){
					if(data.code==200){
						LW.message.show("执行操作成功！");
						window.location.href="crm_fruit";
					}else{
						LW.message.show("执行操作失败！");
					}
				},
				error:function(){
					LW.message.show("执行操作失败！");
				}
			});
		});
		</script>
	</body>
</html>
