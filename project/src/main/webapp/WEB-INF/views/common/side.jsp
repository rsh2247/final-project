<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#index {
	width: 250px;
	border-collapse: collapse;
	margin: 100px 0 0 300px;
	font-family: 'Open Sans', 'Apple SD Gothic Neo', 'Noto Sans CJK KR', 'Noto Sans KR', '나눔바른고딕', '나눔고딕', '맑은고딕', 'Helvetica Neue', 'Helvetica',
		'Arial', sans-serif;
}

#index td {
	border: 1px solid #d4d4d4;
	padding: 0.7em 0 0.7em 1em;
	font-size: 16px;
	text-align: left;
}

#index a {
	text-decoration: none;
	color: #2c2c2c;
	display: block;
}
</style>
</head>
<body>
	<!--0b59bf -->
	<table id="index">
		<tr>
			<td style="background-color: #3E60DB; border: 1px solid #3E60DB"><a style="color: #fff;" href="">문제집오답</a></td>
		</tr>
		<tr>
			<td><a>문제오답</a></td>
		</tr>
		<tr>
			<td><a>그룹목록</a></td>
		</tr>
		<tr>
			<td><a>수강중인 강의목록</a></td>
		</tr>
		<tr>
			<td><a>정보수정</a></td>
		</tr>
		<tr>
			<td><a>회원탈퇴</a></td>
		</tr>
	</table>
</body>
</html>