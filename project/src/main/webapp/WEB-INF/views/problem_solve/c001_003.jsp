<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.menu{
margin-top: 50px;
}

.p_table {
	border-collapse: collapse;
	border: 0px solid black;
	margin: auto;
}

.p_table th{
	border-bottom: 1px solid black;
	height: 40px;
}

.p_table td{
	border-bottom: 1px solid #ccc;
	height: 25px;

}

.p_table a{
	text-decoration: none;
	color: black;
}

</style>
</head>
<body>
	<div class="menu">
	<table class="p_table">
		<tr>
			<th width="100px">문제 번호</th>
			<th width="500px" >문제명</th>
			<th width="100px">정보</th>
			<th width="100px">난이도</th>
		</tr>
		<c:forEach var="problem" items="${list}">
		<tr>
		<td>${problem.PRO_NUM}</td>
		<td style="text-align: left; padding-left: 10px;"><a href="problem_page.pro?pro_num=${problem.PRO_NUM}">${problem.PRO_NAME}</a></td>
		<td><a href="">${problem.TAG_NAME}</a> </td>
		<td> </td>
		</tr>
		</c:forEach>
	</table>
	</div>
</body>
</html>