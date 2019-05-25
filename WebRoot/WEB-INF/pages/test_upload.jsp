<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'data_upload.jsp' starting page</title>
    
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
  	<h2>试题上传</h2><hr>
    <div class="container">
    <form method="post" action="" id="form1" enctype="multipart/form-data">
    	<div class="form-group">
    	<label for="name">上传者：</label>
    	<input class="form-control" type="text" name="name" id="name"/>
    	</div>
    	<div class="form-group">
    	上传文件：<input type="file" name="myfile" id="myfile"/>
    	</div>
    	<input class="btn btn-primary center-block" type="button" onclick="sub()" value="提交"/>
    	<span id="err" class="text-danger"></span>
	</form>
	</div>

  </body>
   <script type="text/javascript" src="static/js/jquery-1.11.1.min.js"></script>
  <script type="text/javascript">
	  	
			function sub(){
					$("#err").text("");
					if($("#name").val()==""||$("#name").val()==null){
						$("#err").removeClass("text-success");
			  			$("#err").addClass("text-danger");
					    $("#err").text("请填写作者");
				  		$("#name").focus();
				  		return;
					}
					if($("#myfile").val()==""||$("#myfile").val()==null){
						$("#err").removeClass("text-success");
			  			$("#err").addClass("text-danger");
					    $("#err").text("请选择文件");
				  		$("#myfile").focus();
				  		return;
					}
				
	            
	            $.ajax({  
				    url: "test/upload",  
				    type: 'POST',  
				    cache: false,  
				    data: new FormData($("#form1")[0]),  
				    processData: false,  
				    contentType: false,  
				    success: function (result) {  
				    	$(".li").removeClass("active1");
            			$("#testlist").addClass("active1");
				    	$("#navContent").html(result);
				    },  
				    error: function (err) {  
				    }  
				});
			}
	  </script>
</html>
