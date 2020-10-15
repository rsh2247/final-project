<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#contentbox {
	margin: 50px auto 0 auto;
	width: 1200px;
}


#mainbox {
	width: 800px;
	background-color: #fff;
	margin-left: 50px;
	float: left;
}

#maintitle {
	width: 100%;
	height: 40px;
	border-bottom: 1px solid #d4d4d4;
	text-align: left;
	padding-left: 10px;
	margin-bottom: 25px;
	font-size: 21px;
	color: #333;
}

#maincontent {
	
}

#colhistory {
	width: 95%;
	border-collapse: collapse;
	margin-left: 10px;
}

#colhistory th {
	padding: 10px 0 10px 0;
}
#tablerow td{
	height: 30px; 
}
#tablerow a{
	text-decoration: none;
	color: black;
}
#tablerow a:hover {
	color: #3E60DB
}
</style>
</head>
<body>
	<!--0b59bf -->
	<div id="contentbox">
		<jsp:include page="indexTable.jsp"></jsp:include>
		<div id="mainbox">
			<div id="maintitle">문제집오답</div>
			<div id="maincontent">
				<p style="text-align: left; padding: 10px 0 10px 10px;">전체응시내역</p>
				<table id="colhistory">
					<tr style="border-bottom: 2px solid #3E60DB;">
						<th width="60px">번호</th>
						<th width="400px">문제집제목</th>
						<th>분류</th>
						<th>점수</th>
						<th width="120px">날짜</th>
					</tr>
					<c:set var="num" value="1"></c:set>
					<c:forEach var="collist" items="${list}">
						<tr id="tablerow" style="border-bottom: 1px solid #ccc;">
							<td style="font-size: small;">${num}</td>
							<td style="text-align: left; padding-left: 25px"><a href="userPage_col_correctsheet.user?number=${collist.COL_NUM}&time=${collist.COL_SOLVEDATE}">${collist.COL_NAME}</a></td>
							<td>${collist.CATEGORY_NAME}</td>
							<c:if test="${collist.COL_SCORE == collist.COL_MAXSCORE}">
								<td><label style="color: green;">${collist.COL_SCORE}</label>/${collist.COL_MAXSCORE}</td>
							</c:if>
							<c:if test="${collist.COL_SCORE != collist.COL_MAXSCORE}">
								<td><label style="color: orange;">${collist.COL_SCORE}</label>/${collist.COL_MAXSCORE}</td>
							</c:if>
							<td style="font-size: small;">${fn:substring(collist.COL_SOLVEDATE,0,16)}</td>
						</tr>
						<c:set var="num" value="${num + 1}"></c:set>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>