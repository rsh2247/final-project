<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.menu {
	margin-top: 50px;
}

.menu_table {
	margin: 50px auto 0 auto;
}
</style>
</head>
<body>
	<div class="menu">
		${category}
		<table class="menu_table">
			<tr>
				<td><a href="c001_003.pro?category=${category}">유저 제출문제</a></td>
				<td>유저가 심혈을 다해 만든 문제들입니다.</td>
			</tr>
			<tr>
				<td><a href="colselect_page.pro?category=${category}">기출문제 문제집</a></td>
			</tr>
			<tr>
				<td><a href="userColselect_page.pro?category=${category}">유저 제출문제 문제집</a></td>
			</tr>
			<tr>
				<td>오답 문제집</td>
			</tr>
		</table>
	</div>
</body>
</html>