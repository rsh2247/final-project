<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.btn:nth-child(2) {
	font-weight: bold;
	color: #3E60DB;
	border-bottom: 2px solid #3E60DB;
	color: #3E60DB;
}
</style>
</head>
<body>
	<div id="contentbox">
		<jsp:include page="groupIndex.jsp" />
		<jsp:include page="myGroupList.jsp" />
	</div>
</body>
</html>