<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#previewLayer {
	width: 100%;
	height: 100%;
	background-color: rgb(0, 0, 0, 25%);
	position: fixed;
	text-align: left;
	z-index: 1;
	top: 0px;
	display: none;
	z-index: 1
}

ul {
	list-style: none;
}

#previewBox {
	width: 800px;
	height: 600px;
	background-color: #fff;
	position: relative;
	margin: 200px auto;
	z-index: 1;
}

#ulbox {
	list-style: none;
	width: 95%;
	height: 90%;
	margin: auto;
	position: relative;
	top: 20px;
}

#leftbox {
	width: 200px;
	height: 550px;
	background-color: #eee;
	margin: 25px 0 10px 25px;
	float: left;
}

#lefttop_blank {
	height: 75px;
}

#profile {
	width: 100%;
	height: 70px;
	border-top: 1px solid #fff;
	border-bottom: 1px solid #fff;
	padding: 15px 0 15px 0;
}

#profile li {
	padding-left: 5px;
}

#profileImage {
	width: 70px;
	height: 100%;
	margin-left: 15px;
	float: left;
	border: 1px solid #fff;
	float: left;
}

#cafeinfo {
	width: 100%;
	height: 300px;
	text-align: left;
	margin: 10px 0 10px 0;
}

#cafeinfo ul {
	padding-left: 20px;
}

#rightbox {
	width: 525px;
	height: 550px;
	margin: 25px 25px 25px 25px;
	float: right;
	background-color: #eee;
}

#cafedesc {
	width: 100%;
	height: 150px;
	background-color: #fff;
}

#articlebox {
	height: 350px;
}

#articlebox li {
	padding: 5px 0 5px 10px;
}

#rightbottom {
	text-align: right;
}

#joinbtn {
	width: 100%;
	height: 40px;
}

#btn {
	width: 120px;
	height: 30px;
}

.header {
	border-bottom: 2px solid #555;
	padding: 10px 0 10px 10px;
	font-size: large;
}
</style>
</head>
<body>
	<div id="previewLayer">
		<div id="previewBox">
			<div id="leftbox">
				<div id="lefttop_blank"></div>
				<div id="profile">
					<div id="profileImage"></div>
					<ul>
						<li><label id="groupName"></label></li>
						<li>since <label id="groupDate"></label></li>
					</ul>
				</div>
				<div id="cafeinfo">
					<ul>
						<li>카페등급</li>
						<li>카페인원수</li>
						<li>기타</li>
						<li>등등</li>
					</ul>
				</div>
				<button id="joinbtn">카페 가입하기</button>
				<c:if test="">
				</c:if>
			</div>
			<div id="rightbox">
				<div id="cafedesc">
					<ul>
						<li class="header">카페소개</li>
						<li style="padding: 10px 0 10px 10px;">대충 좋은 카페입니다.</li>
					</ul>
				</div>
				<div id="articlebox">
					<ul>
						<li class="header">최근 게시글</li>
						<li>게시글1</li>
						<li>게시글2</li>
						<li>게시글2</li>
					</ul>
				</div>
				<div id="rightbottom">
					<form action="groupPage_main.group" method="post">
						<input id="groupNum" type="hidden" name="num" value="">
						<button id="btn">더보기</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>