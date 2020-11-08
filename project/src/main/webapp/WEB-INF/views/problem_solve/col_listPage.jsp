<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#coltable {
	width: 100%;
	border-collapse: collapse;
}

#coltable th {
	height: 50px;
	font-size: 18px;
	color: #eee;
	background-color: #3E60DB;
}

#coltable td {
	height: 35px;
	padding: 2px 0 2px 0;
}
#coltable tr:nth-child(2n) {
	background-color: #f1f1f1;
}
#contentbox {
	width: 1000px;
	margin: 50px auto 0 auto;
}

#contentbox a {
	text-decoration: none;
	color: black;
	padding-left: 20px;
}
.elipse{
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 130px;
}
</style>
</head>
<body>
	<div id="contentbox">
		<table id="coltable">
			<tr>
				<th width="20px"></th>
				<th width="100px">번호</th>
				<th width="550px">문제집 이름</th>
				<th width="130px">제작자</th>
				<th width="200px">평점</th>
			</tr>
			<c:forEach items="${list}" var="list">
				<tr style="border-bottom: 1px solid #ccc; height: 30px;">
					<td></td>
					<td>${list.COL_NUM}</td>
					<td style="text-align: left; padding-left: 10px;"><a href="col_problemPage.pro?col_num=${list.COL_NUM}">${list.COL_NAME}</a></td>
					<td><div class="elipse">${list.USER_ID}</div></td>
					<td></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>