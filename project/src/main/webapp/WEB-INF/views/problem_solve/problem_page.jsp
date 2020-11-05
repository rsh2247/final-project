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
	display: block;
	padding: 5px 0 5px 0 ;
}
#contentbox{
	width: 1100px;
}
#proTable {
	margin: 100px auto 30px auto;
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

#tagbox {
	color: #555;
	margin: 15px 0 15px 0;
}

#toptitle {
	font-size: xx-large;
	margin-left: 20px;
}
</style>
</head>
<body>
	<div id="contentbox">
		<table id="proTable">
			<c:forEach var="problem" items="${list}">
				<tr>
					<td style="height: 40px"><div id="tagbox">${problem.CATEGORY_NAME} | ${problem.TAG_NAME}</div>
						<div id="toptitle">${problem.PRO_NAME}</div></td>
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
					<div style="text-align: left; width: 1000px; margin-left: 60px;">
						<ul class="example">
							<c:forEach var="example" items="${list2}">
								<li><label><input type="radio" value="${example.CHO_NUM}" name="answer"> ${example.CHO_NUM} ${example.CHO_CONTENT}</label></li>
							</c:forEach>
						</ul>
					</div>
				</c:if>
				<c:if test="${problem.TAG_ISCHOICE eq 'N'}">
					<input name="answer" id="answerBox" type="text">
				</c:if>
				<input type="hidden" name="proNum" value="${problem.PRO_NUM}">
			</c:forEach>
			<input id="submitBox" type="submit" value="확인">
		</form>
	</div>
</body>
</html>