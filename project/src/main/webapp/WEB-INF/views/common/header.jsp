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
<script type="text/javascript">
	function tagPost() {
		var form = document.getElementById('logoutForm');
		form.submit();
	}
</script>
<style type="text/css">
.container {
	height: 75px;
	padding: 0 15px 0 15px;
	border-bottom: 2px solid #eee;
}

#loginbar {
	position: absolute;
	float: right;
	width: 100%;
}

.login {
	float: right;
	margin: 10px;
	color: #666;
	font-size: 14px;
}

.login a {
	text-decoration: none;
	color: #666;
}

.login a:hover {
	text-decoration: underline;
	cursor: pointer;
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
	width: 1000px;
	height: 60px; /* 메인 메뉴의 높이 */
	display: inline-block;
	position: relative;
	margin: 0 auto 0 auto;
	top: -38px;
	z-index: 1;
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
.link:hover{
	color: white;
}

.one {
	float: left;
	width: 100%;
	margin-top: 30px;
}

.one>li {
	float: left;
	position: relative;
	margin: 15px auto;
	height: 30px;
	width: 120px;
	border-bottom: 2px solid #eee;
}

.one>li:hover {
	border-bottom: 2px solid #3E60DB;
}

.one>li:hover>.link {
	color: #3E60DB;
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
	box-shadow: -5px 0px 8px -5px #ddd,5px 0px 8px -5px #ddd;
}

.two>li {
	position: relative;
	background-color: #fff;
	height: 30px;
	width: 120px;
	height: 30px;
}

.two>li:hover {
	background-color: #3E60DB;
}

.two>li:hover>.link {
	color: white;
}

.three {
	margin: 0px;
	left: 120px;
	top: 0px;
	position: absolute;
	background: white;
	color: black;
	z-index: 2;
}
.three>li:first-child{
	border-top: 2px solid #3E60DB;
}
.three>li:hover {
	background-color: #3E60DB;
}

.subtitle{
	background-color: #fff;
}
</style>
</head>
<body>
	<div class="container">
		<img src="${contextPath}/resources/image/duke_swing.gif" onclick="location.href='${contextPath}/mainPage/mainPage001.do'" style="position: relative; top: -25px; left: -250px; cursor: pointer;" />
		<nav id="navi">
			<sec:authorize access="isAnonymous()">
				<div id='loginbar'>
					<p class="login">
						<a href="${contextPath}/user/loginPage.do">로그인</a> | <a href="${contextPath}/user/signUp.do">회원가입</a>
					</p>
				</div>
			</sec:authorize>
			<sec:authorize access="hasAnyRole('ROLE_USER')">
				<div id='loginbar'>
					<form id="logoutForm" action="/logout.logout" method="post">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<p class="login">
							<a href="${contextPath}/user/userPage.do"><sec:authentication property="principal.username"/></a> | <a href="${contextPath}/logout">로그아웃</a>
						</p>
					</form>
				</div>
			</sec:authorize>
			<ul class="one">
				<li><a href="#" class="link">문제풀기</a>
					<ul class="two">
						<li><a href="#" class="link">공인어학시험</a>
							<ul class="three" style="top: -2px;">
								<li class="subtitle"><h3>영어</h3></li>
								<li><a href="${contextPath}/problem_solve/c001_002.do?category=TOEIC" class="link">TOEIC</a></li>
								<li><a href="${contextPath}/problem_solve/c001_002.do?category=TOEFL" class="link">TOEFL</a></li>
								<li><a href="${contextPath}/problem_solve/c001_002.do?category=TEPS" class="link">TEPS</a></li>
								<li><a href="" class="link"> </a></li>
							</ul>
							<ul class="three" style="left: 240px; top: -2px;">
								<li class="subtitle"><h3>중국어</h3></li>
								<li><a href="${contextPath}/problem_solve/c001_002.do?category=HSK" class="link">HSK</a></li>
								<li><a href="" class="link"></a></li>
								<li><a href="" class="link"></a></li>
								<li><a href="" class="link"></a></li>
							</ul>
							<ul class="three" style="left: 360px; top: -2px;">
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
						<li><a href="${contextPath}/editor/SmartEditor2.do" class="link">sub3</a></li>
					</ul></li>
				<li><a href="#" class="link">문제만들기</a>
					<ul class="two">
						<li><a href="${contextPath}/problem_make/proMake_mainPage.do" class="link">문제만들기</a></li>
						<li><a href="${contextPath}/problem_make/colMake_mainPage.do" class="link">문제집만들기</a></li>
					</ul></li>
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