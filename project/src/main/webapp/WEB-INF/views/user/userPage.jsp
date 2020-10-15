<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#contentbox {
	margin: 100px auto 0 auto;
	width: 1200px;
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
	height: 100px;
	background-color: #fff;
	margin-left: 100px;
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

#maincontent {
	
}

#colhistory {
	width: 90%;
	border-collapse: collapse;
	margin-left: 10px;
}

#colhistory th {
	padding: 10px 0 10px 0;
}
</style>
</head>
<body>
	<!--0b59bf -->
	<div id="contentbox">
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
		<div id="mainbox">
			<div id="maintitle">문제집오답</div>
			<div id="maincontent">
				<p style="text-align: left; padding: 10px 0 10px 10px;">전체응시내역</p>
				<table id="colhistory">
					<tr style="border-bottom: 2px solid #3E60DB;">
						<th width="50px">번호</th>
						<th width="400px">문제집제목</th>
						<th>분류</th>
						<th>점수</th>
						<th width="100px">날짜</th>
					</tr>
					<c:set var="num" value="1"></c:set>
					<c:forEach var="collist" items="${list}">
						<tr style="border-bottom: 1px solid #ccc;">
							<td>${num}</td>
							<td style="text-align: left; padding-left: 15px"><a href="userPage_col_correctsheet.user?number=${collist.COL_NUM}">${collist.COL_NAME}</a></td>
							<td>${collist.CATEGORY_NAME}</td>
							<c:if test="${collist.COL_SCORE == collist.COL_MAXSCORE}">
								<td><label style="color: green;">${collist.COL_SCORE}</label>/${collist.COL_MAXSCORE}</td>
							</c:if>
							<c:if test="${collist.COL_SCORE != collist.COL_MAXSCORE}">
								<td><label style="color: orange;">${collist.COL_SCORE}</label>/${collist.COL_MAXSCORE}</td>
							</c:if>
							<td style="font-size: small;">${collist.COL_SOLVEDATE}</td>
						</tr>
						<c:set var="num" value="${num + 1}"></c:set>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>