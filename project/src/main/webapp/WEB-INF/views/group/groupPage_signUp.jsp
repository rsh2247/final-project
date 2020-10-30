<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="contentbox">
		<jsp:include page="groupPage_sidebar.jsp" flush="false"></jsp:include>
		<div id="mainbox">
			<c:if test="${signUpResult eq 'fail'}">오류가 발생했습니다.</c:if>
			<c:if test="${signUpResult eq 'candi'}">회원가입 신청이 완료되었습니다.</c:if>
			<c:if test="${signUpResult eq 'join'}">회원가입이 완료되었습니다.</c:if>
		</div>
	</div>
</body>
</html>