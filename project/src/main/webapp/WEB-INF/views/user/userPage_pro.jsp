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

.p_table th {
	height: 50px;
	font-size: 18px;
	color:#eee;
	background-color: #3E60DB;
}

.p_table td {
	height: 35px;
	padding: 2px 0 2px 0;
	
}

.p_table tr:nth-child(2n){
	background-color: #f1f1f1;
}
.category{
	display: inline-block;
	width: 60px;
	margin-left: 10px;
}
.tag{
	display: inline-block;
	padding-left: 10px;
}
</style>
</head>
<body>
	<div id="contentbox">
		<jsp:include page="indexTable.jsp"></jsp:include>
		<div id="mainbox">
			<div id="maintitle">문제오답</div>
			<div id="maincontent">
				<table class="p_table">
					<tr>
						<th width="20px"></th>
						<th width="100px">문제 번호</th>
						<th width="500px">문제명</th>
						<th width="200px">정보</th>
					</tr>
					<c:forEach var="problem" items="${problem}">
						<tr>
							<td></td>
							<td>${problem.PRO_NUM}</td>
							<td style="text-align: left; padding-left: 25px;">${problem.PRO_NAME}</td>
							<td style="text-align: left;"><div class="category">${problem.CATEGORY_NAME}</div>|
							<div class="tag">${problem.TAG_NAME}</div></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>