<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
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
<td>${problem.pro_name}</td>
</tr>
<tr>
<td>${problem.pro_content}</td>
</tr>
<tr>
<td>${problem.pro_example}</td>
<td>
<form action="" method="post">
<input type="submit" value="확인">
</form>
</td>
</tr>
</c:forEach>
</table>





</body>
</html>