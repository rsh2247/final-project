<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var images = [ "woman-working-office.jpg," ];
		$('#startbtn').click(function() {
			$("#contentbox").css('display', 'block');
			$("#wholebox").fadeOut(1000);
			$("#contentbox").fadeIn("slow");

		})

		$('.dropdown-toggle').click(function() {
			if ($(this).nextAll().attr('class') == 'dropdown') {
				$(this).nextAll().removeClass('dropdown');
				$(this).nextAll().addClass('dropdown_open');
			} else {
				$(this).nextAll().removeClass('dropdown_open');
				$(this).nextAll().addClass('dropdown');
			}
		})

		$('#startbtn').click(function() {

		})
	})
</script>
</head>
<style>
:root { -
	-blue: #3E60DB; -
	-darkgrey: #555; -
	-font: 'Open Sans', 'Apple SD Gothic Neo', 'Noto Sans CJK KR',
		'Noto Sans KR', '나눔바른고딕', '나눔고딕', '맑은고딕', 'Helvetica Neue',
		'Helvetica', 'Arial', sans-serif;
}

ul, li {
	list-style: none;
}

#slide {
	height: 600px;
	position: relative;
	overflow: hidden;
}

#slide ul {
	width: 400%;
	height: 100%;
	transition: 1s;
}

#slide ul:after {
	content: "";
	display: block;
	clear: both;
}

#slide li {
	float: left;
	width: 25%;
	height: 100%;
}

#slide li:nth-child(1) {
	background: #faa;
}

#slide li:nth-child(2) {
	background: #ffa;
}

#slide li:nth-child(3) {
	background: #faF;
}

#slide li:nth-child(4) {
	background: #aaf;
}

#slide input {
	display: none;
}

#slide label {
	display: inline-block;
	vertical-align: middle;
	width: 10px;
	height: 10px;
	border: 2px solid #666;
	background: #fff;
	transition: 0.3s;
	border-radius: 50%;
	cursor: pointer;
}

#slide .pos {
	text-align: center;
	position: absolute;
	bottom: 10px;
	left: 0;
	width: 100%;
	text-align: center;
}

#pos1:checked ~ul {
	margin-left: 0%;
}

#pos2:checked ~ul {
	margin-left: -100%;
}

#pos3:checked ~ul {
	margin-left: -200%;
}

#pos4:checked ~ul {
	margin-left: -300%;
}

#pos1:checked ~.pos>label:nth-child(1) {
	background: #666;
}

#pos2:checked ~.pos>label:nth-child(2) {
	background: #666;
}

#pos3:checked ~.pos>label:nth-child(3) {
	background: #666;
}

#pos4:checked ~.pos>label:nth-child(4) {
	background: #666;
}

#wholebox {
	overflow: hidden;
	width: 100%;
	height: 892px;
	background: linear-gradient(to bottom, rgb(77 76 107/ 19%) 0%, #1d1d25cc
		100%), url(${contextPath}/resources/image/woman-working-office.jpg);
	height: 892px;
	background: linear-gradient(to bottom, rgb(77 76 107/ 19%) 0%, #1d1d25cc
		100%), url(${contextPath}/resources/image/woman-working-office.jpg);
	position: absolute;
}

#backimage {
	z-index: -2;
}

#titlebox {
	width: 100%;
	padding: 20px 0 20px 0;
	margin: 230px auto 50px auto;
}

#title {
	font-family: "Merriweather Sans", -apple-system, BlinkMacSystemFont,
		"Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif,
		"Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol",
		"Noto Color Emoji";
	font-size: 3rem;
	color: #eee;
}

#titledesc {
	font-family: 'Open Sans', 'Apple SD Gothic Neo', 'Noto Sans CJK KR',
		'Noto Sans KR', '나눔바른고딕', '나눔고딕', '맑은고딕', 'Helvetica Neue',
		'Helvetica', 'Arial', sans-serif;
	color: #eee;
}

#startbtn {
	width: 120px;
	height: 50px;
	border: 2px solid #3E60DB;
	background-color: #3E60DB;
	color: #fff;
	border-radius: 25px;
	font: var(- -font);
	font-size: 22px;
	cursor: pointer;
}

#contentbox {
	height: 892px;
	background-color: #eee;
	text-align: left;
	display: flex;
}

#contentinnerbox {
	width: 1200px;
	height: 100%;
	background-color: #fff;
	margin: 0 auto 0 auto;
}

.dropdown {
	display: none;
}

.dropdown_open {
	display: block;
}

.dropdown-toggle {
	display: block;
	cursor: pointer;
}

#searchbox {
	width: 1150px;
	height: 80px;
	margin: 20px 25px 0 25px;
	background-color: #ccc;
	display: table-caption;
}

#search {
	width: 800px;
	height: 35px;
	margin: 20px 25px auto 25px;
	display: inline-block;
}

#searchbtn{
	width: 75px;
	height: 39px;
}

#menubox {
	background-color: #eee;
	width: 625px;
	height: 300px;
	margin: 20px 25px 20px 25px;
	float: left;
}

#prolist {
	border-collapse: collapse;
	width: 90%;
}

#date {
	float: left;
	width: 500px;
	height: 300px;
	margin: 20px 25px 20px 0px;
	background-color: #ccc;
}

#datelist {
	width: 90%;
	margin: 20px auto;
}

#article {
	width: 1150px;
	height: 400px;
	margin: 0 25px 0 25px; background-color : #ccc;
	display: flex;
	background-color: #ccc;
}
</style>
<body>
	<c:set var="title" value="Practice Everyday" />
	<div id="wholebox">
		<div id="titlebox">
			<p id="title">${title}</p>
			<hr
				style="margin: 20px auto 20px auto; width: 70px; height: 4px; border: 0px solid; background-color: #ccc;">
			<p id="titledesc">문제를 만들고 문제를 풀 수 있는 사이트입니다.</p>
		</div>
		<div>
			<!-- - <input type="text" id="search" name="search">-->
			<button id="startbtn">시작</button>
		</div>
	</div>
	<div id="contentbox">
		<div id="contentinnerbox">
			<div id="searchbox">
				<form action="">
					<input type="text" id="search" name="search"><button id="searchbtn">문제 검색</button>
				</form>
			</div>
			<div id="menubox">
				<table id="prolist">
					<tr style="border: 1px solid #fff;">
						<th colspan="2">최근 등록된 문제</th>
					</tr>
					<tr>
						<td>문제1</td>
						<td>문제2</td>
					</tr>
					<tr>
						<td>문제1</td>
						<td>문제2</td>
					</tr>
					<tr>
						<td>문제1</td>
						<td>문제2</td>
					</tr>
					<tr>
						<td>문제1</td>
						<td>문제2</td>
					</tr>
				</table>
			</div>
			<div id="date">
				<ul id="datelist">
					<li>다가오는 일정</li>
					<li>토익시험 2020 10 19일</li>
					<li>토플시험 2020 10 23일</li>
					<li>토익시험 2020 10 19일</li>
				</ul>

			</div>
			<div id="article">
				<div></div>

			</div>
		</div>

	</div>

	<!--  
	<div id="slide">
		<input type="radio" name="pos" id="pos1" checked> <input type="radio" name="pos" id="pos2"> <input type="radio" name="pos" id="pos3"> <input type="radio" name="pos" id="pos4">
		w<ul>
			<li><img class="img" alt="" src="${contextPath}/resources/image/55EF69943A51DD001B.jpg"></li>
			<li><img class="img" style="top: -50px" alt="" src="${contextPath}/resources/image/1920_1080_20150212120938978419.jpg"></li>
			<li></li>
			<li></li>
		</ul>
		<p class="pos">
			<label for="pos1"></label> <label for="pos2"></label> <label for="pos3"></label> <label for="pos4"></label>
		</p>
	</div>
	-->
</body>
</html>