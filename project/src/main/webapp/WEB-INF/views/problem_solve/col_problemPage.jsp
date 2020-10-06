<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#proTable {
	margin: 150px auto 0 auto;
}

#panel {
	min-height: 1000px;
	min-width: 250px;
	float: right;
	background-color: #ccc;
}
</style>
</head>
<body>
	<div id="panel">
		<ul>
			<c:forEach var="list" items="${list}">
				<li></li>
			</c:forEach>
		</ul>
	</div>
	<table id="proTable">
		<c:forEach var="list" items="${list}">
			<tr>
				<td>${list.COL_LIST_NUM}</td>
				<td>${list.PRO_CONTENT}</td>
				<td></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>