<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인 창</title>
	<c:choose>
		<c:when test = "${result=='loginFailed' }">
			<script>
				window.onload = function(){
					alert("아이디나 비밀번호를 확인하십시오.");
				}
			</script>
			</c:when>
			</c:choose>
</head>
<body>

</body>
</html>