<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<link rel="shortcut icon" href="static/imgs/english.ico" />

<title>登录</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="static/css/login.css" rel="stylesheet" rev="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="static/js/jQuery1.7.js"></script>
<script type="text/javascript" src="static/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="static/js/jquery1.42.min.js"></script>
<script type="text/javascript" src="static/js/jquery.SuperSlide.js"></script>
<script type="text/javascript" src="static/js/Validform_v5.3.2_min.js"></script>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link type="text/css" rel="stylesheet" href="static/css/bootstrap.css" />
<link type="text/css" rel="stylesheet" href="static/css/login.css" />
<style type="text/css">
.panel-info>.panel-heading {
	background-color: #F7FCD6;
	color: #000000;
	border-color: #EFF0F4;
}

.panel-welcome {
	font-size:30px;
	color: #DE4B12;
	border-color: #214761;
	margin-top:-30px;
	margin-bottom:30px;
}


.panel-info {
	border-color: #EFF0F4;
	
	opacity:0.8;
}

</style>
<script type="text/javascript">
$(document).ready(function(){
	var $tab_li = $('#tab ul li');
	$tab_li.hover(function(){
		$(this).addClass('selected').siblings().removeClass('selected');
		var index = $tab_li.index(this);
		$('div.tab_box > div').eq(index).show().siblings().hide();
	});	
});
</script>
<script type="text/javascript">
	$(function() {
		$(".screenbg ul li").each(function() {
			$(this).css("opacity", "0");
		});
		$(".screenbg ul li:first").css("opacity", "0.5");
		var index = 0;
		var t;
		var li = $(".screenbg ul li");
		var number = li.size();
		function change(index) {
			li.css("visibility", "visible");
			li.eq(index).siblings().animate({
				opacity : 0
			}, 3000);
			li.eq(index).animate({
				opacity : 0.5
			}, 3000);
		}
		function show() {
			index = index + 1;
			if (index <= number - 1) {
				change(index);
			} else {
				index = 0;
				change(index);
			}
		}
		t = setInterval(show, 8000);
		//根据窗口宽度生成图片宽度
		var width = $(window).width();
		$(".screenbg ul img").css("width", width + "px");
	});
</script>
</head>

<body>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="container" >
	<div class="col-sm-4"></div>
		<div class="col-sm-4"><div class="panel-welcome">欢迎来到英语学习平台</div></div>
		<div class="col-sm-4">
	
			<div class="panel panel-info">
			
				<div class="panel-heading" align="center">用户登录</div>
				<div class="panel-body">
					<form action="">
						<div class="form-group">
							<label for="username">用户名</label>&#12288&#12288&#12288&#12288&#12288&#12288<span
								id="unerr" class="text-danger"></span> <input
								class="form-control" id="username" type="text"
								placeholder="请输入用户名" name="username">
						</div>
						<div class="form-group">
							<label for="password">密码</label>&#12288&#12288&#12288&#12288&#12288&#12288<span
								id="pwerr" class="text-danger"></span> <input
								class="form-control" id="password" type="password"
								placeholder="请输入密码" name="password">
						</div>
						<div class="form-group">
							<label for="role">角色</label>&#12288&#12288&#12288&#12288<span
								id="roerr" class="text-danger"></span> <select
								class="form-control" name="role" id="role">
								<option value="">请选择角色</option>
								<option value="student">学生</option>
								<option value="teacher">教师</option>
								<option value="admin">管理员</option>
							</select>
						</div>
						<div class="form-group" style="height: 59px;">
							<div class="col-sm-8 row">
								<label for="verifyCode">验证码</label>&#12288&#12288&#12288&#12288<span
									id="vcerr" class="text-danger"></span> <input
									class="form-control" type="text" onchange="yanzheng()"
									id="verifyCode" placeholder="请输入验证码" name="verifyCode">
							</div>
							<div class="col-sm-4">
								<img style="margin-top: 28px; margin-left: 15px" title="看不清换一张" id="vcimg"
									onclick="change()" src="ve/getVerifyCode">
							</div>
						</div>
						<div>
							<label><input id="rem" name="rem" type="checkbox">记住我</label>
						</div>

						<input class="btn btn-primary btn-block" type="button"
							onclick="login()" value="登录">
					</form>
				</div>
			</div>
			<div class="bottom">
				©2019 EnglishLearning <a href="javascript:;" target="_blank">关于</a> 
				 <a href="https://www.wtu.edu.cn/" title="武汉纺织大学" target="_blank">武汉纺织大学</a>
			</div>
			<div class="screenbg">
				<ul>
					<li><a href="javascript:;"><img src="static/imgs/0.jpg"></a></li>
					<li><a href="javascript:;"><img src="static/imgs/1.jpg"></a></li>
					<li><a href="javascript:;"><img src="static/imgs/2.jpg"></a></li>
				</ul>
			</div>
		</div>
		<div class="col-sm-4"></div>
	</div>
</body>
<script type="text/javascript" src="static/js/jQuery1.7.js"></script>
<script type="text/javascript" src="static/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="static/js/jquery1.42.min.js"></script>
<script type="text/javascript" src="static/js/jquery.SuperSlide.js"></script>
<script type="text/javascript" src="static/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	var flag = 0;
	function yanzheng() {

		$.ajax({
			url : "ve/yanzheng",
			data : {
				verifyCode : $("#verifyCode").val()
			},
			dataType : 'text',
			type : 'post',
			scriptCharset : 'utf-8',
			success : function(result) {

				if (eval("(" + result + ")") == "0") {
					$("#vcerr").removeClass("text-success");
					$("#vcerr").addClass("text-danger");
					$("#vcerr").text("验证码不正确");
					$("#verifyCode").focus();
					flag = 0;
				} else if (eval("(" + result + ")") == "1") {
					$("#vcerr").text("验证码正确");
					$("#vcerr").removeClass("text-danger");
					$("#vcerr").addClass("text-success");
					flag = 1;
				}
			}
		});
	}
	function change() {
		$("#vcimg").attr("src", "ve/getVerifyCode?d=" + new Date());
	}
	function login() {
		$("#unerr").text("");
		$("#pwerr").text("");
		$("#vcerr").text("");
		if ($("#username").val() == "" || $("#username").val() == null) {
			$("#unerr").removeClass("text-success");
			$("#unerr").addClass("text-danger");
			$("#unerr").text("请填写用户名");
			$("#username").focus();
			return;
		}
		if ($("#password").val() == "" || $("#password").val() == null) {
			$("#pwerr").removeClass("text-success");
			$("#pwerr").addClass("text-danger");
			$("#pwerr").text("请填写密码");
			$("#password").focus();
			return;
		}
		if ($("#role").val() == "" || $("#role").val() == null) {
			$("#roerr").removeClass("text-success");
			$("#roerr").addClass("text-danger");
			$("#roerr").text("请选择角色");
			$("#role").focus();
			return;
		}
		if (flag == 0) {
			$("#vcerr").removeClass("text-success");
			$("#vcerr").addClass("text-danger");
			$("#vcerr").text("请正确填写验证码");
			$("#verifyCode").focus();
			return;
		}

		$.ajax({
			url : "user/login",
			data : {
				role : $("#role").val(),
				username : $("#username").val(),
				password : $("#password").val(),
				rem : $("#rem").is(':checked')
			},
			dataType : 'text',
			type : 'post',
			scriptCharset : 'utf-8',
			success : function(result) {

				if (eval("(" + result + ")") == "0") {
					$("#unerr").removeClass("text-success");
					$("#unerr").addClass("text-danger");
					$("#unerr").text("用户名或密码错误");
					$("#username").focus();
				} else if (eval("(" + result + ")") == "1") {
					window.location.href = "user/success";
				}
			}
		});

	}

	$(function() {

		$("#rem").click(function() {
			if (this.checked) {
				$("#rem1").val("on");
			} else {
				$("#rem1").val("");
			}
		});
	});
</script>
</html>
