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
	height: 75px;
	padding: 0 15px 0 15px;
	border-bottom: 2px solid #ccc;
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
	display: inline-block;
	position: relative;
	top: -38px;
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
	width: 100%;
}

.one>li {
	float: left;
	position: relative;
	margin: 15px auto;
	height: 30px;
	width: 120px;
	border-bottom: 2px solid #ccc;
}

.one>li:hover {
	border-bottom: 2px solid black;
}

.one>li:hover .link {
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
	top: 32px;
}

.two>li {
	position: relative;
	background-color: #4d4d4d;
	height: 30px;
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
		<img src="${contextPath}/resources/image/duke_swing.gif" 
		onclick="location.href='${contextPath}/mainPage/mainPage001.do'"
		style="position: relative; top: -25px; left: -250px;" />
		<nav id="navi">
			<ul class="one">
				<li><a href="#" class="link">문제풀기</a>
					<ul class="two">
						<li><a href="#" class="link">공인어학시험</a>
							<ul class="three">
								<li><h3>영어</h3></li>
								<li><a href="${contextPath}/problem_solve/c001_002.do?category=TOEIC" class="link">TOEIC</a></li>
								<li><a href="${contextPath}/problem_solve/c001_002.do?category=TOEFL" class="link">TOEFL</a></li>
								<li><a href="${contextPath}/problem_solve/c001_002.do?category=TEPS" class="link">TEPS</a></li>
								<li><a href="" class="link"> </a></li>
							</ul>
							<ul class="three" style="left: 240px;">
								<li><h3>중국어</h3></li>
								<li><a href="${contextPath}/problem_solve/c001_002.do?category=HSK" class="link">HSK</a></li>
								<li><a href="" class="link"></a></li>
								<li><a href="" class="link"></a></li>
								<li><a href="" class="link"></a></li>
							</ul>
							<ul class="three" style="left: 360px;">
								<li><h3>일본어</h3></li>
								<li><a href="${contextPath}/problem_solve/c001_002.do?category=JLPT" class="link">JLPT</a></li>
								<li><a href="" class="link"></a></li>
								<li><a href="${contextPath}/pr/c001_002.do" class="link"></a></li>
								<li><a href="${contextPath}/pr/c001_002.do" class="link">#</a></li>
							</ul></li>
						<li><a href="#" class="link">자격시험</a>
							<ul class="three">
								<li><h3>국가기술자격</h3></li>
								<li><a href="#" class="link">기능사</a></li>
								<li><a href="#" class="link">산업기사</a></li>
								<li><a href="#" class="link">기사</a></li>
							</ul>
							<ul class="three" style="left: 240px;">
								<li><h3>민간자격</h3></li>
								<li><a href="#" class="link">한국사능력검정시험</a></li>
								<li><a href="#" class="link"></a></li>
								<li><a href="#" class="link"></a></li>
							</ul></li>
						<li><a href="#" class="link">sub3</a></li>
					</ul></li>
				<li><a href="#" class="link">문제만들기</a>
					<ul class="two">
						<li><a href="${contextPath}/problem_make/proMake_mainPage.do" class="link">문제만들기</a></li>
						<li><a href="${contextPath}/problem_make/colMake_mainPage.do" class="link">문제집만들기</a></li>
					</ul>
				</li>
				<li><a href="#" class="link">menu3</a>
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
				<li><a href="#" class="link">menu4</a></li>
				<li><a href="#" class="link">menu5</a></li>
				<li><a href="#" class="link">menu6</a></li>
				<li><a href="#" class="link">menu7</a></li>
			</ul>
		</nav>
	</div>
	<p style="clear: both;"></p>
</body>
</html>