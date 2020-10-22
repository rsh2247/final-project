<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#index tr:nth-child(3) td {
	background-color: #3E60DB;
	border: 1px solid #3E60DB;
}

#index tr:nth-child(3) a {
	color: #fff;
}

#groupTable {
	position: relative !important;
	width: 800px !important;
}

#groupTable th:first-child {
	width: 500px;
}
</style>
</head>
<body>
	<div id="contentbox">
		<jsp:include page="indexTable.jsp" />
		<div id="mainbox">
			<div id="maintitle">내 그룹목록</div>
			<jsp:include page="../group/myGroupList.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>
