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
	<style type="text/css">
		#navContent{
			border-radius: 4px;
			border: 1px solid #ddd;
			padding:20px;
			width:80%;
			height:auto !important;
			background:white;
			margin-right:30px;
			position:relative;
		}
		.pagination{
			bottom:190px;
		}
	</style>
  </head>
  
  <body>
    	<h2>帖子详情</h2><hr>
		    
		    <table class="table table-hover ">
		    <tr>
		    <th style="width:250px;">标题：</th>
		    <th class="well">${list[0].title }</th>
		    
		    </tr>
		    <tr>
		    <td>楼主<br>${list[0].author }</td>
		    	<td>
			    <textarea readonly="readonly" class="form-control" rows="5" cols="50" style="background:white;resize:none;">${list[0].content }</textarea>
			    <span class="pull-right text-muted">${list[0].time }</span>
			    </td>
		    </tr>
		    <c:forEach items="${reply }" var="var" varStatus="vs">
			    <tr>
				    <td>${var.lou }楼<br> ${var.author }</td>
				    <td><textarea readonly="readonly" class="form-control" rows="5" cols="50" style="background:white;resize:none;">${var.content }</textarea>
				    <span class="pull-right text-muted">${var.time }</span></td>
			    </tr>
		    </c:forEach>
		    </table>
		    
		    <ul class="pagination">
			    <li <c:if test="${page.currPage eq '1'}"> class="disabled"</c:if>><a <c:if test="${page.currPage ne '1'}">onclick="list('${page.currPage -1}')"</c:if>>&laquo;</a></li>
			    <c:if test="${page.totalPage eq '0'}"><li class="active"><a onclick="list(1)">1</a></li></c:if>
			    <c:forEach begin="1" end="${page.totalPage }" var="var">
			    	<li <c:if test="${var eq page.currPage}"> class="active"</c:if>><a onclick="list('${var}')">${var}</a></li>
			    </c:forEach>
			    <li  <c:if test="${page.currPage eq page.totalPage }"> class="disabled"</c:if>><a <c:if test="${page.currPage ne page.totalPage }">onclick="list('${page.currPage +1}')"</c:if>>&raquo;</a></li>
			  </ul>
			  <span class="jilu text-muted">记录数：${page.totalCount }&#12288总页数：${page.totalPage }&#12288当前页：${page.currPage }</span>
		    
		    <form action="" id="form1">
		   		<input type="hidden" name="forumid" value="${list[0].id }">
		    	<input type="hidden" name="author" value="${username }">
		    	<input type="hidden" name="lou" value="${page.totalCount +1 }">
			    <table class="table table-hover ">
				    <tr>
					    <td><label for="content">回复：</label></td>
					    <td><textarea  class="form-control" name="content" id="content" rows="5" cols="50"></textarea></td>
				    </tr>
			    </table>
		    </form>
		    <input class="btn btn-primary center-block" type="button" onclick="sub()" value="提交"/>
		    <span id="err" class="text-danger"></span>
	    
  </body>
  
      <script type="text/javascript" src="static/js/jquery-1.11.1.min.js"></script>
	  <script type="text/javascript">
	  			
	  
	  
	  
			function sub(){
				
				$("#err").text("");
				if($("#content").val()==""||$("#content").val()==null){
					$("#err").removeClass("text-success");
		  			$("#err").addClass("text-danger");
				    $("#err").text("请填写内容");
			  		$("#content").focus();
			  		return;
				}
			
				$.post("forum/replyAdd",$('#form1').serialize(),function(data){
				
	                $("#navContent").html(data);
	            });
			}
			
			
			function list(currPage){
				
				$.post("forum/show",{"id":'${list[0].id }',"currPage":currPage},function(data){
				
	                $("#navContent").html(data);
	            });
			}
	  </script>
  
  
</html>
