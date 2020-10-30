<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
	$('#imageUpload').click(function() {
	    var formData = new FormData($('#fileform')[0]);
	    $.ajax({
		type : "post",
		enctype : 'multipart/form-data',
		url : "uploadImage",
		data : formData,
		processData : false,
		contentType : false,
		success : function(data, textStatus) {
		},
		error : function(data, textSatus) {
		    alert("에러가 발생");
		},
		complete : function(data, textSatus) {
		}
	    });
	})
    })
</script>
</head>
<body>
	<div id="contentbox">
		<jsp:include page="indexTable.jsp"></jsp:include>
		<div id="mainbox">
			<form action="uploadImage" id="fileform" enctype="multipart/form-data" method="post">
				<input type="file" name="file" id="file">
				<button id="imageUpload" type="button">확인</button>
			</form>
		</div>
	</div>
</body>
</html>