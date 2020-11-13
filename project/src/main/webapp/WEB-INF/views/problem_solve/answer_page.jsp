<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous">
	
</script>
<script type="text/javascript">
	var state = true;
	$(document).ready(function() {

	})
	function hideout() {
		if (state) {
			$('#comment').css('visibility', 'visible');
			state = false;
		} else {
			$('#comment').css('visibility', 'hidden');
			state = true;
		}
	}
</script>
<style type="text/css">
.ansbutton {
	width: 150px;
	line-height: 35px;
	border: 2px solid #3e60db;
	border-radius: 35px;
	margin-top: 15px;
	background-color: #3e60db;
	color: #fff;
	cursor: pointer;
	font-size: 16px;
	transition: ease 250ms;
}

.ansbutton:hover {
	background-color: #213a92;
	border-color: #213a92;
}

.ansbutton:active {
	background-color: #fff;
	color: #3e60db;
	border: 2px solid #3e60db;
}

.anstext {
	margin: 20px 0 30px 0;
	font-size: large;
}

#box {
	margin: 50px 0 0 0;
}

#comment {
	visibility: hidden;
	width: 650px;
	min-height: 100px;
	padding: 15px 10px 15px 10px;
	margin: 50px auto 0 auto;
	border: 1px solid #eee;
	border-radius: 10px;
}
</style>
</head>
<body>
	<div id="box">
		<c:if test="${correct eq 'true'}">
			<img alt="" src="${contextPath}/resources/image/Oimage.jpeg">
			<p class="anstext">정답입니다.</p>
			<form action="proEval.pro" method="post">
				<p>
					<button class="ansbutton" type="button"
						onclick="location.href='list.pro?category=${problem.CATEGORY_NAME}'">다른문제
						풀기</button>
					<button class="ansbutton">문제 평가하기</button>
				</p>
				<input type="hidden" name="pro_num" value="${problem.PRO_NUM}">
				<input type="hidden" name="pro_name" value="${problem.PRO_NAME}">
				<input type="hidden" name="category_name" value="${problem.CATEGORY_NAME}"> 
				<input type="hidden" name="category_id" value="${problem.CATEGORY_ID}"> 
				<input type="hidden" name="user_id" value="${problem.USER_ID}"> 
				<input type="hidden" name="tag_name" value="${problem.TAG_NAME}">
			</form>
		</c:if>
		<c:if test="${correct eq 'false'}">
			<img alt="" src="${contextPath}/resources/image/Ximage.jpeg">
			<p class="anstext">틀렸습니다 다시확인해보세요.</p>
			<button class="ansbutton"
				onclick="location.href='problem_page.pro?pro_num=${problem.PRO_NUM}'">다시풀기</button>
			<input id="commentbox" type="checkbox" style="display: none;">
			<label for="commentbox">
				<button class="ansbutton" onclick="hideout()">정답확인</button>
			</label>
			<div id="comment">${problem.PRO_COMMENT}</div>
		</c:if>
	</div>
</body>
</html>