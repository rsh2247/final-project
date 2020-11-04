<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.menu {
	margin-top: 50px;
}

.p_table {
	border-collapse: collapse;
	border: 0px solid black;
	margin: auto;
}

.p_table th {
	height: 50px;
	font-size: 18px;
	color:#eee;
	background-color: #3E60DB;
}

.p_table td {
	height: 35px;
	padding: 2px 0 2px 0;
	
}

.p_table tr:nth-child(2n){
	background-color: #f1f1f1;
}

.p_table a {
	text-decoration: none;
	color: black;
}
.star1{
	display: inline-block;
	height: 30px;
	position: absolute;
}
.star2{
	display: inline-block;
	height: 30px;
}
</style>
</head>
<body>
	<div class="menu">
		<table class="p_table">
			<tr>
				<th width="20px"></th>
				<th width="100px">문제 번호</th>
				<th width="500px">문제명</th>
				<th width="100px">정보</th>
				<th width="200px">평점</th>
			</tr>
			<c:forEach var="problem" items="${list}">
			<c:set var="num" value="${problem.SCORE*14.8}"/>
				<tr>
					<td></td>
					<td>${problem.PRO_NUM}</td>
					<td style="text-align: left; padding-left: 25px;"><a href="problem_page.pro?pro_num=${problem.PRO_NUM}">${problem.PRO_NAME}</a></td>
					<td>${problem.TAG_NAME}</td>
					<td>
					<img style="clip: rect(0px,${num}px,30px,0px);" class="star1" alt="" src="${contextPath}/resources/image/stars1.png">
					<img class="star2" alt="" src="${contextPath}/resources/image/stars2.png">
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>