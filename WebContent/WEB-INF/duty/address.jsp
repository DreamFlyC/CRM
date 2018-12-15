<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/toa_duty/css/bootstrap.min.css" rel="stylesheet" />

<script type="text/javascript">
$(function () {


    //默认绑定省
    ProviceBind();
    //绑定事件
    $("#Province").change( function () {
        CityBind();
    })
    
    $("#City").change(function () {
        VillageBind();
    })
   
   


})
function Bind(str) {
    LW.message.show($("#Province").html());
    $("#Province").val(str);


}
function ProviceBind() {
    //清空下拉数据
    $("#Province").html("");




    var str = "<option>==请选择===</option>";
    $.ajax({
        type: "POST",
        url: "/Home/GetAddress",
        data: { "parentiD": "", "MyColums": "Province" },
        dataType: "JSON",
        async: false,
        success: function (data) {
            //从服务器获取数据进行绑定
            $.each(data.Data, function (i, item) {
                str += "<option value=" + item.Id + ">" + item.MyTexts + "</option>";
            })
            //将数据添加到省份这个下拉框里面
            $("#Province").append(str);
        },
        error: function () { LW.message.show("Error"); }
    });


   
        
}
function CityBind() {


    var provice = $("#Province").attr("value");
    //判断省份这个下拉框选中的值是否为空
    if (provice == "") {
        return;
    }
    $("#City").html("");
    var str = "<option>==请选择===</option>";


    $.ajax({
        type: "POST",
        url: "/Home/GetAddress",
        data: { "parentiD": provice, "MyColums": "City" },
        dataType: "JSON",
        async: false,
        success: function (data) {
            //从服务器获取数据进行绑定
            $.each(data.Data, function (i, item) {
                str += "<option value=" + item.Id + ">" + item.MyTexts + "</option>";
            })
            //将数据添加到省份这个下拉框里面
            $("#City").append(str);
        },
        error: function () { LW.message.show("Error"); }
    });


}
function VillageBind() {


    var provice = $("#City").attr("value");
    //判断市这个下拉框选中的值是否为空
    if (provice == "") {
        return;
    }
    $("#Village").html("");
    var str = "<option>==请选择===</option>";
    //将市的ID拿到数据库进行查询，查询出他的下级进行绑定
    $.ajax({
        type: "POST",
        url: "/Home/GetAddress",
        data: { "parentiD": provice, "MyColums": "Village" },
        dataType: "JSON",
        async: false,
        success: function (data) {
            //从服务器获取数据进行绑定
            $.each(data.Data, function (i, item) {
                str += "<option value=" + item.Id + ">" + item.MyTexts + "</option>";
            })
            //将数据添加到省份这个下拉框里面
            $("#Village").append(str);
        },
        error: function () { LW.message.show("Error"); }
    });
    //$.post("/Home/GetAddress", { parentiD: provice, MyColums: "Village" }, function (data) {  
    //    $.each(data.Data, function (i, item) {
    //        str += "<option value=" + item.Id + ">" + item.MyTexts + "</option>";
    //    })
    //    $("#Village").append(str);
    //})
}
</script>

<title>地址</title>
</head>
<body>
	<div class="form-group">
                <div class="col-sm-2 text-center">
                   省
                </div>
                <div class="col-sm-2">
                    <select class="form-control" name="Province" id="Province">
                        <option>==请选择===</option>
                    </select>


                </div>
                <div class="col-sm-1 text-center">
                   市
                </div>
                <div class="col-sm-2">
                    <select class="form-control" name="City" id="City">
                        <option>==请选择===</option>
                    </select>
                </div>
                <div class="col-sm-1 text-center">
                县/区
                </div>
                <div class="col-sm-2">
                    <select class="form-control" name="Village" id="Village">
                        <option>==请选择===</option>
                    </select>
                </div>
            </div>
</body>
</html>