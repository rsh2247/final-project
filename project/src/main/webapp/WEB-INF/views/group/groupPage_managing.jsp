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
	text-align: left;
}

.divbox {
	width: 100%;
	margin: 20px 0 20px 0;
}

.divbox li {
	width: 100%;
	padding-left: 12px;
}

.divheader {
	width: 100%;
	border-bottom: 2px solid #555;
	padding: 10px 0 10px 0;
}

.colname {
	padding-left: 15px;
}

.boardbtn {
	width: 90px;
	height: 30px;
	border: 1px solid #555;
	float: right;
	cursor: pointer;
	margin: 10px 5px 10px 5px;
}
.boardbtn:hover {
	background-color: #fff;
}
</style>
</head>
<body>
	<div id="contentbox">
		<jsp:include page="groupPage_sidebar.jsp"></jsp:include>
		<div id="mainbox">
			<div class="divbox">
				<div class="divheader">
					<label class="colname">카페관리</label>
				</div>
				<form action="">
					<ul class="ulbox">
						<li><div id='desc'>카페이름</div>
							<div id="inputbox">
								<input type="text">
							</div></li>
						<li><div id='desc'>가입방식</div>
							<div id="inputbox">
								<input type="text">
							</div></li>
						<li><div id='desc'>카페설명</div>
							<div id="inputbox">
								<input type="text">
							</div></li>
					</ul>
				</form>
			</div>
			<div class="divbox">
				<div class="divheader">
					<label class="colname">게시판관리</label>
				</div>
				<ul>
					<li>게시판목록</li>
					<li><table></table></li>
				</ul>
				<div>
					<button class="boardbtn">게시판 삭제</button>
					<button class="boardbtn">게시판 추가</button>
				</div>
			</div>
			<div class="divbox">
				<div class="divheader">
					<label class="colname">카페회원관리</label>
				</div>
				<ul>
					<li></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>