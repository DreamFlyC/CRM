<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="topContainer">
    <div class="topleft">
    	<a href="<%=basePath %>manage/index.html" target="_parent"><img src="<%=basePath%>resources/images/logo.png" title="系统首页" /></a>
    </div>
    <div class="topright">    
	    <ul>

	    <li><a href="<%=basePath %>manage/logout.html">安全退出(${loginUser.userName})</a></li>
	    </ul>
    </div>
</div>