<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
	

</style>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- jQeury -->
<script src="http://code.jquery.com/jquery-2.2.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강의 등록 페이지</title>
</head>
<body>
	<form enctype="multipart/form-data" method="post" action="${contextPath }/lecture/insertLecture.do">
		<input type="text" name="lecture_category" placeholder="lecture_category"><br>
		<input type="text" name="lecture_name" placeholder="lecture_name"><br>
		<input type="text" name="lecture_tuition" placeholder="lecture_tuition"><br>
		<input type="text" name="lecture_detail" placeholder="lecture_detail"><br>
		<input type="file" name="image" accept="image/*"><br>
		<input type="submit" value="전송" class="btn btn-info btn-sm">
	</form>
</body>
</html>