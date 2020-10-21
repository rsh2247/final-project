<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${contextPath}/resources/ckeditor/ckeditor/ckeditor.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				$('#boardselectbtn').click(function() {
					if ($('#boardlistbox').css('display') == 'block') {
						$('#boardlistbox').css('display', 'none');
					} else {
						$('#boardlistbox').css('display', 'block');
					}
				})
				$('html').click(
						function(e) {
							if (e.target.id != 'boardlistbox'
									&& e.target.id != 'boardselectbtn') {
								$('#boardlistbox').css('display', 'none');
							}
						});
				$('.listbtn').click(function() {
					$('#boardselectbtn').text($(this).text())
					$('#boardnum').val($(this).val())
				})

			})
</script>
<style type="text/css">
#contentbox {
	text-align: left;
}

#topbar {
	width: 100%;
	height: 120px;
}

#boardselect{
	padding: 10px 0 10px 0;
}

#boardselectbtn {
	width: 600px;
	height: 40px;
	text-align: left;
	font-size: large;
	padding: 5px 0 5px 10px;
	border: 1px solid #ccc;
	background-color: #fff;
	cursor: pointer;
}

#boardlistbox {
	width: 600px;
	position: absolute;
	display: none;
	background-color: #fff;
}

#titlebox{

}
#titletext{
	width: 100%;
	height: 40px;
	border: 1px solid #ccc;
	font-size: large;
	padding-left: 10px;
}
.boardlist {
	
}

.listbtn {
	width: 600px;
	height: 40px;
	text-align: left;
	padding-left: 10px;
	cursor: pointer;
}

.btn{
	width: 90px;
	height: 30px;
	cursor: pointer;
}
</style>
</head>
<body>
	<form action="${contextPath}/cafe/confirm.user" method="post">
	<input type="hidden" name="board_num" id="boardnum">
	<input type="hidden" name="group_num" value="${result.GROUP_NUM}">
		<div id="contentbox">
			<div id="topbar">
				<div id="boardselect">
					<button type="button" id="boardselectbtn">게시판을 선택해주세요.</button>
					<div id="boardlistbox">
						<ul style="list-style: none;">
							<c:forEach var="list" items="${boardList}">
								<li class="boardlist"><button type="button" class="listbtn" value="${list.BOARD_NUM}">${list.BOARD_NAME}</button></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div id="titlebox">
					<input id="titletext" name="post_title" type="text">
				</div>
			</div>
			<div id="mainbar">
				<textarea id="editor" name="post_content"></textarea>
			</div>
			<div style="text-align: right; padding-top: 10px;"><button class="btn">등록</button></div>
		</div>
	</form>
	<script type="text/javascript">
		CKEDITOR.replace('editor');
	</script>
</body>
</html>