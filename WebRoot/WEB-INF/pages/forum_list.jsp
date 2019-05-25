<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'list.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link type="text/css" rel="stylesheet" href="static/css/bootstrap.css" />
	
  </head>
  
  <body>
  	<h2>论坛列表</h2><hr>
 	 <div class="input-group pull-right" style="width:300px">
	      <input id="soukey" type="text" class="form-control" placeholder="输入搜索内容" value="${key }">
	      <span class="input-group-btn">
	        <button class="btn btn-default" onclick="sou(1)" type="button">搜索</button>
	      </span>
	    </div>
  
  
  
  <div class="table_content">
  	<form action="" method="post" id="form1">
    <table class="table table-hover">
    	<thead>
    	<tr>
    		<th>标题</th>
    		<th>作者</th>
    		<th>修改时间</th>
    		<c:if test="${role eq 'admin' }">
    			<th>操作</th>
    		</c:if>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach items="${list }" var="record" varStatus="vs">
    	<tr>
    		<td>
    		<c:if test="${role eq 'admin' }">
    			<input type="checkbox" name="sel" value="${record.id}"/>
    		</c:if>
    		<a onclick="show('${record.id}')">[${record.type}]${record.title}</a></td>
    		<td>${record.author}</td>
    		<td>${record.time}</td>
    		<c:if test="${role eq 'admin' }">
    			<td><a onclick="edit('${ record.id}');">修改</a>&#12288<a href="javascript:if(confirm('确定要删除吗？')) del('${ record.id}');">删除</a></td>
    		</c:if>
    	</tr>
    	</c:forEach>
    	
    	
    	</tbody>
    </table>
    	<div class="pull-left">
    	<c:if test="${role eq 'admin' }">
    	<label><input type="checkbox" name="all" id="all"/>全选</label>
		<input class=" btn-xs btn btn-danger" type="button" onclick="sub()" value="批量删除"/>
    	<br>
    	</c:if>
    	
    	<ul class="pagination">
	    <li <c:if test="${page.currPage eq '1'}"> class="disabled"</c:if>><a <c:if test="${page.currPage ne '1'}">onclick="list('${page.currPage -1}')"</c:if>>&laquo;</a></li>
	    <c:if test="${page.totalPage eq '0'}"><li> class="active"><a onclick="list(1)">1</a></li></c:if>
	    <c:forEach begin="1" end="${page.totalPage }" var="var">
	    	<li <c:if test="${var eq page.currPage}"> class="active"</c:if>><a onclick="list('${var}')">${var}</a></li>
	    </c:forEach>
	    <li  <c:if test="${page.currPage eq page.totalPage }"> class="disabled"</c:if>><a <c:if test="${page.currPage ne page.totalPage }">onclick="list('${page.currPage +1}')"</c:if>>&raquo;</a></li>
	  </ul><br>
	  <span class="jilu text-muted">记录数：${page.totalCount }&#12288总页数：${page.totalPage }&#12288当前页：${page.currPage }</span>
	  </div>
	  </form>
    </div>
  </body>
  <script type="text/javascript">
  
  		function show(id){
			
			$.post("forum/show",{"id":id,"currPage":1},function(data){
			
                $("#navContent").html(data);
            });
		}
  
  
  		function edit(id){
		
			$.post("forum/goEdit",{"id":id},function(data){
			
                $("#navContent").html(data);
            });
		}
  		
  		
  
  		function del(id){
		
			$.post("forum/del",{"id":id},function(data){
			
                $("#navContent").html(data);
            });
		}
		
		function list(currPage){
			if($("#soukey").val()!=null){
					sou(currPage);
					return;
				}
		
			$.post("forum/list",{"currPage":currPage},function(data){
			
                $("#navContent").html(data);
            });
		}
		
		function sou(currPage){
		
			$.post("forum/list",{"currPage":currPage,"soukey":$("#soukey").val()},function(data){
			
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
				$.post("forum/delMore",$('#form1').serialize(),function(data){
				
	                $("#navContent").html(data);
	            });
			}
		}
  </script>
</html>
