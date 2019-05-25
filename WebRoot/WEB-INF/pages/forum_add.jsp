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

  </head>
  
  <body>
  	<h2>发表帖子</h2><hr>
  	<div class="container">
    	<form id="form1" class="center-block" action="" method="post">
    		<input class="form-control" type="hidden" id="id" name="id" value="${list[0].id }"/>
		    <input class="form-control" type="hidden" id="author" name="author" value="${username }"/>
		    <table class="table table-hover ">
		    <tr>
		    <td><label for="title">标题：</label></td>
		    <td><input class="form-control" type="text" id="title" name="title" value="${list[0].title }"/></td>
		    
		    </tr>
		    <tr>
		    <td><label for="author">帖子类型：</label></td>
		    <td>
		    	<select class="form-control" id="type" name="type">
		    		<option value="">请选择类型</option>
		    		<option <c:if test="${list[0].type eq 'English  ——   每日英语'}">selected</c:if> value="English  ——   每日英语">English  ——   每日英语</option>
		    		<option <c:if test="${list[0].type eq 'Study    ——   学习交流'}">selected</c:if> value="Study    ——   学习交流">Study    ——   学习交流</option>
		    		<option <c:if test="${list[0].type eq 'Chatting ——   网事杂谈'}">selected</c:if> value="Chatting ——   网事杂谈">Chatting ——   网事杂谈</option>
		    		<option <c:if test="${list[0].type eq 'Help     ——   我要求助'}">selected</c:if> value="Help     ——   我要求助">Help     ——   我要求助</option>
		    	</select>
		    </td>
		    </tr>
		    <tr>
		    <td><label for="content">内容：</label></td>
		    <td><textarea  class="form-control" name="content" id="content" rows="5" cols="50">${list[0].content }</textarea></td>
		    </tr>
		    
		    
		    </table>
		    <input class="btn btn-primary center-block" type="button" onclick="sub()" value="提交"/>
		    <span id="err" class="text-danger"></span>
	    </form>
	    </div>
  </body>
  
      <script type="text/javascript" src="static/js/jquery-1.11.1.min.js"></script>
	  <script type="text/javascript">
	  	
			function sub(){
				$("#err").text("");
				if($("#title").val()==""||$("#title").val()==null){
					$("#err").removeClass("text-success");
		  			$("#err").addClass("text-danger");
				    $("#err").text("请填写标题");
			  		$("#title").focus();
			  		return;
				}
				if($("#type option:selected").val()==""||$("#type option:selected").val()==null){
					$("#err").removeClass("text-success");
		  			$("#err").addClass("text-danger");
				    $("#err").text("请选择类型");
			  		$("#type").focus();
			  		return;
				}
				if($("#content").val()==""||$("#content").val()==null){
					$("#err").removeClass("text-success");
		  			$("#err").addClass("text-danger");
				    $("#err").text("请输入内容");
			  		$("#content").focus();
			  		return;
				}
			
			
			
			
			
				$.post("forum/add",$('#form1').serialize(),function(data){
					$(".li").removeClass("active1");
            		$("#forumlist").addClass("active1");
	                $("#navContent").html(data);
	            });
			}
	  </script>
  
  
</html>
