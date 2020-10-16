<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#loginTable {
	border-collapse: collapse;
	margin: 150px auto 100px auto;
}

.infoinput {
	width: 380px;
	height: 55px;
	padding: 12px 12px;
	margin: 8px 0 8px 0;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box;
	outline: 0;
	font-size: 18px;
	padding: 12px 16px;
}

.infoinput::placeholder {
	color: #ccc;
	font-size: 16px;
}

.submit {
	width: 380px;
	height: 57px;
	padding:;
	margin: 8px 0 8px 0;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box;
	outline: 0;
	font-size: 24px;
	color: #fff;
	background-color: #3E60DB;
	cursor: pointer;
}

.alink {
	float: left;
	font-size: 14px;
	color: #888;
	text-decoration: none;
}

#signUp {
	width: 100px;
	padding: 12px 12px;
	margin: 8px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box;
	cursor: pointer;
	outline: 0;
}
</style>
</head>
<body>
	<form action="${contextPath}/login" method="post">
		<table id="loginTable">
			<tr>
				<td colspan="2"><p style="text-align: center; font-size: 24px;">로그인</p></td>
			</tr>
			<tr>
				<td><input type="text" name="loginId" placeholder="ID" class="infoinput"></td>
			</tr>
			<tr>
				<td><input type="password" name="loginPw" placeholder="Password" class="infoinput"></td>
			</tr>
			<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
				<tr>
					<td style="float: left; padding: 10px 0 10px 1px; color: red">아이디 혹은 비밀번호가 잘못되었습니다.</td>
				</tr>
			</c:if>
			<tr>
				<td><input type="submit" class="submit" value="로그인"></td>
			</tr>
			<tr style="border-bottom: 1px solid #eee;">
				<td style="float: left; padding: 15px 0 20px 10px;"><input type="checkbox"> 로그인 상태 유지</td>
			</tr>
			<tr>
				<td style="padding: 15px 0 20px 10px"><a href="" class="alink">ID 찾기</a>
					<p class="alink" style="margin-left: 5px;">|</p> <a href="" class="alink" style="margin-left: 5px;">Password 찾기</a> <a href="${contextPath}/user/signUp.do" class="alink" style="float: right;">회원가입</a></td>
			</tr>
		</table>
		<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">
	</form>
</body>
</html>