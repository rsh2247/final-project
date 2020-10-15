<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#answerTable {
	margin: 50px auto 0 auto;
	border-collapse: collapse;
}

#answerTable td{
	padding: 20px 0 20px 0;
}

.button {
	width: 200px;
	border: 2px solid #3E60DB;
	color: #fff;
	background-color: #3E60DB;
	padding: 0.7em 0.5em 0.7em 0.5em;
	cursor: pointer;
}

.button:hover {
	
	color: #3E60DB;
	background-color: #fff;
}
</style>
</head>
<body>
	<table id="answerTable">
		<tr>
			<td colspan="2">점수 : ${result.score} / ${result.maxscore}</td>
		</tr>
		<tr>
			<td><button class="button" onclick="location.href=''">오답확인하기</button>
				<button class="button" onclick="location.href='userColselect_page.pro?category=${category}'">다른문제 풀러가기</button></td>
		</tr>
	</table>
</body>
</html>