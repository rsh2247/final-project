<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
	td.lectureDetail{
		valign:top;
		align:right;
	}
	div.popularLecture{
		align:left;
	}
	

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
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet" type="text/css"	/>
<title>강의 메인 페이지</title>
</head>
<body>
	<div class="searchFrm">
		
		<form class="form-inline" method="post" action="${contextPath }/lecture/search.do">
			 <div class="form-group">
		 		<label for="searchKeyword"></label>
				<input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="검색하기"/>
			 </div>
			 <button type="submit" class="btn btn-info btn-sm">검색</button>
		</form>
	</div>
	<hr>
	<div class="container-fluid popularLecture">
			<h2>인기강의 추천</h2>
			<div class="row">
				<c:forEach var="list" items="${lectureList }">
					<div class="col-md-2">
						<table>
							<tr>
								<td class="lectureImg" style="width:150px; height:150px;">
									<c:choose>
										<c:when test="${list.lecture_encodedThumbnail ne null }">
											<img width="150" src="data:image/jpg;base64,${list.lecture_encodedThumbnail }">
										</c:when>
										<c:otherwise>
											<img width="150" src="${contextPath }/resources/image/ina.png">
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td class="lectureName" style="width:150px; height:auto;">
									<p><a href="${contextPath }/lecture/getLecture.do?lecture_id=${list.lecture_id }">${list.lecture_name }</a></p>
								</td>
							</tr>
							<tr>
								<td class="lectureDetail" style="width:150px; height:100px;">
									<p>${list.lecture_detail }</p>
								</td>
							</tr>
						</table>
					</div>
				</c:forEach>
		</div>
		<hr>
		<div class="untilted">
			
		</div>
	</div>
	<!-- 나중에 쓸 이미지 등록 코드 -->
<%-- 	<form enctype="multipart/form-data" method="post" action="${contextPath }/lecture/updateThumbnail.do"> --%>
<!-- 		<input type="text" name="lecture_id" /> -->
<!-- 		<input type="file" name="image" accept="image/*"> -->
<!-- 		<input type="submit" value="전송" class="btn btn-info btn-sm"> -->
<!-- 	</form> -->
</body>
</html>