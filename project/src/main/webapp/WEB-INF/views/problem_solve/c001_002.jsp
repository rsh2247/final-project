<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.menu {
	margin-top: 70px;
}

.menu_table {
	margin: 50px auto 0 auto;
}

.menu_table tr td {
	padding: 15px;
}

.btn {
	width: 250px;
	height: 100px;
	padding: 5px 12px 5px 12px;
	border: 0px;
	border-bottom: 5px solid #3E60DB;
	background-color: #3E60DB;
	color: #ccddff;
	margin: 0 5px 0 5px;
	transition: width 2s, height 2s, background-color 500ms, transform 2s;
}

.btn:hover {
	border-bottom: 5px solid #fff;
	cursor: pointer;
	color: #fff;
}

.btn:before {
	
}

#title {
	width: 100%;
	font-size: 2rem;
	font-family: "Merriweather Sans", -apple-system, BlinkMacSystemFont,
		"Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif,
		"Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol",
		"Noto Color Emoji";
}

#bar_001 {
	max-width: 3.25rem;
	border: 2px solid #3E60DB;
	margin: 20px auto 20px auto;
}

#listbox {
	margin-top: 10px;
	width: 100%;
	height: 107px;
	background-color: #3E60DB;
}

.vertical_bar {
	width: 2px;
	height: 50px;
	display: inline-block;
	position: relative;
	top: 25px;
	border: 0px;
	margin: 5px 0 auto 0;
	background-color: #ccddff;
	user-select: none;
}

.btnName {
	font-size: 24px;
	margin-bottom: 4px;
}

.desc {
	font-family: 'Open Sans', 'Apple SD Gothic Neo', 'Noto Sans CJK KR',
		'Noto Sans KR', '나눔바른고딕', '나눔고딕', '맑은고딕', 'Helvetica Neue',
		'Helvetica', 'Arial', sans-serif !important;
	font-size: 12px;
	color: #b3cdff;
	margin-top: 5px;
}

.category_ul li {
	list-style: none;
	float: left;
}

#foot {
	width: 1100px;
	margin: 50px auto 50px auto;
	padding: 0px 0 15px 0;
	border: 1px solid #ddd;
	border-radius: 10px;
}

.fontstyle {
	letter-spacing: -.8px;
	font-weight: bold;
}

.section {
	width: 1030px;
	text-align: left;
	padding: 5px 5px 5px 30px;
	margin: 20px auto 20px auto;
	border-bottom: 1px solid #ddd;
}

.section:last-child {
	border: 0px;
}

.subtitle {
	display: inline-block;
	font-size: 24px;
	float: left;
	line-height: 60px;
	margin-right: 30px;
}

.subtitle2 {
	display: inline-block;
	font-size: 20px;
	float: left;
	width: 140px;
	line-height: 60px;
	margin-right: 30px;
	text-align: center;
}

.category_list {
	display: inline-block;
	width: 825px;
}

.list {
	margin: 10px 15px 10px 15px;
	width: 130px;
	line-height: 40px;
	display: inline-block;
	border-radius: 5px;
	font-size: 16px;
	font-weight: bold;
	letter-spacing: -.8px;
	text-align: center;
	cursor: pointer;
	transition: ease all 200ms;
}

.list:hover {
	color: #fff;
	background-color: #3E60DB;
}

.selectedList {
	color: #fff;
	background-color: #3E60DB;
}

#top {
	width: 1100px;
	height: 100px;
	margin: 0 auto 0 auto;
	text-align: left;
	border-bottom: 3px solid #eee;
}
.bigtitlebox{
	width: 160px;
	height: 100px;
	border-bottom: 3px solid #3E60DB;
	display: inline-block;
}
.bigtitle {
	position:relative;
	top:40px;
	font-size: 30px;
	text-align: center;
	color: #3E60DB;
	width: 100%;
	height: 100px;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var list = $('.list');
		for (var i = 0; i < list.length; i++) {
			if ($(list[i]).text().trim() == '${param.category}') {
				$(list[i]).addClass('selectedList');
			}
		}
	})
</script>

</head>
<body>
	<div class="menu">
		<c:if test="${!empty param.category}">
			<div id="title">
				<h2 style="font-weight: 500; font-size: 2.4rem;">${param.category}</h2>
			</div>
			<hr id="bar_001">
			<div id="listbox">
				<ul>
					<li>
						<button class="btn"
							onclick="location.href='list.pro?category=${param.category}&pageNum=1'">
							<p class="btnName">커스텀 문제</p>
							<p class="desc">사이트 회원들이 만든 문제들입니다.</p>
						</button>
						<hr class="vertical_bar"></hr>
						<button class="btn"
							onclick="location.href='userColselect_page.pro?category=${param.category}'">
							<p class="btnName">커스텀 문제집</p>
							<p class="desc">회원들이 만든 문제들로 만든 문제집입니다.</p>
						</button>
						<hr class="vertical_bar"></hr>
						<button class="btn"
							onclick="location.href='pastColselect_page.pro?category=${param.category}'">
							<p class="btnName">기출 문제집</p>
							<p class="desc">회원들이 만든 문제들로 만든 문제집입니다.</p>
						</button>
						<hr class="vertical_bar"></hr>
						<button class="btn">
							<p class="btnName">오답 문제집</p>
							<p class="desc">회원들이 만든 문제들로 만든 문제집입니다.</p>
						</button>
					</li>
				</ul>
			</div>
		</c:if>
		<c:if test="${empty param.category}">
			<div id="top">	
				<div class="bigtitlebox">
					<div class="bigtitle">문제 풀기</div>
				</div>
				<div>
					<c:forEach items="${problemlist}" var="list">
			${list.PRO_NUM}
			</c:forEach>
				</div>
			</div>
		</c:if>
		<div id="foot">
			<div class="section">
				<div class="subtitle fontstyle">공인어학시험</div>
				<div class="category_list">
					<ul class="category_ul">
						<c:forEach var="list" items="${categorylist}">
							<c:if test="${fn:substring(list.CATEGORY_ID, 0, 2) eq 10}">
								<li>
									<div class="list"
										onclick='location.href="mainPage?category=${list.CATEGORY_NAME}"'>
										${list.CATEGORY_NAME} <input type="hidden" class="colorfordiv"
											value="${list.CATEGORY_NAME}">
									</div>
								</li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="section">
				<div class="subtitle fontstyle" style="width: 100%">국가기술자격</div>
				<div class="subtitle2 fontstyle">기능사</div>
				<div class="category_list">
					<ul class="category_ul">
						<c:forEach var="list" items="${categorylist}">
							<c:if test="${fn:substring(list.CATEGORY_ID, 0, 2) eq 21}">
								<li>
									<div class="list"
										onclick='location.href="mainPage?category=${list.CATEGORY_NAME}"'>${list.CATEGORY_NAME}
									</div>
								</li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
				<div class="subtitle2 fontstyle">산업기사</div>
				<div class="category_list">
					<ul class="category_ul">
						<c:forEach var="list" items="${categorylist}">
							<c:if test="${fn:substring(list.CATEGORY_ID, 0, 2) eq 22}">
								<li>
									<div class="list"
										onclick='location.href="mainPage?category=${list.CATEGORY_NAME}"'>${list.CATEGORY_NAME}
									</div>
								</li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
				<div class="subtitle2 fontstyle">기사</div>
				<div class="category_list">
					<ul class="category_ul">
						<c:forEach var="list" items="${categorylist}">
							<c:if test="${fn:substring(list.CATEGORY_ID, 0, 2) eq 23}">
								<li>
									<div class="list"
										onclick='location.href="mainPage?category=${list.CATEGORY_NAME}"'>${list.CATEGORY_NAME}
									</div>
								</li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>