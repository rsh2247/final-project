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
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container {
	width: 1170px;
	height: 0px;
	padding: 10px 15px 10px 15px;
	margin-right: auto;
	margin-left: auto;
}

.loginbar {
	float: right;
	border-collapse: collapse;
}

.loginbar td {
	width: 75px;
	border: 1px solid #ccc;
}

.navigator {
	float: right;
	border-collapse: collapse;
}

.navigator td {
	width: 75px;
	border: 1px solid #ccc;
}

.navigator td:hover {
	cursor: pointer;
}

#navi {
	height: 30px; /* 메인 메뉴의 높이 */
	margin: 15px auto;
	display: inline-block;
	position: relative;
	top: -60px;
	left: -100px;
}

.one, .two, .three { /* 메인 메뉴 안의 ul을 설정함: 상위메뉴의 ul+하위 메뉴의 ul */
	list-style-type: none; /* 메인 메뉴 안의 ul 내부의 목록 표시를 없애줌 */
	margin: 0px; /* 메인 메뉴 안의 ul의 margin을 없앰 */
	padding: 0px; /* 메인 메뉴 안의 ul의 padding을 없앰 */
}

.link {
	text-decoration: none;
	color: black;
	display: block;
	width: 120px;
	height: 30px;
}

.one {
	float: left;
}

.one>li:hover {
	background: black;
}

.one>li:hover .link {
	color: white;
}

.one>li {
	float: left;
	position: relative;
	margin: 15px auto;
	height: 30px;
	width: 120px;
}

.one ul {
	display: none;
} /*2단, 3단 메뉴를 숨기기 */
.one li:hover>ul {
	display: block;
} /*주 메뉴에 마우스 오버했을 때 부 메뉴 드러내가 */
.two {
	position: absolute;
	left: 0px;
	top: 30px;
}

.two>li {
	position: relative;
	background-color: #4d4d4d; height : 30px;
	width: 120px;
	height: 30px;
}

.two>li:hover {
	background-color: white;
}

.two>li:hover .link {
	color: black;
}

.three {
	margin: 0px;
	left: 120px;
	top: 0px;
	position: absolute;
	background: white;
}
</style>
</head>
<body>
	<div class="container">
		<table class="loginbar">
			<tr>
				<td>로그인</td>
				<td>회원가입</td>
			</tr>
		</table>
	</div>
	<p style="clear: both;"></p>
	<div class="container">
		<img src="${contextPath}/resources/image/duke_swing.gif" style="position: relative; top: -70px; left: -250px;" />
		<nav id="navi">
			<ul class="one">
				<li><a href="#" class="link">문제풀기</a>
					<ul class="two">
						<li><a href="#" class="link">공인어학시험</a>
							<ul class="three">
								<li><a href="${contextPath}/pr/c001_002.do" class="link">TOEIC</a></li>
								<li><a href="${contextPath}/pr/c001_002.do" class="link">TOEFL</a></li>
								<li><a href="${contextPath}/pr/c001_002.do" class="link">JLPT</a></li>
								<li><a href="${contextPath}/pr/c001_002.do" class="link">HSK</a></li>
							</ul></li>
						<li><a href="#" class="link">국가자격시험</a></li>
						<li><a href="#" class="link">sub3</a>
							<ul class="three">
								<li><a href="#" class="link">sub3-1</a></li>
								<li><a href="#" class="link">sub3-2</a></li>
								<li><a href="#" class="link">sub3-3</a></li>
							</ul></li>
					</ul></li>
				<li><a href="#" class="link">menu2</a>
					<ul class="two">
						<li><a href="#" class="link">sub1</a></li>
						<li><a href="#" class="link">sub2</a></li>
						<li><a href="#" class="link">sub3</a>
							<ul class="three">
								<li><a href="#" class="link">sub3-1</a></li>
								<li><a href="#" class="link">sub3-2</a></li>
								<li><a href="#" class="link">sub3-3</a></li>
							</ul></li>
					</ul></li>
				<li><a href="#" class="link">menu3</a></li>
				<li><a href="#" class="link">menu4</a></li>
				<li><a href="#" class="link">menu5</a></li>
			</ul>
		</nav>
	</div>
	<p style="clear: both;"></p>
</body>
</html>