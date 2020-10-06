<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous">
	
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
	border-radius: 0px;
	border: 2px solid #ccc;
	margin: 0 10px 0 10px;
	background-color: #fff;
	padding: 5px 12px 5px 12px;
	font-size: 16px;
}

.ansbutton:hover {
	cursor: pointer;
	border: 2px solid #000;
}


#box {
	margin: 150px 0 0 0;
}

#comment {
	visibility: hidden;
}
</style>
</head>
<body>
	<div id="box">
		<c:if test="${correct eq 'true'}">
			<p style="margin-bottom: 50px">정답입니다.</p>
			<p>
				<button class="ansbutton" onclick="location.href='c001_003.pro?category=${problem.CATEGORY_NAME}'">다른문제 보러가기</button>
			</p>
		</c:if>
		<c:if test="${correct eq 'false'}">
			<p style="margin-bottom: 50px">틀렸습니다 다시확인해보세요.</p>
			<button class="ansbutton" onclick="location.href='problem_page.pro?pro_num=${problem.PRO_NUM}'">다시풀기</button>
			<button class="ansbutton" onclick="hideout()">정답확인</button>
			<p id="comment" style="margin-top: 50px">${problem.PRO_COMMENT}</p>
		</c:if>
	</div>
</body>
</html>