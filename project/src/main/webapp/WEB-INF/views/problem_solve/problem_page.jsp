<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table style="margin: auto;">
		<c:forEach var="problem" items="${list}">
			<tr>
				<td>문제자료</td>
			</tr>
			<tr>
				<td>${problem.PRO_NAME}</td>
			</tr>
			<tr>
				<td>${problem.PRO_CONTENT}</td>
			</tr>
		</c:forEach>
	</table>
	<form action="check_answer.pro" method="post">
		<ul>
			<c:forEach var="example" items="${list2}">
				<li><input type="radio" value="${example.CHO_NUM}" name="answer"> ${example.CHO_NUM}</li>
				<li>${example.CHO_CONTENT}</li>
			</c:forEach>
			<li><input type="submit"></li>
		</ul>
	</form>
</body>
</html>