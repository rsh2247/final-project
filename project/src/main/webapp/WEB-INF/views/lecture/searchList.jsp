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
<script>

</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강의 검색 결과</title>
</head>
<body>
	<h3>검 색 결 과</h3>
	<table class="table table-hover">
  		<tr>
  			<th>사아진</th>
  			<th>카테고리</th>
  			<th>강의명</th>
  			<th>강사명</th>
  			<th>수강료</th>
  			<th>강의설명</th>
  			<th>평가점수</th>
  			<th>수강생수</th>
  		</tr>
  		<c:forEach var="list" items="${lectureList }">
  			<tr>
  				<td></td>
  				<td>${list.lecture_category }</td>
  				<td><a href="${contextPath }/lecture/getLecture.do?lecture_id=${list.lecture_id }">${list.lecture_name }</a></td>
  				<td>${list.user_id }</td>
  				<td>${list.lecture_tuition }</td>
  				<td>${list.lecture_detail }</td>
  				<td>${list.lecture_score }</td>
  				<td>${list.studentCount }</td>
  			</tr>
  		</c:forEach>
	</table>
	<!-- 페이징  -->
	<nav aria-label="Page navigation example">
	    <ul class="pagination justify-content-center">
	        <c:if test="${pagination.curRange ne 1 }">
	            <li class="page-item">
	            <a class="page-link" href="?curPage=1&searchKeyword=${searchKeyword }">처음</a> 
	            </li>
	        </c:if>
	        <c:if test="${pagination.curPage ne 1}">
	            <li class="page-item">
	                <a class="page-link" href="?curPage=${pagination.prevPage}&searchKeyword=${searchKeyword }">이전</a> 
	                </li>
	        </c:if>
	        <c:forEach var="pageNum" begin="${pagination.startPage}" end="${pagination.endPage}">
	            <c:choose>
	                <c:when test="${pageNum eq  pagination.curPage}">
	                    <li class="page-item active">
	                        <a class="page-link" href="?curPage=${pageNum}&searchKeyword=${searchKeyword }">${pageNum }</a>
	                    </li>
	                </c:when>
	                <c:otherwise>
	                    <li class="page-item">
	                        <a class="page-link" href="?curPage=${pageNum}&searchKeyword=${searchKeyword }">${pageNum }</a>
	                    </li>
	                </c:otherwise>
	            </c:choose>
	        </c:forEach>
	        <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
	            <li class="page-item">
	                <a class="page-link" href="?curPage=${pagination.nextPage}&searchKeyword=${searchKeyword }">다음</a> 
	                </li>	                        
	        </c:if>
	        <c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
	            <li class="page-item">
	                <a class="page-link" href="#"  onClick="fn_paging('${pagination.pageCnt }')">끝</a> 
	                </li>	                    
  	 	 	</c:if>
	   	 </ul>
	</nav>
<!-- 페이징 END -->
</body>
</html>