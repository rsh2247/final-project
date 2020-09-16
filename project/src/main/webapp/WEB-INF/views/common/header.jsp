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

.toolbar {
	
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

#topMenu {
	height: 30px; /* 메인 메뉴의 높이 */
	margin: 15px auto;
    display: inline-block;
    position: relative;
    top: -60px;
}

#topMenu ul { /* 메인 메뉴 안의 ul을 설정함: 상위메뉴의 ul+하위 메뉴의 ul */
	list-style-type: none; /* 메인 메뉴 안의 ul 내부의 목록 표시를 없애줌 */
	margin: 0px; /* 메인 메뉴 안의 ul의 margin을 없앰 */
	padding: 0px; /* 메인 메뉴 안의 ul의 padding을 없앰 */
}

#topMenu ul li { /* 메인 메뉴 안에 ul 태그 안에 있는 li 태그의 스타일 적용(상위/하위메뉴 모두) */
	color: 2d2d; /* 글씨 색을 흰색으로 설정 */
	background-color: #FFF; /* 배경 색을 RGB(2D2D2D)로 설정 */
	float: left; /* 왼쪽으로 나열되도록 설정 */
	line-height: 30px; /* 텍스트 한 줄의 높이를 30px로 설정 */
	vertical-align: middle; /* 세로 정렬을 가운데로 설정 */
	text-align: center; /* 텍스트를 가운데로 정렬 */
	position: relative; /* 해당 li 태그 내부의 top/left 포지션 초기화 */
}

.menuLink, .submenuLink { /* 상위 메뉴와 하위 메뉴의 a 태그에 공통으로 설정할 스타일 */
	text-decoration: none; /* a 태그의 꾸밈 효과 제거 */
	display: block; /* a 태그의 클릭 범위를 넓힘 */
	width: 120px; /* 기본 넓이를 150px로 설정 */
	font-size: 12px; /* 폰트 사이즈를 12px로 설정 */
	font-weight: bold; /* 폰트를 굵게 설정 */
	font-family: "Trebuchet MS", Dotum; /* 기본 폰트를 영어/한글 순서대로 설정 */
	transition: 200ms ease all;
}

.menuLink { /* 상위 메뉴의 글씨색을 흰색으로 설정 */
	color: black;
}

.topMenuLi:hover .menuLink { /* 상위 메뉴의 li에 마우스오버 되었을 때 스타일 설정 */
	color: white; /* 글씨 색 빨간색 */
	background-color: #4d4d4d; /* 배경색을 밝은 회색으로 설정 */
	transition: 800ms ease all;
}

.submenuLink { /* 하위 메뉴의 a 태그 스타일 설정 */
	color: #2d2d2d; /* 글씨 색을 RGB(2D2D2D)로 설정 */
	background-color: white; /* 배경색을 흰색으로 설정 */
	border: solid 0px black; /* 테두리를 설정 */
	margin-top: -1px; /* 위 칸의 하단 테두리와 아래칸의 상단 테두리가 겹쳐지도록 설덩 */
}

.longLink { /* 좀 더 긴 메뉴 스타일 설정 */
	width: 190px; /* 넓이는 190px로 설정 */
}

.submenu { /* 하위 메뉴 스타일 설정 */
	position: absolute; /* html의 flow에 영향을 미치지 않게 absolute 설정 */
	height: 0px; /* 초기 높이는 0px로 설정 */
	overflow: hidden; /* 실 내용이 높이보다 커지면 해당 내용 감춤 */
	transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(기본) */
	-webkit-transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 크롬/사파라ㅣ) */
	-moz-transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 파폭) */
	-o-transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 오페라) */
}

.topMenuLi:hover .submenu { /* 상위 메뉴에 마우스 모버한 경우 그 안의 하위 메뉴 스타일 설정 */
	height: auto; /* 높이를 93px로 설정 */
}

.submenuLink:hover { /* 하위 메뉴의 a 태그의 마우스 오버 스타일 설정 */
	color: red; /* 글씨색을 빨간색으로 설정 */
	background-color: #dddddd; /* 배경을 RGB(DDDDDD)로 설정 */
}
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
		<img src="${contextPath}/resources/image/duke_swing.gif" style="position: relative; top: -70px; left: -150px;" />
		<nav id="topMenu">
			<ul>
				<li class="topMenuLi"><a class="menuLink" href="">문제풀기</a>
					<ul class="submenu">
						<li><a href="" class="submenuLink">공인어학시험</a></li>
						<li><a href="" class="submenuLink">국가기술자격</a></li>
						<li><a href="" class="submenuLink">\</a></li>
						<li><a href="" class="submenuLink">\</a></li>
					</ul>
					<ul class="submenu" style="left: 120px;">
						<li><a href="" class="submenuLink">기능사</a></li>
						<li><a href="" class="submenuLink">산업기사</a></li>
						<li><a href="" class="submenuLink">기사</a></li>
						<li><a href="" class="submenuLink">기사</a></li>
					</ul>
					</li>
				<li class="topMenuLi"><a class="menuLink" href="">문제출제</a></li>
				<li>|</li>
				<li class="topMenuLi"><a class="menuLink" href="">그룹</a>
					<ul class="submenu">
						<li><a href="" class="submenuLink">1</a></li>
						<li><a href="" class="submenuLink">2</a></li>
						<li><a href="" class="submenuLink">3</a></li>
					</ul></li>
				<li class="topMenuLi"><a class="menuLink" href="">게시판</a></li>
				<li>|</li>
				<li class="topMenuLi"><a class="menuLink" href="">랭킹</a></li>
				<li>|</li>
				<li class="topMenuLi"><a class="menuLink" href="">강의</a></li>
				<li>|</li>
				<li class="topMenuLi"><a class="menuLink" href="">일정</a></li>
			</ul>
		</nav>
	</div>
	<p style="clear: both;"></p>
</body>
</html>