<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
	background-color: #eee;
}

#article {
	width: 100%;
	height: 600px;
	background-color: #fff;
}

#board {
	width: 100%;
}
</style>
</head>
<body>
	<div id="contentbox">
		<jsp:include page="groupPage_sidebar.jsp"></jsp:include>
		<div id="mainbox">
			<div></div>
			<div id="article">
				<ul style="text-align: left;">
					<li
						style="border-bottom: 1px solid #555; padding: 10px 0 10px 5px; font-size: large;">전체
						글 보기</li>
					<li><table id="board">
							<tr>
								<th width="400px;"></th>
								<th></th>
								<th></th>
							</tr>
							<tr>
								<td>게시글제목</td>
								<td>작성자</td>
								<td>작성일</td>
							</tr>
						</table></li>
				</ul>
			</div>
			<div></div>
		</div>
	</div>
</body>
</html>