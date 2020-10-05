<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

#coltable{
margin: 50px auto;
border-collapse: collapse;
}

</style>
</head>
<body>
	<table id="coltable">
		<tr>
			<th width="100px">번호</th>
			<th width="300px">문제집이름</th>
			<th width="150px">제작자</th>
			<th>평점</th>
		</tr>
		<c:forEach items="${list}" var="list">
			<tr>
				<td>${list.COL_NUM}</td>
				<td style="text-align: left; padding-left: 10px;"><a href="col_problemPage.pro?colNum=${list.COL_NUM}">${list.COL_NAME}</a></td>
				<td>${list.USER_ID}</td>
				<td></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>