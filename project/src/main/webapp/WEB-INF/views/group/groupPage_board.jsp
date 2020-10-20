<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#contentbox {
	height: 1200px;
	margin-top: 20px;
}
</style>
</head>
<body>
	<div id="contentbox">
		<jsp:include page="groupPage_sidebar.jsp" flush="false"></jsp:include>
		<div id="mainbox"></div>
	</div>
</body>
</html>