<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	td{text-align:center;}
</style>
<script type="text/javascript">
function goDetail(postingNumber){
	location.href="${path}/getFm.do?postingNumber="+postingNumber
}	

</script>
</head>

<body>
<div class="jumbotron text-center">
<h2>플리마켓 홍보글 전체 목록</h2>
<!-- 
<h2 data-toggle="modal" data-target="#exampleModalCenter">타이틀</h2>
	-->
</div>
<div class="container">
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<div class="container-fluid">
	    <form id="frm01" class="d-flex"  method="post"> 		
		</form>   

    </div>
	</nav>
	

<table class="table table-hover table-striped">
	<col width="33%">
	<col width="33%">
	<col width="33%">
	<thead>
	
	  <tr class="table-success text-center">
	    <th>번호</th>
	    <th>제목</th>
	    <th>작성일</th>
	  </tr>
	</thead>	
	<tbody>
		<c:forEach var="fleamarket" items="${list}">
	    	<tr onclick="goDetail(${fleamarket.postingNumber})">
	    		<td>${fleamarket.cnt}</td>
	    		<td>${fleamarket.title}</td>
	    		<td>${fleamarket.registDate}</td>
	    	</c:forEach>
	</tbody>
</table>     
</div>
</body>
</html>