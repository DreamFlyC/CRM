<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.lang.String" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.UUID" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8;"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
    <%@ include file="../tag.jsp" %>
    <link href="<%=basePath%>resources/duty/css/dutymobile.css" rel="stylesheet" type="text/css"/>
    <title>新建工单</title>

</head>
<body>
<div class="">
    <form class="form-horizontal" role="form" method="get" action="<%=basePath%>duty/save" id="form1" name="form1">
        <input type="hidden" name="ids" id="ids">
        <input type="hidden" name="users" id="users">
        <input type="hidden" name="groupid" id="groupid"/>
        <input type="hidden" value="3" name="dkey"/>
        <%
            SimpleDateFormat sdf = new SimpleDateFormat("YYYYMMddhhmm");
            Date now = new Date();
            int random = (int) (Math.random() * 10000 + 1);
            String number = sdf.format(now) + random;
        %>
        <input type="hidden" name="number" id="number" value="<%=number %>">

        <div class="addheader">
            <a href="javascript:window.history.go(-1)" class="left"><span>返回</span></a>
            <span>新建工单</span>
            <a href="javascript:void(0)" onclick="isValid(this);" class="right"><span>保存</span></a>
            <div>
			 				<textarea row="50" col="5" name="title" id="title" class="addtitle"
                                      required value="" value="" maxlength="50" placeholder="工单名称"
                                      autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！"></textarea>
            </div>
        </div>
        <div class="addcont addmar">
            <span class="text-left">执行部门</span>
            <label id="choosedepart1" class="right adduser" onclick="return false;"
                   data-toggle="modal" data-target="#myModal">请选择部门</label>
        </div>
        <div class="addcont">
            <span class="text-left">执行人</span>
            <label id="choose1" class="right adduser"
                   data-toggle="modal" data-target="#myModalUser">请选择执行人</label>
        </div>

        <div class="addcont addmar">
            <span class="text-left">开始时间</span>
            <input type="text" name="startdate" id="sdate" class="date"
                   data-options="{'type':'YYYY-MM-DD hh:mm','beginYear':2010,'endYear':2088}"
                   placeholder="请选择开始时间"/>
        </div>
        <div class="addcont">
            <span class="text-left">结束时间</span>
            <!-- <span class="right" id="selectedate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})">选择结束时间</span> -->
            <input type="text" name="enddate" id="edate" class="date"
                   data-options="{'type':'YYYY-MM-DD hh:mm','beginYear':2010,'endYear':2088}"
                   placeholder="请选择结束时间"/>
        </div>

        <div class="addcont addmar" style="margin-bottom: 10px;">
            <span class="text-left">优先度</span>
            <div class="select">
                <select name="level" id="level" class="right selectlevel"
                        onchange="getlevel($('#level option:selected').val())">
                    <option value="0" selected="selected">请选择优先级别</option>
                    <option value="1">普通</option>
                    <option value="2">紧急</option>
                </select>
            </div>
        </div>

        <textarea row="50" col="5" name="content" class="addtitle addtext"

                  placeholder="填写描述"></textarea>
    </form>
</div>

<div class="modal fade " id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel" style="text-align:center;font-weight: bold;">
                    添加执行部门
                </h4>
            </div>
            <div class="modal-body">
                <div class="nav">
                    <ul>
                        <li>
                            <div class="allinline">
                                <c:choose>
                                    <c:when test="${shiroActionUsersGroupList.size() <=0}">
                                        <p>没有找到数据记录</p>
                                    </c:when>

                                    <c:otherwise>
                                        <c:forEach items="${shiroActionUsersGroupList}" var="dutyUsersGroup">
                                            <div class="btn btn-default" data-id="${dutyUsersGroup.id}"
                                                 data-name="${dutyUsersGroup.name}" id="s${dutyUsersGroup.id}"
                                                 onclick="addClass(${dutyUsersGroup.id})">${dutyUsersGroup.name}</div>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="modal-footer" style="text-align:center">
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    关闭
                </button>
                <button type="button" class="btn btn-primary" id="savedepart" data-dismiss="modal">
                    确定
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<div class="modal fade " id="myModalUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabelUser"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabelUser" style="text-align:center;font-weight: bold;">
                    添加执行人
                </h4>
            </div>
            <div class="modal-body">
                <div class="nav">
                    <ul>
                        <li class="sdv">
                            <div class="allinline">
                                <div id="showuser" class="showuser"></div>
                            </div>
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
        </div>
    </div>

</div>


</div>
<div class="cls"></div>

<script>
    function addClass(id) {
        //$("li").children(".btn-primary").removeClass("btn-primary sid");
        if ($("#s" + id).hasClass("btn-primary")) {
            $("#s" + id).removeClass("btn-primary sid");
        } else {
            $("#s" + id).addClass("btn-primary sid");
        }
    }

    function addUser(id) {
        if ($("#u" + id).hasClass("btn-primary")) {
            $("#u" + id).removeClass("btn-primary uid");
        } else {
            $("#u" + id).addClass("btn-primary uid");
        }
    }

    $(function () {
        var departId = "";
        $("#savedepart").click(function () {
            departId = "";
            departName = "";
            $(".sid").each(function () {
                departId += $(this).attr("id").substr(1) + ",";
                departName += $(this).data("name") + ",";
            });
            /* console.log(departId);
            console.log(departName); */
            departId = departId.substring(0, departId.length - 1);
            $("#choosedepart1").html(departName.substring(0, departName.length - 1));
            if (departName == null || departName == "") {
                $("#choosedepart1").html("请选择部门");
            }
            $("#choose1").html("请选择执行人");
            $.get("<%=basePath %>duty/getuser?ids=" + departId, function (data) {
                var temp = "";
                for (var m = 0; m < departId.split(',').length; m++) {
                    temp += "<p style='text-align:center;font-size:20px;font-weight:bold;'>";
                    temp += departName.split(',')[m];
                    temp += "</p>";
                    for (var k = 0; k < data.msg.length; k++) {
                        if (data.msg[k].groupid == departId.split(',')[m]) {
                            temp += "<div class=\"btn btn-default\" onclick=\"addUser(" + data.msg[k].id + ")\" id='u" + data.msg[k].id + "' data-id='" + data.msg[k].id + "' data-name='" + data.msg[k].user + "'>";
                            temp += data.msg[k].user;
                            temp += "</div>";
                        }
                    }
                }
                $(".showuser").html(temp);
            });
        });


        $("#saveuser").click(function () {
            uid = "";
            user = "";
            $(".uid").each(function () {
                uid += $(this).data("id") + ",";
                user += $(this).data("name") + ",";
            });
            uid = uid.substring(0, uid.length - 1);
            $("#choose1").html(user.substring(0, user.length - 1));
            if (user == null || user == "") {
                $("#choose1").html("请选择执行人");
            }
        });

        $("#choose1").click(function () {
            if (departId == null || departId == '') {
                var result = "";
                result += "<div style='text-align:center;font-size: 20px;color:red;'>";
                result += "请先选择部门";
                result += "</div>";
                $(".showuser").html(result);
            }
        });

        $("#close").click(function () {
            $("#dv").hide();
        })
    });
</script>
<script type="text/javascript">
    $('#level option:selected').css("color", "#62b900");

    function getlevel(level) {
        if (level == 2) {
            $("#level").css("color", "red");
        }
        if (level == 1) {
            $("#level").css("color", "#62b900");
        }
    }

    function isValid() {
        //$("#sdate").val($("#selectsdate").text());
        var sdate = $("#sdate").val() + ":00";
        $("#sdate").val("");
        $("#sdate").val(sdate);
        var edate = $("#edate").val() + ":00";
        $("#edate").val("");
        $("#edate").val(edate);
        var ids = "";
        var name = "";
        $(".uid").each(function () {
            ids += $(this).data("id") + ",";
            name += $(this).data("name") + ",";
            //console.log(ids+"------------"+name);
        });
        $("#ids").attr("value", ids.substring(0, ids.length - 1));
        $("#users").attr("value", name.substring(0, name.length - 1));

        var groupid = "";
        $(".sid").each(function () {
            groupid += $(this).data("id") + ",";
        });
        if (groupid != "") {
            $("#groupid").attr("value", groupid.substring(0, groupid.length - 1));
        }
        //alert("ids="+$("#ids").val()+"---users="+$("#users").val()+"---groupids="+$("#groupid").val());
        var key = true;
        if (form1.title.value == "") {
            LW.message.show("工单名称不能为空");
            form1.title.select();
            key = false;
            return false;
        }
        if (groupid == "") {
            LW.message.show("请选择部门");
            form1.title.select();
            key = false;
        }
        if (form1.level.value == 0) {
            LW.message.show("工单级别不能为空");
            form1.level.select();
            key = false;
            return false;
        }
        if (form1.startdate.value == "") {
            LW.message.show("工单开始时间不能为空");
            form1.startdate.select();
            key = false;
            return false;
        }
        if (form1.enddate.value == "") {
            LW.message.show("工单结束时间不能为空");
            form1.enddate.select();
            key = false;
            return false;
        }
        if (form1.content.value == "") {
            LW.message.show("工单描述不能为空");
            form1.content.select();
            key = false;
            return false;
        }
        if ($("#edate").val() < $("#sdate").val()) {
            LW.message.show("日期不合法，请重新选择日期!");
            form1.edate.select();
            key = false;
            return false;
        }
        if (key) {
            $("#form1").submit();
        }
    }
</script>
<script type="text/javascript" src="<%=basePath%>resources/duty/js/jquery.date.js"></script>
<script type="text/javascript">
    $.date("#sdate");
    $.date("#edate");
</script>
<script type="text/javascript">
    $("#page_duty_list").parent().attr("class", "active");
    $("#page_duty_list").parent().parent().parent().parent().addClass("in");
    $(function () {
        LW.form.validate("form1");
    });
</script>
</body>
</html>