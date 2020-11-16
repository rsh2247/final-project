<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#index tr:nth-child(2) td {
	background-color: #3E60DB;
	border: 1px solid #3E60DB;
}

#index tr:nth-child(2) a {
	color: #fff;
}
.p_table {
	border-collapse: collapse;
	border: 0px solid black;
	margin: auto;
}

#colhistory {
	width: 95%;
	border-collapse: collapse;
	margin-left: 10px;
}

#colhistory th {
	padding: 10px 0 10px 0;
}

.tablerow td {
	height: 35px;
	border-bottom: 1px solid #ccc;
}

.tablerow a {
	text-decoration: none;
	color: black;
}

.tablerow a:hover {
	color: #3E60DB
}
.category{
	display: inline-block;
	font-size: 14px;
}
.tag{
	display: inline-block;
	font-size: 14px;
}
</style>
</head>
<body>
	<div id="contentbox">
		<jsp:include page="indexTable.jsp"></jsp:include>
		<div id="mainbox">
			<div id="maintitle">문제오답</div>
			<div id="maincontent">
				<table id="colhistory">
					<tr style="border-bottom: 2px solid #3E60DB;">
						<th width="80px">문제번호</th>
						<th width="400px">문제명</th>
						<th width="180px">제작자</th>
						<th width="200px">정보</th>
					</tr>
					<c:forEach var="problem" items="${problem}">
						<tr class="tablerow">
							<td>${problem.PRO_NUM}</td>
							<td style="text-align: left; padding-left: 25px;">${problem.PRO_NAME}</td>
							<td style="text-align: left; padding-left: 25px;"><div style="font-size: 15px;">${problem.USER_ID}</div></td>
							<td style="text-align: left; text-align: center;"><div class="category">${problem.CATEGORY_NAME}</div> |
							<div class="tag">${problem.TAG_NAME}</div></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>