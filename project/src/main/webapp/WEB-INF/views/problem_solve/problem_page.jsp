<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.example {
	list-style: none;
}

.example li {
	display: inline;
}

#proTable {
	margin: 100px auto 50px auto;
	border-collapse: collapse;
	width: 1000px;
	text-align: left;
}

#proTable tr td {
	padding-bottom: 10px;
	padding-top: 10px;
}

.pro_td {
	border-bottom: 1px solid #ccc;
	font-size: 24px;
	text-align: left;
	padding-left: 5px;
}

#answerBox {
	border-radius: 0px;
	border: 0px solid;
	border-bottom: 1px solid #2a52be;
}

#submitBox {
	margin-top: 20px;
	border-radius: 0px;
	border: 2px solid #ccc;
	background-color: #FFF;
	padding: 5px 12px 5px 12px;
	font-size: 18px;
}

#submitBox:hover {
	border: 2px solid #000;
	cursor: pointer;
}
</style>
</head>
<body>
	<table id="proTable">
		<c:forEach var="problem" items="${list}">
			<tr>
				<td style="height: 40px">${problem.PRO_NAME}</td>
			</tr>
			<tr>
				<td class="pro_td">문제</td>
			</tr>
			<tr>
				<td style="padding: 40px 0 40px 5px; text-align: left;">${problem.PRO_CONTENT}</td>
			</tr>
			<c:if test="${problem.TAG_ISCHOICE ne 'N'}">
				<tr>
					<td class="pro_td">보기</td>
				</tr>
			</c:if>
			<c:if test="${problem.TAG_ISCHOICE eq 'N'}">
				<td class="pro_td">정답입력</td>
			</c:if>
		</c:forEach>
	</table>
	<form action="check_answer.pro" method="post" style="margin-bottom: 100px;">
		<c:forEach var="problem" items="${list}">
			<c:if test="${problem.TAG_ISCHOICE ne 'N'}">
				<ul class="example">
					<c:forEach var="example" items="${list2}">
						<li><input type="radio" value="${example.CHO_NUM}" name="answer"> ${example.CHO_NUM}</li>
						<li>${example.CHO_CONTENT}</li>
					</c:forEach>
				</ul>
			</c:if>
			<c:if test="${problem.TAG_ISCHOICE eq 'N'}">
				<input name="answer" id="answerBox" type="text">
			</c:if>
			<input type="hidden" name="proNum" value="${problem.PRO_NUM}">
		</c:forEach>
		<input id="submitBox" type="submit" value="확인">
	</form>
</body>
</html>