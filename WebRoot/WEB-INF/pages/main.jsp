<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<link rel="shortcut icon" href="static/imgs/english.ico" />
<title>英语学习平台</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link type="text/css" rel="stylesheet" href="static/css/bootstrap.css" />
<style type="text/css">
body {
	font-family: Microsoft YaHei;
	background: #F2F2F2 !important;
}

.left {
	width: 15%;
	margin-left: 30px;
}

.left li {
	text-align: center;
	width: 100%;
	background: #f1e7d6;
}

.li:hover {
	background: #dadada;
}

.left li a {
	text-decoration: none;
	color: #214761;
}

.active1 {
	background: #214761 !important;
}

.active1 a {
	color: white !important;
}

#navContent {
	border-radius: 4px;
	border: 1px solid #ddd;
	padding: 20px;
	width: 80%;
	height: 600px;
	background: white;
	margin-right: 30px;
	position: relative;
}

.top {
	height: 100px;
	background-color: #F2F2F2;
	color: #000;
	padding-top: 15px;
}

a {
	cursor: pointer;
}

.pagination {
	position: absolute;
	bottom: 10px;
	left: 40%;
}

.jilu {
	position: absolute;
	right: 10px;
	bottom: 10px;
}

.title {
	margin-left: 220px;
	color: #000;
	font-size: 50px;
}

.pull-right {
	float: right;
}
</style>
</head>


<body>
	<div class="top">
		<a><img src="static/imgs/logo1.png"
			style="width: 300px; height: 80px; margin-top: -40px;"></a> <span
			class="title" align="center">英语在线学习平台</span> <a style="margin: 20px;"
			class="pull-right" href="user/logout"><button type="button"
				class="btn btn-sm btn-danger">退出登录</button></a> <span class="pull-right"
			style="margin: 20px;"><b> 欢 迎 您 ：</b><span style="color: red;">
				${username }</span><br>
		<b>用户角色：</b><span style="color: red;">${role }</span><br>
	</div>
	<div class="left pull-left">

		<ul class="list-group" id="nav">
			<!--     	<li class="list-group-item li1" ><b>教学资料</b></li> -->
			<li class="list-group-item li" id="datalist"><a
				target="data/list">资料列表</a></li>
			<c:if test="${role ne 'student' }">
				<li class="list-group-item li"><a target="././data_upload">资料上传</a></li>
			</c:if>
		</ul>
		<ul class="list-group" id="nav">
			<!-- 	<li class="list-group-item" ><b>英语视频</b></li> -->
			<li class="list-group-item li" id="videolist"><a
				target="video/list">视频列表</a></li>
			<c:if test="${role ne 'student' }">
				<li class="list-group-item li"><a target="././video_upload">视频上传</a></li>
			</c:if>
		</ul>
		<ul class="list-group" id="nav">
			<!--  	<li class="list-group-item" ><b>英语听力</b></li> -->
			<li class="list-group-item li" id="audiolist"><a
				target="audio/list">听力列表</a></li>
			<c:if test="${role ne 'student' }">
				<li class="list-group-item li"><a target="././audio_upload">听力上传</a></li>
			</c:if>
		</ul>
		<ul class="list-group" id="nav">
			<!-- <li class="list-group-item" ><b>试题资料</b></li> -->
			<li class="list-group-item li" id="testlist"><a
				target="test/list">试题列表</a></li>
			<c:if test="${role ne 'student' }">
				<li class="list-group-item li"><a target="././test_upload">试题上传</a></li>
			</c:if>
		</ul>
		<c:if test="${role eq 'admin' }">
			<ul class="list-group" id="nav">
				<!-- 	<li class="list-group-item" ><b>用户管理</b></li> -->
				<li class="list-group-item li" id="studentlist"><a
					target="user/list?role=student">学生管理</a></li>
				<li class="list-group-item li" id="teacherlist"><a
					target="user/list?role=teacher">教师管理</a></li>

				<li class="list-group-item li"><a target="././user_add">用户添加</a></li>
			</ul>
		</c:if>
		<ul class="list-group" id="nav">
			<!-- 	<li class="list-group-item" ><b>论坛系统</b></li> -->
			<li class="list-group-item li" id="forumlist"><a
				target="forum/list">论坛</a></li>
			<li class="list-group-item li"><a target="././forum_add">发表帖子</a></li>
		</ul>
	</div>
	<div id="navContent" class="pull-right"></div>
</body>
<script type="text/javascript" src="static/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
  	$(function(){
  		$("#datalist").addClass("active1");
  		 $.get("data/list",function(data){
                $("#navContent").html(data);
            });
       // $.get('Ajax.html',function(data){
      //      $("#navContent").html(data);
      //  });   //初始化页面显示
        $("#nav .li").click(function(){
            var current = $(this);
            target = current.find('a').attr('target');   //找到a的链接
            $(".li").removeClass("active1");
            current.addClass("active1");
            $.get(target,function(data){
                $("#navContent").html(data);
            });
        });
    });
  </script>
</html>
