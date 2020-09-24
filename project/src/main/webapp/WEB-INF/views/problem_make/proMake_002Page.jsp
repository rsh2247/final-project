<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
문제가 등록되었습니다.
<br>
<br>
<a href="${contextPath}/problem_make/proMake_mainPage.do">다른문제 보러가기</a>
<br>
문제 제출하러가기
</body>
</html>