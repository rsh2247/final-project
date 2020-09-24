<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <br>
<h1> kakaoPay api </h1>
<form method="post" action="${contextPath}/kakaoPay">
    <button>카카오페이로 결제하기</button>
</form>
</body>
</html> 