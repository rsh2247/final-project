<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="contentbox">
		<jsp:include page="groupIndex.jsp" />
		<div>
			<form action="make_newGroup.pro">
				<input type="text" name="group_name">
				<input type="text" name="group_category">
				<input type="text" name="group_desc">
				<button> 확인</button>
			</form>
		</div>
	</div>
</body>
</html>