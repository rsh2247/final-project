<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
					$('#profileimage').attr('src','${contextPath}/resources/image/'+ data);
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

#innerbox {
	text-align: left;
}
</style>
</head>
<body>
	<div id="contentbox">
		<jsp:include page="indexTable.jsp"></jsp:include>
		<div id="mainbox">
			<form action="userInfoUpdate" method="post">
				<div id="innerbox">
				<sec:authentication property="principal" var="user"/>
					<ul>
						<li>아이디
							<div>
								${user.username}
							</div>
						</li>
						<li>비밀번호
							<div>현재 비밀번호</div>
							<div>
								<input type="password" id="pw1">
							</div>
							<div>변경할 비밀번호</div>
							<div>
								<input type="password" id="pw2">
							</div>
						</li>
						<li>프로필이미지
							<div>
								<img alt="" src="${contextPath}/resources/image/${user.image}" id="profileimage">
							</div>
							<button id="imgbtn" type="button">업로드</button>
						</li>
						<li><button>확인</button></li>
					</ul>
				</div>
				<input type="hidden" name="user_image" id="userImage" value="${user.image}">
			</form>
			<form action="uploadImage" id="fileform" enctype="multipart/form-data" method="post">
				<input type="file" name="file" id="file" style="display: none;">
			</form>
		</div>
	</div>
</body>
</html>