<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
	$('.alink').click(function() {
	    $(this).parent().submit();
	})
	$('#cafeinfobtn').click(function() {
	    $('#myprofile').css('display', 'none');
	    $('#profile').css('display', 'block');
	})
	$('#myinfobtn').click(function() {
	    $('#profile').css('display', 'none');
	    $('#myprofile').css('display', 'block');
	})
    })
</script>
<style type="text/css">
* {
	list-style: none;
}

#contentbox {
	min-height: 1200px;
	margin-top: 30px;
	margin-bottom: 50px;
}

#leftmenu {
	width: 200px;
	height: 100%;
	float: left;
	background-color: #fff;
}

#mainbox {
	width: 850px;
	min-height: 100%;
	margin-left: 25px;
	margin-bottom: 30px;
	float: left;
}

#profiletop {
	width: 100%;
	min-height: 30px;
	border-top: 2px solid #555;
}

#profile {
	width: 100%;
	height: 100px;
	border-top: 1px solid #eee;
	border-bottom: 1px solid #eee;
	padding: 15px 0 15px 0;
}

#myprofile {
	width: 100%;
	height: 100px;
	border-top: 1px solid #eee;
	border-bottom: 1px solid #eee;
	padding: 15px 0 15px 0;
	display: none;
}

#myprofileImage {
	width: 70px;
	height: 100%;
	margin: 0px 8px 0px 8px;
	float: left;
	border: 1px solid #fff;
}

#userimgProfile {
	width: 100%;
	height: 100%;
	border-radius: 100px;
}

#profileImage {
	width: 70px;
	height: 100%;
	margin: 0px 8px 0px 8px;
	float: left;
	border: 1px solid #fff;
}

#cafeinfo {
	width: 100%;
	text-align: left;
	margin: 10px 0 10px 0;
}

#cafeinfo ul {
	padding-left: 20px;
}

#boardlist1 {
	border-top: 2px solid #555;
	border-bottom: 1px solid #ccc;
	padding: 10px 0 10px 15px;
	text-align: left;
	padding: 10px 0 10px 15px
}

#boardlist2 {
	border-bottom: 2px solid #555;
	text-align: left;
}

#replylist {
	width: 100%;
	text-align: left;
	padding: 10px 0 10px 15px;
}

.recentReply {
	width: inherit;
	height: 1.2em;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.linkbtn {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	background-color: transparent;
	border: none;
	font-size: medium;
	font-family: Inter, "Noto Sans KR", "Noto Sans JP", "Malgun Gothic", "맑은 고딕", sans-serif;
	cursor: pointer;
}

.alink {
	color: black;
	text-decoration: none;
	cursor: pointer;
	display: inline-block;
	max-width: 85%;
	vertical-align: middle;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
}

.alink:hover {
	text-decoration: underline;
}

.linkbtn:hover {
	text-decoration: underline;
}

.replynum {
	display: inline-block;
	font-size: small;
	margin-left: 5px;
}

.btn {
	width: 100%;
	height: 40px;
	border: 1px solid #aaa;
	cursor: pointer;
}

.btn:hover {
	
}

.infobtn {
	background-color: transparent;
	border: 0px solid #ccc;
	font-size: large;
	margin: 5px 0 5px 0;
	cursor: pointer;
}

.infobtn:hover {
	text-decoration: underline;
}

#writebtn {
	margin: 15px auto 15px auto;
	display: inline-block;
	position: relative;
}

#managebtn {
	margin: 0 0 15px 0;
}
</style>
</head>
<body>
<sec:authorize access="hasAnyRole('ROLE_USER','ROLE_MANAGER')">
	<sec:authentication property="principal" var="userinfo"/>
</sec:authorize>
	<div id="leftmenu">
		<div id="profiletop">
			<button class="infobtn" id="cafeinfobtn">카페 정보</button>
			<button id="myinfobtn" class="infobtn" style="margin-left: 10px;">내 정보</button>
		</div>
		<div id="profile">
			<div id="profileImage">
				<img id="userimgProfile" alt="" src="${contextPath}/resources/image/${result.GROUP_ICON}">
			</div>
			<ul style="text-align: left;">
				<li>매니저 ${result.GROUP_LEADER}</li>
				<li>since
					<h6 style="display: inline-block;">${result.GROUP_DATE}</h6>
				</li>
			</ul>
		</div>
		<div id="myprofile">
			<div id="myprofileImage">
				<img id="userimgProfile" alt="" src="${contextPath}/resources/image/${userinfo.image}">
			</div>
			<ul style="text-align: left;">
				<li><p style="font-size: small;">${user.USER_ID}</p></li>
				<li>${user.STATE}</li>
				<li><p style="font-size: small; color: #555;">가입 ${user.G_LIST_JOINDATE}</p></li>
			</ul>
		</div>
		<div id="cafeinfo">
			<ul>
				<li>카페인원수</li>
			</ul>
			<form action="write.user" method="post">
				<input type="hidden" name="group_num" value="${result.GROUP_NUM}">
				<button id="writebtn" class="btn">카페 글쓰기</button>
			</form>
			<sec:authorize access="hasAnyRole('ROLE_USER')">
				<c:if test="${result.STATE eq 'manager'}">
					<form action="managing.user" method="post">
						<input type="hidden" name="group_num" value="${result.GROUP_NUM}">
						<button id="managebtn" class="btn">게시판 관리</button>
					</form>
				</c:if>
				<c:if test="${empty result.STATE}">
					<form action="signUp" method="post">
						<input type="hidden" name="group_num" value="${result.GROUP_NUM}">
						<button id="managebtn" class="btn">회원가입</button>
					</form>
				</c:if>
			</sec:authorize>
		</div>
		<div id="boardlist1">
			<form action="${result.GROUP_NUM}">
				<button class="linkbtn">전체게시판</button>
			</form>
		</div>
		<div id="boardlist2">
			<ul style="margin: 10px 0 10px 0; padding-left: 15px;">
				<c:forEach var="list" items="${boardList}">
					<li><form action="board.user" method="post">
							<button class="linkbtn">${list.BOARD_NAME}</button>
							<input type="hidden" name="board_num" value="${list.BOARD_NUM}"> <input type="hidden" name="group_num" value="${result.GROUP_NUM}">
						</form></li>
				</c:forEach>
			</ul>
		</div>
		<div id="replylist">
			<ul>
				<li style="padding-bottom: 10px;">최근 댓글</li>
				<c:forEach var="list" items="${replyList}">
					<li class="recentReply">${list.POST_CONTENT}</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</body>
</html>