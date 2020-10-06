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

.menu_table tr td {
	padding: 15px;
}

.btn {
	width: 200px;
	padding: 5px 12px 5px 12px;
	border: 2px solid #ccc;
	background-color: #fff;
	font-size: 16px;
}

.btn:hover {
	cursor: pointer;
	border: 2px solid #000;
}
</style>
</head>
<body>
	<div class="menu">
		${category}
		<table class="menu_table" style="border-collapse: collapse;">
			<tr>
				<td><button class="btn" onclick="location.href='c001_003.pro?category=${category}'">유저 제출문제</button></td>
				<td>유저가 심혈을 다해 만든 문제들입니다.</td>
			</tr>
			<tr>
				<td>
					<button class="btn" onclick="location.href='colselect_page.pro?category=${category}'">기출문제 문제집</button>
				</td>
			</tr>
			<tr>
				<td>
					<button class="btn" onclick="location.href='userColselect_page.pro?category=${category}'">유저 제출문제 문제집</button>
				</td>
			</tr>
			<tr>
				<td><button class="btn">오답 문제집</button></td>
			</tr>
		</table>
	</div>
</body>
</html>