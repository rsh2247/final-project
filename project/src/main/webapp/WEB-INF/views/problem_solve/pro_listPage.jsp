<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
    $(document)
	    .ready(function() {
	    })
</script>
<style type="text/css">
.menu {
	margin: 50px auto 0 auto;
	width: 1100px;
}

.p_table {
	border-collapse: collapse;
	border: 0px solid black;
	margin: auto;
}

.p_table th {
	height: 50px;
	font-size: 18px;
	color: #eee;
	background-color: #3E60DB;
}

.p_table td {
	height: 35px;
	padding: 2px 0 2px 0;
}

.p_table tr:nth-child(2n) {
	background-color: #f1f1f1;
}


.star1 {
	display: inline-block;
	height: 25px;
	position: absolute;
}

.star2 {
	display: inline-block;
	height: 25px;
}

.pageNum {
	text-decoration: none;
	color: black;
}

.pagebtn {
	width: 30px;
	line-height: 26px;
	border: 1px solid #ccc;
	background-color: #fff;
	cursor: pointer;
}

.colorbtn {
	border: 1px solid #3E60DB;
	background-color: #3E60DB;
	color: #fff;
}
.pro_title{
	text-decoration: none;
    color: black;
    padding-left: 10px;
}
.pro_title:hover{
	text-decoration: underline;
}
</style>
</head>
<body>
	<div class="menu">
		<table class="p_table">
			<tr>
				<th width="20px"></th>
				<th width="100px">문제 번호</th>
				<th width="550px">문제명</th>
				<th width="130px">정보</th>
				<th width="200px">평점</th>
			</tr>
			<c:forEach var="problem" items="${list}">
				<c:set var="num" value="${problem.SCORE*12.2}" />
				<c:if test="${problem.ROWNUM >= page.startNum && problem.ROWNUM <= page.endNum}">
					<tr>
						<td></td>
						<td>${problem.PRO_NUM}</td>
						<td style="text-align: left; padding-left: 25px;"><a class="pro_title" href="problem_page.pro?pro_num=${problem.PRO_NUM}">${problem.PRO_NAME}</a></td>
						<td>${problem.TAG_NAME}</td>
						<td><img style="clip: rect(0px,${num}px,30px,0px);" class="star1" alt="" src="${contextPath}/resources/image/stars1.png"> <img class="star2" alt="" src="${contextPath}/resources/image/stars2.png"></td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
		<c:set var="pageNum" value="1" />
		<c:forEach begin="1" end="${page.listNum}">
			<c:if test="${pageNum == page.nowPage}">
				<button class="pagebtn colorbtn" value="${pageNum}" onclick="location.href='${contextPath}/problem_solve/list.pro?category=${result.category}&pageNum=${pageNum}'">${pageNum}</button>
			</c:if>
			<c:if test="${pageNum != page.nowPage}">
				<button class="pagebtn" value="${pageNum}" onclick="location.href='${contextPath}/problem_solve/list.pro?category=${result.category}&pageNum=${pageNum}'">${pageNum}</button>
			</c:if>
			<c:set var="pageNum" value="${pageNum + 1}" />
		</c:forEach>
	</div>
</body>
</html>