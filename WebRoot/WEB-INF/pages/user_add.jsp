<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'user_add.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="static/css/dcalendar.picker.css"/>
	<style type="text/css">
		.datepicker{
			display:block !important;
		}
	</style>
  </head>
  
  <body>
  	
  	<h2>用户添加</h2><hr>
  		<div class="container">
    	<form id="form1" class="center-block" action="user/edit" method="post">
		    
		    <input type="hidden" name="id" value="${list[0].sid }${list[0].tid }"/>
		    <table class="table table-hover ">
		    <tr>
		    <td><label for="role">角色：</label></td>
		    <td><select  class="form-control" name="role" id="role">
		    	<option value="">请选择角色</option>
	    		<option <c:if test="${list[0].role eq 'student' }">selected</c:if> value="student">学生</option>
	    		<option <c:if test="${list[0].role eq 'teacher' }">selected</c:if> value="teacher">教师</option>
	    		<option <c:if test="${list[0].role eq 'admin' }">selected</c:if> value="admin">管理员</option>
    		</select>
		    </td>
		    </tr>
		    <tr>
		    <td><label for="username">用户名：</label></td>
		    <td><input onchange="yanzheng()" class="form-control" type="text" id="username" name="username" value="${list[0].username }"/></td>
		    
		    </tr>
		    <tr>
		    <td><label for="password">密码：</label></td>
		    <td><input class="form-control" type="text" id="password" name="password" value="${list[0].password }"/></td>
		    </tr>
		    <tr>
		    <td><label for="sex">性别：</label></td>
		    <td>
		    	<select  class="form-control" name="sex" id="sex">
		    	<option value="">请选择性别</option>
	    		<option <c:if test="${list[0].sex eq '男' }">selected</c:if> value="男">男</option>
	    		<option <c:if test="${list[0].sex eq '女' }">selected</c:if> value="女">女</option>
    			</select>
		    </td>
		    </tr>
		    <tr>
		    <td><label for="email">邮箱：</label></td>
		    <td><input  class="form-control" name="email" id="email" value="${list[0].email }"/></td>
		    </tr>
		    <tr>
		    <td><label for="phone">手机：</label></td>
		    <td><input class="form-control" name="phone" id="phone" value="${list[0].phone }"/></td>
		    </tr>
		    <tr>
		    <td><label for="birthday">生日：</label></td>
		    <td><input class="form-control" name="birthday" id="birthday" value="${list[0].birthday }"/></td>
		    </tr>
		    
		    
		    </table>
		    <input class="btn btn-primary center-block" type="button" onclick="sub()" value="提交"/>
		    <span id="err" class="text-danger"></span>
	    </form>
	    </div>
  </body>
  
      <script type="text/javascript" src="static/js/jquery-1.11.1.min.js"></script>
      <script type="text/javascript" src="static/js/dcalendar.picker.js"></script>
	  <script type="text/javascript">
	  		function yanzheng(){
			
				  $.ajax({ 
				      url:"user/yanzheng", 
				      data:{username:$("#username").val(),role:$("#role option:selected").val()},
				      dataType: 'text', 
				      type: 'post', 
				      scriptCharset: 'utf-8',
				      success:function(result){
					
					if(eval("("+result+")")=="0"){
						$("#err").removeClass("text-success");
			  			$("#err").addClass("text-danger");
					    $("#err").text("该用户名已被注册");
				  		$("#username").focus();
			  		}else if(eval("("+result+")")=="1"){
			  			$("#err").text("用户名可用");
			  			$("#err").removeClass("text-danger");
			  			$("#err").addClass("text-success");
			  		}
				  }
				    });
			}
	  
	  
	  
	  
	  		$('#birthday').dcalendarpicker({
				format:'yyyy-mm-dd'
			});
	  
	  	
			function sub(){
			
				var myreg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
				$("#err").text("");
				if($("#role option:selected").val()==""||$("#role option:selected").val()==null){
					$("#err").removeClass("text-success");
		  			$("#err").addClass("text-danger");
				    $("#err").text("请选择角色");
			  		$("#role").focus();
			  		return;
				}
				if($("#username").val()==""||$("#username").val()==null){
					$("#err").removeClass("text-success");
		  			$("#err").addClass("text-danger");
				    $("#err").text("请输入用户名");
			  		$("#username").focus();
			  		return;
				}
				if($("#password").val()==""||$("#password").val()==null){
					$("#err").removeClass("text-success");
		  			$("#err").addClass("text-danger");
				    $("#err").text("请输入密码");
			  		$("#password").focus();
			  		return;
				}
				if($("#sex option:selected").val()==""||$("#sex option:selected").val()==null){
					$("#err").removeClass("text-success");
		  			$("#err").addClass("text-danger");
				    $("#err").text("请选择性别");
			  		$("#sex").focus();
			  		return;
				}
				if($("#email").val()==""||$("#email").val()==null){
					$("#err").removeClass("text-success");
		  			$("#err").addClass("text-danger");
				    $("#err").text("请输入邮箱");
			  		$("#email").focus();
			  		return;
				}else if(!myreg.test($("#email").val())){
					$("#err").removeClass("text-success");
		  			$("#err").addClass("text-danger");
				    $("#err").text("邮箱格式不正确！");
				   	$("#email").focus();
				   	return;
				}
				if($("#phone").val()==""||$("#phone").val()==null){
					$("#err").removeClass("text-success");
		  			$("#err").addClass("text-danger");
				    $("#err").text("请输入手机");
			  		$("#phone").focus();
			  		return;
				}
				if($("#birthday").val()==""||$("#birthday").val()==null){
					$("#err").removeClass("text-success");
		  			$("#err").addClass("text-danger");
				    $("#err").text("请选择生日");
			  		$("#birthday").focus();
			  		return;
				}
				
			
				$.post("user/edit",$('#form1').serialize(),function(data){
					$(".li").removeClass("active1");
					if($("#role option:selected").val()=="student"){
						$("#studentlist").addClass("active1");
					}else if($("#role option:selected").val()=="student"){
						$("#teacherlist").addClass("active1");
					}
	                $("#navContent").html(data);
	            });
			}
	  </script>
  
  
</html>
