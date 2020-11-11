<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	function tagPost() {
		var form = document.getElementById('logoutForm');
		form.submit();
	}
	$(".two li").hover(function () {
		$(this).children("ul").slideToggle(500);
	})
</script>
<style type="text/css">
.container {
	height: 80px;
	padding: 0 15px 0 15px;
	border-bottom: 2px solid #eee;
}

#loginbox {
	width: 1200px;
	height: 45px;
	margin: 0 auto;
}

#loginbar {
	float: right;
}

#image {
	display: inline-block;
	position: relative;
	float: left;
	cursor: pointer;
	margin: 0 50px 0 50px;
	top: -40px;
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
	width: 1200px;
	height: 30px; /* 메인 메뉴의 높이 */
	display: inline-block;
	margin: 0 auto 0 auto;
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

.link:hover {
	color: white;
}

.one {
	float: left;
	width: 900px;
	float: left;
}

.one>li {
	float: left;
	position: relative;
	height: 35px;
	width: 120px;
	border-bottom: 2px solid #eee;
	z-index: 1;
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
	top: 35px;
	box-shadow: -5px 5px 8px -5px rgba(0, 0, 0, 0.15), 5px 5px 8px -5px rgba(0, 0, 0, 0.15);;
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

.two>li:last-child{
	border-bottom: 2px solid #3E60DB;
}

.three {
	margin: 0px;
	left: 120px;
	top: 0px;
	position: absolute;
	background: white;
	color: black;
	
}

.three>li:first-child {
	border-top: 2px solid #3E60DB;
}
.three li{
	z-index: 2;
}

.three>li a:hover {
	background-color: #3E60DB;
}

.three>li:last-child{
	border-bottom: 2px solid #3E60DB;
}

.subtitle {
	background-color: #fff;
}
h3 {
	height: 30px;
	cursor: default;
}
/* us */
.flag {
	display: inline-block;
	position: relative;
	width: 16px;
	height: 11px;
	background: url('https://www.flag-sprites.com/img/flags.png') no-repeat;
	margin-top: 14px;
} 
.flag.flag-us {background-position: 0 -154px}
.flag.flag-kr{background-position:-80px -77px}
</style>
</head>
<body>
	<div class="container">
		<div id="loginbox">
			<sec:authorize access="isAnonymous()">
				<div id='loginbar'>
					<a href="${contextPath}/mainPage.main?lang=ko"><img class="flag flag-kr"/></a>
					<a href="${contextPath}/mainPage.main?lang=en"><img class="flag flag-us"/></a>
					<p class="login">
						<a href="${contextPath}/user/loginPage.do"><spring:message code="site.signin"/></a> | 
						<a href="${contextPath}/user/signUp.do"><spring:message code="site.signup"/></a>
					</p>
				</div>
			</sec:authorize>
			<sec:authorize access="hasAnyRole('ROLE_USER')">
				<div id='loginbar'>
					<form id="logoutForm" action="/logout.logout" method="post">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<p class="login">
							<a href="${contextPath}/userPage_col.user"><sec:authentication
									property="principal.username" /></a> | <a
								href="${contextPath}/logout"><spring:message code="site.signout"/></a>
						</p>
					</form>
				</div>
			</sec:authorize>
			<button onclick="location.href='${contextPath}/managerPage'">관리자</button>
		</div>
		<nav id="navi">
			<img id="image" src="${contextPath}/resources/image/logo2.png"
				onclick="location.href='${contextPath}/mainPage.main'" />
			<ul class="one">
				<li><a href="#" class="link"><spring:message code="site.menu1"/></a>
					<ul class="two">
						<li><a href="#" class="link"><spring:message code="site.menu1_1"/></a>
							<ul class="three" style="top: -2px;">
								<li class="subtitle"><h3><spring:message code="site.menu1_1_1"/></h3></li>
								<li><a
									href="${contextPath}/problem_solve/c001_002.do?category=TOEIC"
									class="link">TOEIC</a></li>
								<li><a
									href="${contextPath}/problem_solve/c001_002.do?category=TOEFL"
									class="link">TOEFL</a></li>
								<li><a
									href="${contextPath}/problem_solve/c001_002.do?category=TEPS"
									class="link">TEPS</a></li>
								<li><a href="" class="link"> </a></li>
							</ul>
							<ul class="three" style="left: 240px; top: -2px;">
								<li class="subtitle"><h3><spring:message code="site.menu1_1_2"/></h3></li>
								<li><a
									href="${contextPath}/problem_solve/c001_002.do?category=HSK"
									class="link">HSK</a></li>
								<li><a href="" class="link"></a></li>
								<li><a href="" class="link"></a></li>
								<li><a href="" class="link"></a></li>
							</ul>
							<ul class="three" style="left: 360px; top: -2px;">
								<li><h3><spring:message code="site.menu1_1_3"/></h3></li>
								<li><a
									href="${contextPath}/problem_solve/c001_002.do?category=JLPT"
									class="link">JLPT</a></li>
								<li><a href="" class="link"></a></li>
								<li><a href="${contextPath}/pr/c001_002.do" class="link"></a></li>
								<li><a href="${contextPath}/pr/c001_002.do" class="link">#</a></li>
							</ul></li>
						<li><a href="#" class="link"><spring:message code="site.menu1_2"/></a>
							<ul class="three">
								<li><h3><spring:message code="site.menu1_2_1"/></h3></li>
								<li><a href="#" class="link"><spring:message code="site.menu1_2_2"/></a></li>
								<li><a href="#" class="link"><spring:message code="site.menu1_2_3"/></a></li>
								<li><a href="#" class="link"><spring:message code="site.menu1_2_4"/></a></li>
							</ul>
							<ul class="three" style="left: 240px;">
								<li><h3><spring:message code="site.menu1_2_5"/></h3></li>
								<li><a href="#" class="link"><spring:message code="site.menu1_2_6"/></a></li>
								<li><a href="#" class="link"></a></li>
								<li><a href="#" class="link"></a></li>
							</ul></li>
					</ul></li>
				<li><a href="#" class="link"><spring:message code="site.menu2"/></a>
					<ul class="two">
						<li><a href="${contextPath}/problem_make/proMake_mainPage.do"
							class="link"><spring:message code="site.menu2_1"/></a></li>
						<li><a href="${contextPath}/problem_make/colMake_mainPage.do"
							class="link"><spring:message code="site.menu2_2"/></a></li>
					</ul></li>
				<li><a href="${contextPath}/group/groupmain" class="link"><spring:message code="site.menu3"/></a></li>
				<li><a href="${contextPath}/F/F_P001/listScore.page" class="link"><spring:message code="site.menu4"/></a></li>
				<li><a href="${contextPath}/calendar_main.cal" class="link"><spring:message code="site.menu5"/></a></li>
				<!--  
				<li><a href="#" class="link">게시판</a>
					<ul class="two">
						<li><a href="${contextPath}/H/H_P001/listArticles.page"
							class="link">자유게시판</a></li>
					</ul></li>
					-->
				<li><a href="${contextPath}/lecture/main.do" class="link"><spring:message code="site.menu6"/></a></li>
			</ul>
		</nav>
	</div>
	<p style="clear: both;"></p>
</body>
</html>