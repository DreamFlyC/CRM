<%--
  Created by IntelliJ IDEA.
  User: CZP
  Date: 2018/12/11
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.text.*" %>
<%@ page import="java.lang.String" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.lw.crm.crmuser.entity.CrmUser" %>
<%@ page import="com.lw.crm.crmname.entity.CrmName" %>
<%@ page import="com.lw.crm.crmsupplier.entity.CrmSupplier" %>
<%
    ArrayList<CrmUser> crmUserList = (ArrayList) request.getAttribute("crmUserList");
    ArrayList<CrmName> crmNameList = (ArrayList) request.getAttribute("crmNameList");
    ArrayList<CrmSupplier> crmSupplierList = (ArrayList) request.getAttribute("crmSupplierList");
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
    <base href="<%=basePath%>"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8;"/>
    <link href="<%=basePath%>resources/plugin/bootstrap3.3.2/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="<%=basePath%>resources/css/system.css" rel="stylesheet" type="text/css"/>
    <link href="<%=basePath%>resources/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="<%=basePath%>resources/fonts/fontawesome-webfont.woff2"/>
    <script src="<%=basePath%>resources/js/jquery.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>resources/js/jquery-ui.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>resources/plugin/bootstrap3.3.2/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>resources/valid/Validform_v5.3.2_min.js"></script>
    <script src="<%=basePath%>resources/plugin/kindeditor/kindeditor-min.js"></script>
    <script src="<%=basePath%>resources/js/weixin.js"></script>
    <script src="<%=basePath%>resources/duty/js/selectAll.js"></script>
    <script src="<%=basePath%>resources/duty/js/My97DatePicker/WdatePicker.js"></script>
    <title>${appName}_采购明细</title>
    <style>
        .modal {
            margin-top: 100px;
            position: fixed;
            top: -10%;
        }

        .nav {
            width: auto;
            height: 380px;
            overflow: auto;
        }

        ul {
            list-style: none;
            padding: 0px;
        }

        .nav-takeuid ul {
            list-style: none;
            padding: 0px;
        }

        .nav-takeuid ul li .btn {
            margin: 10px;
            height: 35px;
        }

        .nav-takeuid ul li p {
            text-align: center;
            font-family: Microsoft YaHei;
            font-size: 16px;
        }

        table thead tr th, table tbody tr td {
            text-align: center;
        }

        td {
            vertical-align: middle !important;
        }

        .stockitem {
            display: none;
            width: 100%;
        }
    </style>
    <script>
        function saveTable() {
            var saveData = [];
            $("#table tbody tr").each(function (trindex, tritem) {
                var tableData = {};
                $(tritem).find("td").each(function (tdIndex, tditem) {
                    var tdValue = $(tditem).text();
                    if (tdIndex == 1) {
                        tableData.number = tdValue;
                    }
                    if (tdIndex == 2) {
                        tableData.sid = tdValue
                    }
                    if (tdIndex == 3) {
                        tableData.name = tdValue
                    }
                    if (tdIndex == 4) {
                        tableData.price = tdValue;
                    }
                    if (tdIndex == 5) {
                        tableData.num = tdValue
                    }
                    if (tdIndex == 6) {
                        tableData.type = tdValue
                    }
                    if (tdIndex == 7) {
                        tableData.stock_info_id = tdValue
                    }
                    if (tdIndex == 8) {
                        tableData.note = tdValue
                    }
                });
                saveData.push(tableData);//将每一行的数据存入
            });
            return saveData;
        }

        function isValid() {
            if (form1.title.value == "") {
                LW.message.show("请输入标题");
                return false;
            }
            if (form1.uid.value == 0) {
                LW.message.show("请选择申请人员");
                return false;
            }
            if (form1.address.value == "") {
                LW.message.show("请填写地址");
                return false;
            }
            else {
                checkItem();
            }

        }

        function checkItem() {
            if ($("#item").find("tr").length == 0) {
                LW.message.confirm("id", "还未添加明细，确认要提交吗？", function (r) {
                    if (r) {
                        submitData();
                    } else {
                        return false;
                    }
                })
            } else {
                submitData();
            }

        }

        function submitData() {
            var data = saveTable("table");
            var json = JSON.stringify(data).toString();
            $.ajax({
                url: '/manage/crmpurchacseitem/add',
                type: 'POST',
                dateType: 'json',
                data: {
                    data: json,
                    crmPurchacse: JSON.stringify($('#form1').serializeObject()),
                },
                error: function (data) {
                    console.log(data);
                    LW.message.show("保存失败!");
                },
                success: function (data) {
                    console.log(data);
                    LW.message.show("保存成功!");
                    window.location.href = "/manage/crmpurchacse.html";
                }
            });
        }

        $.fn.serializeObject = function () {
            var o = {};
            var a = this.serializeArray();
            $.each(a, function () {
                if (o[this.name]) {
                    if (!o[this.name].push) {
                        o[this.name] = [o[this.name]];
                    }
                    o[this.name].push(this.value || '');
                } else {
                    o[this.name] = this.value || '';
                }
            });
            return o;
        };
    </script>
</head>
<body>
<%@ include file="../top.jsp" %>
<%@ include file="../left.jsp" %>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="<%=basePath%>manage/index.html">首页</a></li>
        <li><a href="<%=basePath%>manage/crmpurchacseitem.html">采购明细列表</a></li>
        <li>添加明细</li>
    </ul>
</div>
<div class="rightContainer">
    <form class="form-horizontal" role="form" method="post" action="<%=basePath%>manage/crmpurchacse/post.html"
          id="form1" name="form1">
        <%
            SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
            Date now = new Date();
        %>
        <input type="hidden" name="date" id="date"
               value="<%=sdf.format(now)%>">
        <div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse"
             data-parent="#accordion" href="#panelInfo">新增采购订单
        </div>
        <div id="panelInfo" class="panel-collapse collapse in">
            <div class="panel-body">
                <table class="table table-bordered">
                    <tr>
                        <td class="info col-md-1 text-right"><span class="red">*</span>采购编号:</td>
                        <td class="col-md-11"><label class="form-control  text-left" id="label">${number}</label></td>
                        <input type="hidden" name="number" id="number" value="${number}">
                    </tr>
                    <tr>
                        <td class="info col-md-1 text-right"><span class="red">*</span>标题:</td>
                        <td class="col-md-11">
                            <input type="text" class="form-control" name="title" id="title" value="" maxlength="50"
                                   nullmsg="标题不能为空" placeholder="请输入标题" autocomplete="off" datatype="*1-50"
                                   errormsg="至少1个字符,最多50个字符！">
                        </td>
                    </tr>
                    <tr>
                        <td class="info col-md-1 text-right"><span class="red">*</span>申请人员:</td>
                        <td class="col-md-11">
                            <select
                                    class="form-control" name="uid" id="uid">
                                <option value="0" selected="selected">请选择申请人</option>
                                <%
                                    for (int i = 0; i < crmUserList.size(); i++) {
                                %>
                                <option value="<%=crmUserList.get(i).getId()%>">
                                    <%=crmUserList.get(i).getUser()%>
                                </option>
                                <%
                                    }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="info col-md-1 text-right"><span class="red">*</span>地址:</td>
                        <td class="col-md-11">
                            <input type="text" class="form-control" style="text-align: left;" name="address"
                                   id="address" maxlength="20" nullmsg="地址不能为空" placeholder="请填写地址"
                                   autocomplete="off" datatype="*1-20" errormsg="至少1个字符,最多20个字符!"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="info col-md-1 text-right">备注:</td>
                        <td class="col-md-11">
                            <textarea name="note" class="form-control" rows="5" cols="50" maxlength="50"
                                      datatype="*0-50" placeholder="50个汉字以内"></textarea>
                        </td>
                    </tr>
                </table>
                <div class="alert alert-warning alert-dismissible" role="alert" style="display:none;" id="alert">
                    <button type="button" class="close" data-dismiss="alert"><span
                            aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <strong>系统提示</strong> <span id="savemsg"></span>
                </div>
                <br/>
            </div>
        </div>
    </form>
    <div class="col-md-12 text-center" style="margin-bottom: 15px;">
        <button type="button" class="btn btn-primary btn-lg" onclick="isValid(this);">保 存</button>
        <button class="btn btn-danger btn-lg" data-toggle="modal" id="add"
                data-target="#myModal">添加明细
        </button>
    </div>
    <%-- 明细列表 --%>
    <table fit="true" fitColumns="true" class="table table-striped table-hover table-bordered" id="table">
        <thead>
        <tr id="bar" style="display: none;">
            <th>序号</th>
            <th>采购编号</th>
            <th>供应商ID</th>
            <th>产品名称</th>
            <th>采购产品单价</th>
            <th>采购数量</th>
            <th>类型</th>
            <th>仓库id</th>
            <th>备注</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="item"></tbody>
    </table>
</div>
<div class="cls"></div>

<!-- 模态框（Modal） -->
<div class="modal fade " id="myModal" tabindex="-1" role="dialog" data-backdrop="false"
     aria-labelledby="myModalLabelAdd" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content"><!--  style="width:800px; height: 550px;" -->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">&times;
                </button>
                <h4 class="modal-title" id="myModalLabelAdd"
                    style="text-align: center;">添加明细</h4>
            </div>
            <div class="modal-body">
                <div class="nav">
                    <table class="table" id="tableitem">
                        <tr>
                            <td class="info col-md-2 text-right"><span class="red">*</span>采购编号:</td>
                            <td class="col-md-10">
                                <label class="form-control" id="numberitem" style="text-align: left;">${number}</label>
                                <input type="hidden" name="number" id="itemNumber" value=""/>
                            </td>
                        </tr>
                        <tr>
                            <td class="info col-md-2 text-right">产品名称:</td>
                            <td class="col-md-10" colspan="2">
                                <div class="search">
                                    <input type="text" name="name" class="form-control" id="nameitem" value=""
                                           autocomplete="off"
                                           nullmsg="请输入名称" placeholder="搜索名称">
                                    <div id="auto_div"></div>
                                </div>
                            </td>
                        </tr>
                        <div class="stockitem" id="stockitem">
                        </div>
                        <tr>
                            <td class="info col-md-2 text-right">单价:</td>
                            <td class="col-md-10">
                                <input type="text" class="form-control" id="priceitem" name="price" value=""
                                       maxlength="50" placeholder="请输入采购产品单价" autocomplete="off" disabled>
                            </td>
                        </tr>
                        <tr>
                            <td class="info col-md-2 text-right">采购数量:</td>
                            <td class="col-md-10">
                                <input type="number" step="1" class="form-control" id="numitem" name="num" value=""
                                       maxlength="50"
                                       placeholder="请输入采购数量" autocomplete="off"
                                       onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                                         
                                           onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'0')}else{this.value=this.value.replace(/\D/g,'')}">
                            </td>
                        </tr>
                        <tr>
                            <td class="info col-md-1 text-right"><span class="red">*</span>供应商名称:</td>
                            <td class="col-md-11">
                                <select class="form-control" name="sid" id="siditem" disabled>
                                    <option value="0" selected="selected">请选择供应商</option>
                                    <!--动态从数据库查数据并组合成option  -->
                                    <%
                                        for (int i = 0; i < crmSupplierList.size(); i++) {
                                    %>
                                    <option value="<%=crmSupplierList.get(i).getId()%>">
                                        <%=crmSupplierList.get(i).getSupplier()%>
                                    </option>
                                    <%
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="info col-md-2 text-right">类型:</td>
                            <td class="col-md-10">
                                <select name="type" class="form-control" id="typeitem" required datatype="select"
                                        disabled>
                                    <option value="0" selected="selected">请选择类型</option>
                                    <% for (int i = 0; i < crmNameList.size(); i++) { %>
                                    <option value="<%=crmNameList.get(i).getId() %>">
                                        <%=crmNameList.get(i).getName() %>
                                    </option>
                                    <% } %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="info col-md-2 text-right">仓库id:</td>
                            <td class="col-md-10">
                                <input type="number" class="form-control" id="stockinfoiditem" name="stock_info_id"
                                       value="" maxlength="2" placeholder="请输入仓库id" autocomplete="off">
                            </td>
                        </tr>
                        <tr>
                            <td class="info col-md-2 text-right">备注:</td>
                            <td class="col-md-10">
                                <input type="text" class="form-control" id="noteitem" name="note" value=""
                                       maxlength="50" placeholder="请输入备注" autocomplete="off">
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="modal-footer" style="text-align: center">
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    关闭
                </button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" id="submititem">
                    提交
                </button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal -->
</div>
<!--编辑 弹出的modal  -->
<div class="modal fade " id="myModaledit" tabindex="-1" role="dialog" data-backdrop="false"
     aria-labelledby="myModalLabelEdit" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">&times;
                </button>
                <h4 class="modal-title" id="myModalLabelEdit"
                    style="text-align: center;">编辑明细</h4>
            </div>
            <div class="modal-body">
                <div class="nav">
                    <table class="table">
                        <tr>
                            <td class="info col-md-2 text-right"><span class="red">*</span>采购编号:</td>
                            <td class="col-md-10">
                                <label class="form-control" id="editnumber" style="text-align: left;">${number}</label>
                                <input type="hidden" name="number" id="numberedit" value=""/>
                            </td>
                        </tr>
                        <tr>
                            <td class="info col-md-2 text-right">采购数量:</td>
                            <td class="col-md-10">
                                <input type="text" class="form-control" id="numedit" name="num" value="" maxlength="50"
                                       placeholder="请输入采购数量" autocomplete="off">
                            </td>
                        </tr>
                        <tr>
                            <td class="info col-md-1 text-right"><span class="red">*</span>供应商名称:</td>
                            <td class="col-md-11">
                                <select
                                        class="form-control" name="sid" id="sidedit">
                                    <option value="0" selected="selected">请选择供应商</option>
                                    <!--动态从数据库查数据并组合成option  -->
                                    <%
                                        for (int i = 0; i < crmSupplierList.size(); i++) {
                                    %>
                                    <option value="<%=crmSupplierList.get(i).getId()%>">
                                        <%=crmSupplierList.get(i).getSupplier()%>
                                    </option>
                                    <%
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="info col-md-2 text-right">标题:</td>
                            <td class="col-md-10">
                                <input type="text" class="form-control" id="titleedit" name="title" value=""
                                       maxlength="50" placeholder="请输入标题" autocomplete="off">
                            </td>
                        </tr>
                        <tr>
                            <td class="info col-md-2 text-right">产品名称:</td>
                            <td class="col-md-10">
                                <input type="text" class="form-control" id="nameedit" name="name" value=""
                                       maxlength="50" placeholder="请输入产品名称" autocomplete="off">
                            </td>
                        </tr>
                        <tr>
                            <td class="info col-md-2 text-right">采购产品单价:</td>
                            <td class="col-md-10">
                                <input type="text" class="form-control" id="priceedit" name="price" value=""
                                       maxlength="50" placeholder="请输入采购产品单价" autocomplete="off">
                            </td>
                        </tr>
                        <tr>
                            <td class="info col-md-2 text-right">类型:</td>
                            <td class="col-md-10">
                                <select class="form-control" id="typeedit" name="type">
                                    <option value="0">选择产品类型</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="info col-md-2 text-right">仓库id:</td>
                            <td class="col-md-10">
                                <input type="text" class="form-control" id="stockinfoidedit" name="stock_info_id"
                                       value="" maxlength="50" placeholder="请输入仓库id" autocomplete="off">
                            </td>
                        </tr>
                        <tr>
                            <td class="info col-md-2 text-right">备注:</td>
                            <td class="col-md-10">
                                <input type="text" class="form-control" id="noteedit" name="note" value=""
                                       maxlength="50" placeholder="请输入备注" autocomplete="off">
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="modal-footer" style="text-align: center">
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    关闭
                </button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" id="edit">
                    提交
                </button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
</div>
<script type="text/javascript">
    //拖动
    $(document).on("show.bs.modal", ".modal", function () {
        $(this).draggable({
            //handle: ".modal-header"
        });
        $(this).css("overflow", "hidden");
    });
</script>
<script type="text/javascript">
    $(function () {
        $("#itemNumber").val($("#numberitem").text());
        if (sessionStorage.length > 0) {
            for (var i = 1; i <= sessionStorage.length; i++) {
                var objAfter = JSON.parse(sessionStorage.getItem("item" + i));
                if (objAfter != null) {
                    $("#bar").show();
                    var result = "";
                    result += "<tr id='item" + i + "'>";
                    result += "<td id='iTable" + i + "'>" + i + "</td>";
                    result += "<td id='numberTable" + i + "'>" + objAfter.itemNumber + "</td>";
                    result += "<td id='sidTable" + i + "'>" + objAfter.siditem + "</td>";
                    result += "<td id='nameTable" + i + "'>" + objAfter.nameitem + "</td>";
                    result += "<td id='priceTable" + i + "'>" + objAfter.priceitem + "</td>";
                    result += "<td id='numTable" + i + "'>" + objAfter.numitem + "</td>";
                    result += "<td id='typeTable" + i + "'>" + objAfter.typeitem + "</td>";
                    result += "<td id='stockinfoidTable" + i + "'>" + objAfter.stockinfoiditem + "</td>";
                    result += "<td id='noteTable" + i + "'>" + objAfter.noteitem + "</td>";
                    result += "<td>";
                    result += "<a href='javascript:void(0)' data-toggle='modal' data-target='#myModaledit' onclick='editmodal(" + i + ")'>编辑&nbsp;</a>";
                    result += "<a href='javascript:void(0)' onclick='del(" + i + ")'>删除</a>";
                    result += "</td>";
                    result += "</tr>";
                    $("#item").append(result);
                }
            }
        }
    });
    $("#submititem").click(function () {
        var i = sessionStorage.length == 0 ? 1 : sessionStorage.length + 1;
        var key = true;
        if ($("#numberitem").text() == "") {
            LW.message.show("采购编号不能为空");
            key = false;
            return false;
        }
        if ($("#nameitem").val() == "") {
            LW.message.show("请选择产品名称");
            $("#nameitem").select();
            key = false;
            return false;
        }
        if ($("#siditem").val() == 0) {
            LW.message.show("产品名称信息有误，请重新选择");
            key = false;
            $("#nameitem").select();
            return false;
        }
        if ($("#priceitem").val() == "") {
            LW.message.show("产品名称信息有误，请重新选择");
            key = false;
            $("#nameitem").select();
            return false;
        }
        if ($("#typeitem").val() == 0) {
            LW.message.show("产品名称信息有误，请重新选择");
            key = false;
            $("#nameitem").select();
            return false;
        }
        if ($("#stockinfoiditem").val() == "") {
            LW.message.show("请输入仓库id");
            key = false;
            return false;
        }
        if (key) {
            var item = {
                i: i,
                itemNumber: $('#numberitem').text(),
                siditem: $('#siditem').val(),
                nameitem: $('#nameitem').val(),
                priceitem: $('#priceitem').val(),
                numitem: $('#numitem').val(),
                typeitem: $('#typeitem').val(),
                stockinfoiditem: $('#stockinfoiditem').val(),
                noteitem: $('#noteitem').val()
            }
            storageObj(item, "item" + i);
            var objAfter = JSON.parse(sessionStorage.getItem("item" + i));
            var result = "";
            result += "<tr id='item" + i + "'>";
            result += "<td id='iTable" + i + "'>" + i + "</td>";
            result += "<td id='numberTable" + i + "'>" + objAfter.itemNumber + "</td>";
            result += "<td id='sidTable" + i + "'>" + objAfter.siditem + "</td>";
            result += "<td id='nameTable" + i + "'>" + objAfter.nameitem + "</td>";
            result += "<td id='priceTable" + i + "'>" + objAfter.priceitem + "</td>";
            result += "<td id='numTable" + i + "'>" + objAfter.numitem + "</td>";
            result += "<td id='typeTable" + i + "'>" + objAfter.typeitem + "</td>";
            result += "<td id='stockinfoidTable" + i + "'>" + objAfter.stockinfoiditem + "</td>";
            result += "<td id='noteTable" + i + "'>" + objAfter.noteitem + "</td>";
            result += "<td>";
            result += "<a href='javascript:void(0)' data-toggle='modal' data-target='#myModaledit' onclick='editmodal(" + i + ")'>编辑&nbsp;</a>";
            result += "<a href='javascript:void(0)' onclick='del(" + i + ")'>删除</a>";
            result += "</td>";
            result += "</tr>";
            i = Number(i + 1);
            $("#bar").show();
            $("#item").append(result);
            $("#tableitem input").val("");
            $("#tableitem select").val(0);
        }
    });

    $("#nameitem").keydown(function () {
        $("#priceitem").val("");
        $("#siditem").val("");
        $("#typeitem").val("");
        $("#numitem").val("");
    })

    function storageObj(obj, key) {
        var checkedIdStr = JSON.stringify(obj);
        sessionStorage.setItem(key, checkedIdStr);
    };

    function del(i) {
        LW.message.confirm("i", "您确认要继续删除吗?", function (r) {
            if (r) {
                var objAfter = JSON.parse(sessionStorage.getItem('item' + Number(i + 1)));
                sessionStorage.removeItem('item' + i);
                sessionStorage.setItem('item' + i, null);
                $("#item" + i).remove();
                LW.message.show("删除成功！");
            }
        });
    }
</script>
<script type="text/javascript">
    function editmodal(i) {
        $("#numedit").val($("#numTable" + i).text());
        $("#sidedit").val($("#sidTable" + i).text());
        $("#numedit").val($("#numTable" + i).text());
        $("#titleedit").val($("#titleTable" + i).text());
        $("#nameedit").val($("#nameTable" + i).text());
        $("#priceedit").val($("#priceTable" + i).text());
        $("#typeedit").val($("#typeTable" + i).text());
        $("#stockinfoidedit").val($("#stockinfoidTable" + i).text());
        $("#noteedit").val($("#noteTable" + i).text());

        $("#edit").click(function () {
            var key = true;
            if ($("#numedit").val() == "") {
                LW.message.show("请输入数量");
                key = false;
                return false;
            }
            if ($("#sidedit").val() == 0) {
                LW.message.show("请选择供应商");
                key = false;
                return false;
            }
            if ($("#titleedit").val() == "") {
                LW.message.show("请输入标题");
                key = false;
                return false;
            }
            if ($("#nameedit").val() == "") {
                LW.message.show("请输入产品名称");
                key = false;
                return false;
            }
            if ($("#priceedit").val() == "") {
                LW.message.show("请输入产品单价");
                key = false;
                return false;
            }
            if ($("#typeedit").val() == 0) {
                LW.message.show("请输入产品类型");
                key = false;
                return false;
            }
            if ($("#stockinfoidedit").val() == "") {
                LW.message.show("请输入仓库id");
                key = false;
                return false;
            }
            if ($("#noteedit").val() == "") {
                LW.message.show("请输入备注");
                key = false;
                return false;
            }
            if (key) {
                $("#numTable" + i).text($("#numedit").val());
                $("#sidTable" + i).text($("#sidedit").val());
                $("#numTable" + i).text($("#numedit").val());
                $("#titleTable" + i).text($("#titleedit").val());
                $("#nameTable" + i).text($("#nameedit").val());
                $("#priceTable" + i).text($("#priceedit").val());
                $("#typeTable" + i).text($("#typeedit").val());
                $("#stockinfoidTable" + i).text($("#stockinfoidedit").val());
                $("#noteTable" + i).text($("#noteedit").val());
            }
        });
    }
</script>
<script type="text/javascript">
    var name_list = [];
    var price_list = [];
    var type_list = [];
    var sid_list = [];

    //只请求一次
    var key = false;
    $("#add").click(function () {

        $("#nameitem").click(function () {
            var width = $(".search").width() - 7;
            $("#auto_div").css("width", width + "px");
        });
        if (!key) {
            $.ajax({
                url: "/manage/crmsupplierprice/getsupplierpricelist",
                type: "POST",
                error: function () {
                    LW.message.show("查询失败，请重新输入");
                    $("#nameitem").val("");
                    $("#nameitem").select();
                },
                success: function (data) {
                    if (data.code != 404) {
                        for (var i = 0; i < data.msg.length; i++) {
                            name_list.push(data.msg[i].name);
                            price_list.push(data.msg[i].price);
                            type_list.push(data.msg[i].type);
                            sid_list.push(data.msg[i].sid);
                        }
                        /* console.log(title_list);
                        console.log(price_list);
                        console.log(type_list); */
                    }
                    else {
                        name_list.push("没有找到数据记录");
                    }
                }
            });
        }
        key = true;
    });
    var old_value = "";
    var highlightindex = -1;

    function AutoComplete(auto, search, myname_list, myprice_list, mytype_list, mysid_list) {
        if ($("#" + search).val() != old_value || old_value == "") {
            var autoNode = $("#" + auto);   //缓存对象（弹出框）

            var namelist = new Array();
            var pricelist = new Array();
            var typelist = new Array();
            var sidlist = new Array();
            var n = 0;
            var j = 0;
            var k = 0;
            var m = 0;
            old_value = $("#" + search).val();
            for (i in myname_list) {
                if (myname_list[i].indexOf(old_value) >= 0) {
                    namelist[n++] = myname_list[i];
                    pricelist[j++] = myprice_list[i];
                    typelist[k++] = mytype_list[i];
                    sidlist[m++] = mysid_list[i];
                }
            }
            if (namelist.length == 0) {

                //autoNode.hide();
                autoNode.empty();
                var result = "";
                result += "<p style='text-align: center;font-size: 13px; margin-top: 15px;' >";
                result += "没有找到数据记录";
                result += "</p>";
                $("#auto_div").html(result);
                return;
            }
            autoNode.empty();
            for (i in namelist) {
                var wordNode = namelist[i];
                var priceNode = pricelist[i];
                var typeNode = typelist[i];
                var sidNode = sidlist[i];
                var newDivNode = $("<div>").attr("id", i).attr("data-price", priceNode).attr("data-type", typeNode).attr("data-sid", sidNode);    //设置每个节点的id值
                newDivNode.attr("style", "font:14px/25px arial;height:30px;padding:0 8px;cursor: pointer;");
                newDivNode.html(wordNode).appendTo(autoNode);
                newDivNode.mouseover(function () {
                    if (highlightindex != -1) {
                        autoNode.children("div").eq(highlightindex).css("background-color", "white");
                    }
                    highlightindex = $(this).attr("id");
                    $(this).css("background-color", "#ebebeb");
                });
                newDivNode.mouseout(function () {
                    $(this).css("background-color", "white");
                });
                newDivNode.click(function () {
                    var nameText = autoNode.hide().children("div").eq(highlightindex).text();
                    var priceText = autoNode.hide().children("div").eq(highlightindex).attr("data-price");
                    var typeText = autoNode.hide().children("div").eq(highlightindex).attr("data-type");
                    var sidText = autoNode.hide().children("div").eq(highlightindex).attr("data-sid");
                    highlightindex = -1;
                    $("#" + search).val(nameText);
                    $("#priceitem").val(priceText);
                    $("#typeitem").val(typeText);
                    $("#siditem").val(sidText);
                    $("#numitem").select();
                })
                if (namelist.length > 0) {
                    autoNode.show();
                }
                else {
                    autoNode.show();
                    var result = "";
                    result += "<p style='text-align: center;font-size: 13px; margin-top: 15px;' >";
                    result += "没有找到数据记录";
                    result += "</p>";
                    $("#auto_div").html(result);
                    highlightindex = -1;
                }
            }
        }
        document.onclick = function (e) {
            var e = e ? e : window.event;
            var tar = e.srcElement || e.target;
            if (tar.id != search) {
                if ($("#" + auto).is(":visible")) {
                    $("#" + auto).css("display", "none")
                }
            }
        }
    }

    $(function () {
        old_value = $("#nameitem").val();
        $("#nameitem").focus(function () {
            if ($("#nameitem").val() == "") {
                AutoComplete("auto_div", "nameitem", name_list, price_list, type_list, sid_list);

            }
        });
        $("#nameitem").keyup(function () {
            AutoComplete("auto_div", "nameitem", name_list, price_list, type_list, sid_list);
        });
    });
</script>
<style type="text/css">
    .search {
        left: 0;
        position: relative;
    }

    #auto_div {
        width: 450px;
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
<%@ include file="../foot.jsp" %>
</body>
</html>