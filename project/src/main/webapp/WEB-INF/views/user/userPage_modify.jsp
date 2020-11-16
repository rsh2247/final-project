<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				$('#file').change(
						function(e) {
							var formData = new FormData($('#fileform')[0]);
							console.log('filename : ' + $('#file').val());
							if ($('#file').val() != '') {
								$.ajax({
									type : "post",
									enctype : 'multipart/form-data',
									url : "uploadImage",
									data : formData,
									processData : false,
									contentType : false,
									success : function(data, textStatus) {
										$('#profileimage').attr(
												'src',
												'${contextPath}/resources/image/'
														+ data);
										$('#userImage').val(data);
									},
									error : function(data, textSatus) {
										alert("에러가 발생");
									},
									complete : function(data, textSatus) {
									}
								});
							}

						})
				$('#imgbtn').click(function() {
					$('#file').trigger('click');
				})
			})
</script>
<style type="text/css">
* {
	list-style: none;
}

#profileimage {
	width: 100px;
	height: 100px;
	border-radius: 50px;
	display: inline-block;
}
#index tr:nth-child(4) td {
	background-color: #3E60DB;
	border: 1px solid #3E60DB;
}
#index tr:nth-child(4) a {
	color: #fff;
}
#innerbox {
	text-align: left;
}

#itemlist {
	border: 1px solid #ddd;
	border-radius: 10px;
	padding: 15px 0 15px 0;
}

#itemlist li {
	margin: 0 25px 0 25px;
	padding: 25px 0 25px 15px;
	border-bottom: 1px solid #eee;
}

.itemname {
	display: inline-block;
	width: 160px;
	line-height: 30px;
	border-right: 1px solid #ddd;
}

.item {
	display: inline-block;
	padding-left: 20px;
	line-height: 30px;
}
.changebtn{
	color: #3e60db;
	background-color: #fff;
	width: 90px;
	line-height: 30px;
	font-weight: bold;
	border-radius: 20px;
	border: 2px solid #3e60db;
	cursor: pointer;
}
.changebtn:hover{
	color: #fff;
	background-color: #3e60db;
}
#submitbtn {
	width: 100px;
	line-height: 35px;
	border: 2px solid #3e60db;
	border-radius: 5px;
	margin-top: 15px;
	background-color: #3e60db;
	color: #fff;
	cursor: pointer;
	font-size: 16px;
	transition: ease 250ms;
}
</style>
</head>
<body>
	<div id="contentbox">
		<jsp:include page="indexTable.jsp"></jsp:include>
		<div id="mainbox">
			<form action="userInfoUpdate" method="post">
				<div id="innerbox">
					<div id="maintitle">정보수정</div>
					<sec:authentication property="principal" var="user" />
					<ul id="itemlist">
						<li><div class="itemname">아이디</div>
							<div class="item">${user.username}</div></li>
						<li><div class="itemname">비밀번호</div><div class="item"><button class="changebtn">변경하기</button></div></li>
						<li><div class="itemname">이메일</div>
							<div class="item">${user.email}</div><div class="item"><button class="changebtn">변경하기</button></div></li>
						<li style="height: 155px;"><div class="itemname"
								style="height: 100px; position: relative; top: -80px">프로필이미지</div>
							<div class="item">
								<img alt="" src="${contextPath}/resources/image/${user.image}"
									id="profileimage">
							</div>
							<button id="imgbtn" type="button" class="changebtn">업로드</button></li>
						<li style="border-bottom: 0px;">
							<button id="submitbtn">확인</button>
						</li>
					</ul>
				</div>
				<input type="hidden" name="user_image" id="userImage"
					value="${user.image}">
			</form>
			<form action="uploadImage" id="fileform"
				enctype="multipart/form-data" method="post">
				<input type="file" name="file" id="file" style="display: none;">
			</form>
		</div>
	</div>
</body>
</html>