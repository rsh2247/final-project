<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	
}

.btn:nth-child(1) {
	font-weight: bold;
	color: #3E60DB;
	border-bottom: 2px solid #3E60DB;
	color: #3E60DB;
}

#groupTable {
	width: 1000px;
	margin: 20px auto 0 auto;
	border-collapse: collapse;
	position: absolute;
}

#groupTable tr {
	height: 40px;
	font-family: Inter, "Noto Sans KR", "Noto Sans JP", "Malgun Gothic",
		"맑은 고딕", sans-serif;
}

#groupTable tr:nth-child(2n) {
	background-color: #f7f8f9
}
</style>
</head>

<body>
	<jsp:include page="groupPreview.jsp" />
	<div id="contentbox">
		<jsp:include page="groupIndex.jsp" />
		<table id="groupTable">
			<tr
				style="background-color: #3E60DB; color: #FFF; font-weight: bold;">
				<th width="600px">그룹명</th>
				<th>그룹장</th>
				<th>카테고리</th>
				<th>멤버수</th>
			</tr>
			<c:forEach var="list" items="${list}">
				<tr>
					<td style="padding-left: 20px; text-align: left;">${list.GROUP_NAME}</td>
					<td>${list.GROUP_LEADER }</td>
					<td>${list.GROUP_CATEGORY}</td>
					<td></td>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>
</html>