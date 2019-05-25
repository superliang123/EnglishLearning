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
    
    <title>My JSP 'user_list.jsp' starting page</title>
    
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
  <h2>用户管理</h2><hr>
  <div class="input-group pull-right" style="width:300px">
	      <input id="soukey" type="text" class="form-control" placeholder="输入搜索内容" value="${key }">
	      <span class="input-group-btn">
	        <button class="btn btn-default" onclick="sou(1)" type="button">搜索</button>
	      </span>
	    </div>
  
  
  	
      <div class="table_content">
      <form action="" id="form1">
      <input type="hidden" name="role" value="${rolemsg }">
      
    <table class="table table-hover">
    	<thead>
    	<tr>
    		<th>编号</th>
    		<th>用户名</th>
    		<th>密码</th>
    		<th>性别</th>
    		<th>邮箱</th>
    		<th>电话</th>
    		<th>生日</th>
    		<th>操作</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach items="${list }" var="record" varStatus="vs">
    	
    	<tr>
    		<td><input type="checkbox" name="sel" value="${record.sid}${record.tid}"/>${record.sid}${record.tid}</td>
    		<td><a onclick="edit('${record.sid}','${record.tid}');">${record.username}</a></td>
    		
    		<td>${record.password}</td>
    		<td>${record.sex}</td>
    		<td>${record.email}</td>
    		<td>${record.phone}</td>
    		<td>${record.birthday}</td>
    		<td><a onclick="edit('${record.sid}','${record.tid}');">修改</a>&#12288<a href="javascript:if(confirm('确定要删除吗？')) del('${record.sid}','${record.tid}');">删除</a></td>
    	</tr>
    	</c:forEach>
    	
    	
    	</tbody>
    </table>
    	<div class="pull-left">
    	<label><input type="checkbox" name="all" id="all"/>全选</label>
		<input class=" btn-xs btn btn-danger" type="button" onclick="sub()" value="批量删除"/>
    	<br>
    
    	 <ul class="pagination">
		    <li <c:if test="${page.currPage eq '1'}"> class="disabled"</c:if>><a <c:if test="${page.currPage ne '1'}">onclick="list('${page.currPage -1}')"</c:if>>&laquo;</a></li>
		    <c:if test="${page.totalPage eq '0'}"><li class="active"><a onclick="list(1)">1</a></li></c:if>
		    <c:forEach begin="1" end="${page.totalPage }" var="var">
		    	<li <c:if test="${var eq page.currPage}"> class="active"</c:if>><a onclick="list('${var}')">${var}</a></li>
		    </c:forEach>
		    <li  <c:if test="${page.currPage eq page.totalPage }"> class="disabled"</c:if>><a <c:if test="${page.currPage ne page.totalPage }">onclick="list('${page.currPage +1}')"</c:if>>&raquo;</a></li>
		  </ul>
		  <span class="jilu text-muted">记录数：${page.totalCount }&#12288总页数：${page.totalPage }&#12288当前页：${page.currPage }</span>
		  </div>
		  </form>
    </div>
    <div id="aaa"></div>
  </body>
  <script type="text/javascript" src="static/js/jquery-1.11.1.min.js"></script>
  <script type="text/javascript">
  	
		function edit(sid,tid){
		
			$.post("user/goEdit",{"sid":sid,"tid":tid},function(data){
			
                $("#navContent").html(data);
            });
		}
		
		function del(sid,tid){
		
			$.post("user/del",{"sid":sid,"tid":tid},function(data){
			
                $("#navContent").html(data);
            });
		}
		
		
		function list(currPage){
				if($("#soukey").val()!=null){
					sou(currPage);
					return;
				}
				
				$.post("user/list",{"role":'${rolemsg}',"currPage":currPage},function(data){
				
	                $("#navContent").html(data);
	            });
		}
		
		function sou(currPage){
			$.post("user/list",{"role":'${rolemsg}',"currPage":currPage,"soukey":$("#soukey").val()},function(data){
                $("#navContent").html(data);
            });
		}
		
		$(function(){
			$("#all").click(function(){
				if(this.checked){
					$(":checkbox").prop("checked",true);
				}else{
					$(":checkbox").prop("checked",false);
				}
			});
		});
		function sub(){
			if($("input[type='checkbox']:checked").length==0){
				alert("请选择要删除的记录！");
				return;
			}else{
				$.post("user/delMore",$('#form1').serialize(),function(data){
				
	                $("#navContent").html(data);
	            });
			}
		}
  </script>
</html>
