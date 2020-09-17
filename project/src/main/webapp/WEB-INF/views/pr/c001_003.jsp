<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.p_table {
	border-collapse: collapse;
	border: 1px solid black;
}
</style>
</head>
<body>
	<table>
		<tr>
			<td>전체</td>
			<td>난이도</td>
			<td>태그</td>
			<td>평점</td>
		</tr>
	</table>
	검색
	<table class="p_table">
		<tr>
			<th width="100px">문제 번호</th>
			<th width="200px">문제명</th>
			<th>정보</th>
		</tr>
		<tr>
			<td>000</td>
			<td><a href="test.to">문제1</a></td>
			<td>000</td>
		</tr>
	</table>
</body>
</html>