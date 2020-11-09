<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
</script>
<style type="text/css">
#index {
	width: 100%;
	text-align: left;
}

#contentbox {
	width: 1100px;
	margin: 50px auto 0 auto;
}

.btn {
	width: 100px;
	height: 60px;
	border: 0px;
	border-bottom : 2px solid #fff;
	background-color: #fff;
	cursor: pointer;
	font-family: Inter, "Noto Sans KR", "Noto Sans JP", "Malgun Gothic", "맑은 고딕", sans-serif;
	transition: background-color 0.3s ease 0s, border-color 0.3s ease 0s;
	font-size: 15px;
}

.selectedbtn{
	width: 120px;
	height: 50px;
	border: 0px;
	border-bottom : 2px solid #ccc;
	color : #3E60DB;
	background-color: #fff;
	cursor: pointer;
	font-family: Inter, "Noto Sans KR", "Noto Sans JP", "Malgun Gothic", "맑은 고딕", sans-serif;
}

.btn:hover {
	background-color: #f7f8f9;
}
</style>
</head>
<body>
	<div id="index">
		<button class="btn" onclick="location.href='groupmain'">전체 그룹</button>
		<button class="btn" onclick="location.href='mygroup.user'">내 그룹</button>
		<button class="btn" onclick="location.href='groupmaking.user'">그룹 만들기</button>
	</div>
</body>
</html>