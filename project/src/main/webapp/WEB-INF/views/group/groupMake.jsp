<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.btn:nth-child(2) {
	font-weight: bold;
	color: #3E60DB;
	border-bottom: 2px solid #3E60DB;
	color: #3E60DB;
}

#list {
	list-style: none;
	width: 100%;
	text-align: left;
}

#list li {
	margin: 10px 0 10px 0;
}

.namebox {
	display: inline-block;
	width: 150px;
	text-align: right;
	padding-right: 15px;
}

.inputbox {
	width: 500px;
	height: 20px;
	border: 1px solid #ccc;
	padding: 6px 0 6px 12px;
	color: #555
}
</style>
</head>
<body>
	<div id="contentbox">
		<jsp:include page="groupIndex.jsp" />
		<div>
			<form action="make_newGroup.pro">
				<ul id="list">
					<li><div class="namebox">그룹명</div> <input type="text"
						name="group_name" class="inputbox"></li>
					<li><div class="namebox">그룹카테고리</div> <input type="text"
						name="group_category" class="inputbox"></li>
					<li><div class="namebox">그룹설명</div> <input type="text"
						name="group_desc" class="inputbox"></li>
				</ul>

				<button>확인</button>
			</form>
		</div>
	</div>
</body>
</html>