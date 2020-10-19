<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	width: 800px;
	text-align: left;
}

#list li {
	border-bottom: 1px solid #eee;
}

.namebox {
	display: inline-block;
	width: 120px;
	height: 25px;
	text-align: left;
	padding: 0 0 0 15px;
}

.radiolabel {
	display: block;
	margin: 3px 0 3px 0;
}

.radio {
	
}

.listbox {
	display: inline-block;
	margin: 15px 0 15px;
}

.inputbox {
	width: 500px;
	height: 20px;
	border: 1px solid #ccc;
	padding: 6px 0 6px 12px;
	color: #555;
	padding: 6px 0 6px 12px;
}
</style>
</head>
<body>
	<div id="contentbox">
		<jsp:include page="groupIndex.jsp" />
		<div>
			<form action="make_newGroup.user">
				<ul id="list">
					<li><div class="namebox">그룹명</div>
						<div class="listbox">
							<input type="text" name="group_name" class="inputbox">
						</div></li>
					<li><div class="namebox">그룹카테고리</div>
						<div class="listbox">
							<input type="text" name="group_category" class="inputbox">
						</div></li>
					<li><div class="namebox" style="position: relative; top: -10px">가입방식</div>
						<div class="listbox">
							<label class="radiolabel"><input type="radio" name="manner" class="radio" value="free"> 가입 신청시 바로 가입가능</label> <label class="radiolabel"><input type="radio" name="manner" class="radio" value="need"> 가입 신청후 승인 필요</label>
						</div></li>
					<li><div class="namebox">그룹 아이콘</div>
						<div class="listbox">aaa</div></li>
					<li><div class="namebox">그룹설명</div>
						<div class="listbox">
							<input type="text" name="group_desc" class="inputbox">
						</div></li>
				</ul>
				<input type="hidden" name="g_list_state" value="manager">
				<button>확인</button>
			</form>
		</div>
	</div>
</body>
</html>