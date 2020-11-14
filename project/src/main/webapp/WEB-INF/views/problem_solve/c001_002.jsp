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
	margin-top: 50px;
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

#foot {
	width: 1100px;
	height: 400px;
	margin: 50px auto 50px auto;
	border: 1px solid #ddd;
	border-radius: 10px;
}
</style>
</head>
<body>
	<div class="menu">
		<div id="title">
			<h2 style="font-weight: 500; font-size: 2.4rem;">${category}</h2>
		</div>
		<hr id="bar_001">
		<div id="listbox">
			<ul>
				<li>
					<button class="btn"
						onclick="location.href='list.pro?category=${category}&pageNum=1'">
						<p class="btnName">커스텀 문제</p>
						<p class="desc">사이트 회원들이 만든 문제들입니다.</p>
					</button>
					<hr class="vertical_bar"></hr>
					<button class="btn"
						onclick="location.href='userColselect_page.pro?category=${category}'">
						<p class="btnName">커스텀 문제집</p>
						<p class="desc">회원들이 만든 문제들로 만든 문제집입니다.</p>
					</button>
					<hr class="vertical_bar"></hr>
					<button class="btn"
						onclick="location.href='pastColselect_page.pro?category=${category}'">
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
		<div id="foot">
			<div class="section">
				<div class="subtitle">공인어학시험</div>
				<div class="category_list">
					<ul>
						<c:forEach var="list" items="${categorylist}">
							<li>
							<div>${list.CATEGORY_ID}</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>