<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/fonts/font-awesome.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/xeicon.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
<script src="https://kit.fontawesome.com/1299206db1.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
	var images = [ "woman-working-office.jpg," ];
	$('#startbtn').click(function() {
	    $("#wholebox").fadeOut(1000);
	    $("#contentbox").fadeIn(1200, function() {
		$("#contentbox").css('display', 'block');
	    });

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
    function pageMove(action) {
	var form = document.createElement("form");
	form.setAttribute("method", "post");
	form.setAttribute("action", "${contextPath}/" + action);
	document.body.appendChild(form);
	form.submit();
    }
</script>
</head>
<style>
:root { -
	-blue: #3E60DB; -
	-darkgrey: #555; -
	-font: 'Open Sans', 'Apple SD Gothic Neo', 'Noto Sans CJK KR', 'Noto Sans KR', '나눔바른고딕', '나눔고딕', '맑은고딕', 'Helvetica Neue', 'Helvetica', 'Arial', sans-serif;
}

#wholebox {
	overflow: hidden;
	width: 100%;
	background: linear-gradient(to bottom, rgb(77 76 107/ 19%) 0%, #1d1d25cc 100%), url(${contextPath}/resources/image/woman-working-office.jpg);
	height: 890px;
	background: linear-gradient(to bottom, rgb(77 76 107/ 19%) 0%, #1d1d25cc 100%), url(${contextPath}/resources/image/woman-working-office.jpg);
	position: absolute;
}

#title001 {
	text-align: center;
	width: 750px;
	font-size: 42px;
	color: #3E60DB;
	margin: 100px auto 25px auto;
	padding: 30px 30px 30px 30px;
	border: 4px solid #3E60DB;
	border-radius: 80px;
	padding: 30px 30px 30px 30px;
}

.title002box {
	width: 500px;
	height: 30px;
	border-bottom: 2px solid #eee;
}

.title002 {
	padding: 0 10px 15px 10px;
	height: 30px;
	font: 18px;
	font-weight: bold;
	color: #3E60DB;
	border-bottom: 2px solid #3E60DB;
	display: inline-block;
	border-bottom: 2px solid #3E60DB;
	color: #3E60DB;
}

.listtable {
	border-collapse: collapse;
	margin: 10px auto 0 auto;
	width: 500px;
}

.listtable td {
	border-bottom: 1px solid #eee;
	line-height: 35px;
}

.socket {
	width: 500px;
	margin: 0 10px 0 10px;
	display: inline-block;
}

.userimage {
	width: 75px;
	height: 75px;
	margin: 30px auto 0 auto;
	border-radius: 50px;
}
#userlist{
	margin: 0 auto 0 auto;
}
#userlist li {
	list-style: none;
	float: left;
}
#bar_001 {
    max-width: 100px;
    border: 2px solid #3E60DB;
    margin: 40px auto 60px auto;
}
</style>
<body>
	<c:set var="title" value="Practice Everyday" />
	<div class="wholebox" id="wholebox">
		<div id="titlebox">
			<p id="title">${title}</p>
			<hr style="margin: 20px auto 20px auto; width: 70px; height: 4px; border: 0px solid; background-color: #ccc;">
			<p id="titledesc">
				<spring:message code="site.main" />
			</p>
		</div>
		<div>
			<!-- - <input type="text" id="search" name="search">-->
			<button id="startbtn">시작</button>
		</div>
	</div>
	<%-- 	<jsp:forward page="/mainPage/groupRank.main"/> --%>
	<div id="contentbox">
		<div id="title001">Practice Everyday</div>
		<hr id="bar_001">
		<div style="padding: 0 25px 0 25px">
			<div class="socket">
				<div class="title002box">
					<div class="title002">최근 추가된 문제</div>
					<i class="fas fa-plus" style="color: #3E60DB; float: right; padding: 0 10px 0 0; position: relative; top: 5px;"></i>
				</div>
				<div>
					<table class="listtable">
						<tr>
							<th width="300px"></th>
							<th width="80px"></th>
							<th></th>
						</tr>
						<c:forEach var="list" items="${problem}" begin="0" end="4">
							<tr>
								<td style="padding-left: 10px;">${list.PRO_NAME}</td>
								<td style="font-size: 14px;">${list.CATEGORY_NAME}</td>
								<td style="font-size: 14px;">${list.USER_ID}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<div class="socket">
				<div class="title002box">
					<div class="title002">최근 추가된 문제집</div>
					<i class="fas fa-plus" style="color: #3E60DB; float: right; padding: 0 10px 0 0; position: relative; top: 5px;"></i>
				</div>
				<div>
					<table class="listtable">
						<tr>
							<th width="300px"></th>
							<th width="80px"></th>
							<th></th>
						</tr>
						<c:forEach var="list" items="${collection}" begin="0" end="4">
							<tr>
								<td style="padding-left: 10px;">${list.COL_NAME}</td>
								<td style="font-size: 14px;">${list.CATEGORY_NAME}</td>
								<td style="font-size: 14px;">${list.USER_ID}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<div style="padding: 0 25px 0 25px; margin: 50px auto 50px auto;">
				<div style="height: 40px; border-bottom: 2px solid #eee;">
					<div style="height: 40px; border-bottom: 2px solid #3E60DB; display: inline-block; padding: 0 10px 0 10px; font-size: 18px; color: #3E60DB; font-weight: bold;">명예의 전당</div>
				</div>
				<ul id="userlist">
					<c:forEach var="list" items="${userlist}" begin="0" end="4">
						<li style="margin: 0 50px 0 50px; text-align: center;">
							<div>
								<img class="userimage" src="${contextPath}/resources/image/${list.USER_IMAGE}">
								<div style="color: #555; margin: 10px 0 10px 0; text-align: center;">${list.USER_ID} 님</div>
								<div>${list.SCORE_TOTALPOINT } 점</div>
							</div>
						</li>
					</c:forEach>
				</ul>
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