<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	list-style: none;
}

#contentbox {
	height: 1200px;
	margin-top: 20px;
}

#mainbox {
	width: 850px;
	height: 100%;
	margin-left: 25px;
	float: left;
	background-color: #fff;
}

#namebox {
	width: 100%;
	border-bottom: 1px solid #555;
	padding: 10px 0 10px 5px;
	text-align: left;
}

.title {
	width: 100%;
	font-size: large;
}

#table {
	width: 100%;
}

#article {
	width: 100%;
	border-collapse: collapse;
}

#article th {
	border-bottom: 1px solid #e9e9e9;
	padding: 12px 0 12px 0;
}

#article td {
	border-bottom: 1px solid #e9e9e9;
	padding: 7px 0 7px 0;
}
</style>
</head>
<body>
	<div id="contentbox">
		<jsp:include page="groupPage_sidebar.jsp" flush="false"></jsp:include>
		<div id="mainbox">
			<div id="namebox">
				<label class="title">전체글보기</label>
			</div>
			<div id="tablebox">
				<table id="article">
					<tr>
						<th width="100px"></th>
						<th width="400px">제목</th>
						<th>작성자</th>
						<th width="120px">작성일시</th>
						<th width="100px">조회</th>
					</tr>
					<c:forEach var="list" items="${postList}">
						<tr>
							<td style="font-size: small;">${list.BOARD_NAME}</td>
							<td style="text-align: left;"><form action="article.user" method="post">
									<button class="linkbtn">${list.POST_TITLE}</button>
									<input type="hidden" name="post_num" value="${list.POST_NUM}">
									<input type="hidden" name="group_num" value="${result.GROUP_NUM}">
								</form></td>
							<td>${list.USER_ID}</td>
							<td style="font-size: small;">${list.POST_DATE}</td>
							<td>0</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>