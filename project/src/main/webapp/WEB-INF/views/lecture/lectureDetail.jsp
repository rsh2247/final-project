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
<title>강의 상세 정보</title>
</head>
<body>
	<table>
		<tr>
			<td width="300px" height="300px">
			<c:choose>
				<c:when test="${lecture.lecture_encodedThumbnail ne null }">
					<img width="150" src="data:image/jpg;base64,${lecture.lecture_encodedThumbnail }">
				</c:when>
				<c:otherwise>
					<img width="150" src="${contextPath }/resources/image/ina.png">
				</c:otherwise>
			</c:choose>
			</td>
			<td></td>
		</tr>
		<tr><td colspan="2">${lecture.lecture_name }</td></tr>
		<tr><td colspan="2">${lecture.lecture_category }</td></tr>
		<tr><td colspan="2">${lecture.user_id }</td></tr>
		<tr><td colspan="2">${lecture.lecture_tuition }</td></tr>
		<tr><td colspan="2">${lecture.lecture_score }</td></tr>
		<tr><td colspan="2">${lecture.studentCount }</td></tr>
		<tr><td colspan="2">${lecture.lecture_detail }</td></tr>
		<tr><a href="${contextPath}/orderInit.pay?lecture_id=${lecture.lecture_id}" class="btn btn-primary">수강신청</a></tr>
	</table>
</body>
</html>