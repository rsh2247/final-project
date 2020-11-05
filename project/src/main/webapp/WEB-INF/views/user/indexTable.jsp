<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#contentbox {
	margin: 100px auto 0 auto;
	width: 1100px;
}

#index {
	width: 250px;
	border-collapse: collapse;
	font-family: 'Open Sans', 'Apple SD Gothic Neo', 'Noto Sans CJK KR', 'Noto Sans KR', '나눔바른고딕', '나눔고딕', '맑은고딕', 'Helvetica Neue', 'Helvetica',
		'Arial', sans-serif;
	float: left;
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
#mainbox {
	width: 800px;
	background-color: #fff;
	margin-left: 50px;
	float: left;
}

#maintitle {
	width: 100%;
	height: 40px;
	border-bottom: 1px solid #d4d4d4;
	text-align: left;
	padding-left: 10px;
	margin-bottom: 25px;
	font-size: 21px;
	color: #333;
}

</style>
</head>
<body>
	<table id="index">
		<tr>
			<td><a href="userPage_col.user">문제집오답</a></td>
		</tr>
		<tr>
			<td><a href="userPage_pro.user">문제오답</a></td>
		</tr>
		<tr>
			<td><a href="userGroup.user">그룹목록</a></td>
		</tr>
		<tr>
			<td><a>수강중인 강의목록</a></td>
		</tr>
		<tr>
			<td><a href="userPage_modify.user">정보수정</a></td>
		</tr>
		<tr>
			<td><a>회원탈퇴</a></td>
		</tr>
	</table>
</body>
</html>