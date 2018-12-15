<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ajax跨域</title>
<script src="<%=basePath%>resources/js/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript">
	function access(){
		/* $.ajax({
			url:"http://127.0.0.1:8081/traceability/manage/crmstockinoroutlogitem/test",
			type:"GET",
			async:"false",
			dataType:"jsonp",
			jsonCallback:"jsonpCallback",//自定义的jsonp回调函数名,默认为jQuery自动生成的随机函数 
			jsonp:"callback",//传递给请求处理程序或页面的,用以获得jsonp回调函数名的参数名(默认为callback) 
			error:function(data){
				console.log(data);
				console.log("失败");
			},
			success:function(data){
				alert(data);
				console.log("成功");
			}
		}); */
		
		$.ajax({
			url:"http://localhost:8081/traceability/manage/crmstockinoroutlogitem/test",
			type:"GET",
			xhrFields:{
				withCredentials:true
			},
			crossDomain:true,
			error:function(data){
				console.log(data);
				console.log("失败");
			},
			success:function(data){
				alert(data);
				console.log("成功");
			}
		});
	}
</script>
</head>
<body>
	<button onclick="access()">点击</button>
</body>
</html>