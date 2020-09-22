<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th>${categoryName}</th>
		</tr>
		<tr>
			<td>문제제목<input type="text" name="title"></td>
		</tr>
		<tr>
			<td>문제분류 <select>
					<c:forEach var="list" items="${list}">
						<option value="${list.TAG_ID}">${list.TAG_NAME}</option>
					</c:forEach>
			</select>
			</td>
			<td></td>
		</tr>
		<tr>
		<td><textarea></textarea></td>
		</tr>
	</table>
</body>
</html>