<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
<!DOCTYPE html>
<html>
<head>
    <title>上传商品批发价目表</title>
    <meta charset="utf-8" />
	<link rel="stylesheet" href="<%=basePath%>resources/adpic/css/bootstrap.min.css" />
	<link rel="stylesheet" href="<%=basePath%>resources/adpic/css/fileinput.min.css" />
	<script type="text/javascript" src="<%=basePath%>resources/adpic/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>resources/adpic/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>resources/adpic/js/fileinput.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>resources/adpic/js/zh.js"></script>

	<style type="text/css">
		.loading{
			width: 100px;
		    margin: 0px auto;
		    position: fixed;
		    left: 50%;
		    margin-left: -50px;
		    top: 150px;
		    text-align:center;
		    display: none;
		}
	</style>
</head>
<body>
    <div style="width: 50%;margin: 100px auto;position:relative">
    <div class="loadbg">
	    <div class="loading">
	    	<img alt="loading" src="<%=basePath%>resources/adpic/img/loading.gif" style="width:100%;">
	   		<p>上传中</p>
	    </div>
    </div>
   
		<div class="container-fluid" style="">
			<h1 class="text-center">上传商品报价表</h1>
	        <form id="form" action="<%=basePath%>manage/crm/saveupload" method="post" enctype="multipart/form-data">
	           <input type="hidden" name="fileName" id="fileName">
	            <div class="row form-group">
	                <div class="panel panel-primary">
	                    <div class="panel-body">
	                        <div class="">
	                            <input id="input-id1" class="myfile" name="file" accept=".xls,.xlsx" multiple type="file" data-show-caption="true">
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </form>
	    </div>
    </div>
    
    
   		 <script>
	    $(function () {
	        initFileInput("input-id1");
	    })

	    function initFileInput(ctrlName) {
	        var control = $('#' + ctrlName);
	        control.fileinput({
	            language: 'zh', //设置语言
	            uploadUrl: "saveupload", //上传的地址
	            allowedFileExtensions: ['xls','xlsx'],//接收的文件后缀
	            maxFilesNum : 1,//上传最大的文件数量
	            //uploadExtraData:{"id": 1, "fileName":'123.mp3'},
	            uploadAsync: true, //默认异步上传
	            showUpload: true, //是否显示上传按钮
	            showRemove : true, //显示移除按钮
	            showPreview : false, //是否显示预览
	            showCaption: false,//是否显示标题
	            browseClass: "btn btn-primary", //按钮样式
	            dropZoneEnabled: false,//是否显示拖拽区域
	            //minImageWidth: 50, //图片的最小宽度
	            //minImageHeight: 50,//图片的最小高度
	            //maxImageWidth: 1000,//图片的最大宽度
	            //maxImageHeight: 1000,//图片的最大高度
	            maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
	            //minFileCount: 0,
	            maxFileCount: 1, //表示允许同时上传的最大文件个数
	            enctype: 'multipart/form-data',
	            validateInitialCount:true,
	            previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
	            msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",

	        }).on('filepreupload', function(event, data, previewId, index) {     //上传中
	            var form = data.form, files = data.files, extra = data.extra,
	            response = data.response, reader = data.reader;
	            console.log('文件正在上传');
	        }).on("fileuploaded", function (event, data, previewId, index) {    //一个文件上传成功
	        	console.log('文件上传成功！',data.response.obj);
	        	var fileName=data.response.obj;
	        	$("#fileName").val(fileName);
	        	$(".container-fluid").hide();
	        	$(".loading").show();
	        	window.location.href="crmstock_show";
	        	/* httpPost('crm_show', {fileName :fileName}); 
	        	//发送POST请求跳转到指定页面
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
	        	} */
	        	
	        }).on('fileerror', function(event, data, msg) {  //一个文件上传失败
	            console.log('文件上传失败！'+data.id);
	        })
	        //异步上传返回结果处理
	        $('.myfile').on('fileerror', function(event, data, msg) {
	            console.log("fileerror");
	            console.log(data);
	        });
	        //异步上传返回结果处理
	        $(".myfile").on("fileuploaded", function(event, data, previewId, index) {
	            console.log("fileuploaded");
	            var ref = $(this).attr("data-ref");
	            $("input[name='" + ref + "']").val(data.response.url);

	        });

	        //同步上传错误处理
	        $('.myfile').on('filebatchuploaderror', function(event, data, msg) {
	            console.log("filebatchuploaderror");
	            console.log(data);
	        });

	        //同步上传返回结果处理
	        $(".myfile").on("filebatchuploadsuccess",
	                function(event, data, previewId, index) {

	        });

	        //上传前
	        $('.myfile').on('filepreupload', function(event, data, previewId, index) {
	            console.log("filepreupload");
	        });
			}
    </script>
</body>
</html>