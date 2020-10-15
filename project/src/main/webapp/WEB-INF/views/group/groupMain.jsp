<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#contentbox {
	width: 1000px;
	margin: 50px auto 0 auto;
}

#groupTable {
	width: 900px;
	margin: 20px 0 0 0;
	border-collapse: collapse;
}

#groupTable tr {
	border-bottom: 1px solid #ccc;
	height: 30px;
}
</style>
</head>

<body>
	<div id="contentbox">
		<jsp:include page="groupIndex.jsp" />
		<table id="groupTable">
			<tr style="border-top: 1px solid #ccc">
				<th width="600px">그룹명</th>
				<th>그룹장</th>
				<th>카테고리</th>
				<th>멤버수</th>
			</tr>
			<c:forEach var="list" items="${list}">
				<tr>
					<td>${list.GROUP_NAME}</td>
					<td>${list.GROUP_LEADER }</td>
					<td>${list.GROUP_CATEGORY}</td>
					<td></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>