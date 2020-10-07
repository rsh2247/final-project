<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#proTable {
	margin: 150px auto 0 auto;
	border-collapse: collapse;
	width: 900px;
}

#proTable tr td {
	text-align: left;
	border: 0px solid #000;
}

.proTD {
	padding: 12px 5px 12px 5px
}

.exTD {
	padding: 2px 5px 2px 25px;
}

#panel {
	min-height: 1000px;
	min-width: 200px;
	float: right;
	background-color: #ccc;
}

#panel ul {
	list-style: none;
	padding-top: 50px;
	height: 800px;
}

#panel ul li {
	padding: 2px 0 1px 0;
}
</style>
</head>
<body>
	<div id="panel">
		<form action="check_colAnswer.pro" method="post">
			<ul>
				<c:forEach var="list" items="${list}">
					<li>${list.COL_LIST_NUM}<c:forEach var="ordList" items="${list.ordList}">
							<input type="radio" value="${ordList.cho_num}" name="answer${list.PRO_NUM}" class="panelRadio">
						</c:forEach>
					</li>
				</c:forEach>
			</ul>
			<input type="hidden" value="${list[0].COL_NUM}" name="col_num">
			<input type="submit" value="답안 제출하기">
		</form>
	</div>
	<table id="proTable">
		<c:forEach var="list" items="${list}">
			<tr>
				<td class="proTD" style="text-align: right; width: 30px">${list.COL_LIST_NUM}.</td>
				<td>${list.PRO_CONTENT}</td>
			</tr>
			<c:forEach var="ordList" items="${list.ordList}">
				<tr>
					<td colspan="2" class="exTD">(${ordList.cho_num}) ${ordList.cho_content}</td>
				</tr>
			</c:forEach>
		</c:forEach>
	</table>
</body>
</html>