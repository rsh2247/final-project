<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

#coltable{
width:100%;
border-collapse: collapse;
}
#contentbox{
	width: 1000px;
	margin: 50px auto 0 auto;
}
#contentbox a{
	text-decoration: none;
	color: black;
	padding-left: 20px;
}
</style>
</head>
<body>
<div id="contentbox">
	<table id="coltable">
		<tr style="border-bottom: 2px solid #3E60DB; height: 40px" >
			<th width="100px">번호</th>
			<th width="600px">문제집이름</th>
			<th >제작자</th>
			<th>평점</th>
		</tr>
		<c:forEach items="${list}" var="list">
			<tr style="border-bottom: 1px solid #ccc; height: 30px;">
				<td>${list.COL_NUM}</td>
				<td style="text-align: left; padding-left: 10px;"><a href="col_problemPage.pro?colNum=${list.COL_NUM}">${list.COL_NAME}</a></td>
				<td>${list.USER_ID}</td>
				<td></td>
			</tr>
		</c:forEach>
	</table>
	</div>
</body>
</html>