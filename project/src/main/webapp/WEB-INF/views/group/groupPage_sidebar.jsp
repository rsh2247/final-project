<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#leftmenu {
	width: 200px;
	height: 100%;
	float: left;
	background-color: #eee;
}

#profile {
	width: 100%;
	height: 70px;
	border-top: 1px solid #fff;
	border-bottom: 1px solid #fff;
	padding: 15px 0 15px 0;
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
	height: 200px;
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

.btn {
	width: 100%;
	height: 40px;
	border: 1px solid #aaa;
	cursor: pointer;
}

.btn:hover {
	
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
	<div id="leftmenu">
		카페정보 내정보
		<div id="profile">
			<div id="profileImage"></div>
			<ul>
				<li>매니저 ${result.GROUP_LEADER}</li>
				<li>since
					<h6>${result.GROUP_DATE}</h6>
				</li>
			</ul>
		</div>
		<div id="cafeinfo">
			<ul>
				<li>카페등급</li>
				<li>카페인원수</li>
				<li>기타</li>
				<li>등등</li>
			</ul>
			<form action="write.user" method="post">
				<input type="hidden" name="num" value="${result.GROUP_NUM}">
				<button id="writebtn" class="btn">카페 글쓰기</button>
			</form>
			<sec:authorize access="hasAnyRole('ROLE_USER')">
				<c:if test="${result.STATE eq 'manager'}">
					<form action="groupPage_managing.user" method="post">
						<input type="hidden" name="num" value="${result.GROUP_NUM}">
						<button id="managebtn" class="btn">게시판 관리</button>
					</form>
				</c:if>
			</sec:authorize>
		</div>
		<div id="boardlist1">전체 게시판</div>
		<div id="boardlist2">
			<ul style="margin: 10px 0 10px 0; padding-left: 15px;">
				<c:forEach var="list" items="${boardList}">
					<li>${list.BOARD_NAME}</li>
				</c:forEach>
			</ul>
		</div>
		<div id="replylist">
			<ul>
				<li style="padding-bottom: 10px;">최근 댓글</li>
				<li>대충 댓글1</li>
				<li>대충 댓글2</li>
				<li>대충 댓글3</li>
			</ul>
		</div>
	</div>
</body>
</html>