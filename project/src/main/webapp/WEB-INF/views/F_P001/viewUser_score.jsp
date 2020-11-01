<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>  
<!DOCTYPE html>
<html>
<head>

 <style>
   .cls1 {text-decoration:none;}
   .cls2{text-align:center; font-size:30px;}
  </style>
  <meta charset="UTF-8">
  <title>랭킹</title>
</head>

	<h1>PRACTICE EVERYDAY RANKING</h1>
	<br>
<body>

<table align="center" border="1"  width="70%" style="border-left: none; border-right: none; 
border-bottom: none; border-top: none; " >
  <tr height="10" align="center"  bgcolor="#FFBBC">
     <td >번호</td>
     <td >아이디</td>      
     <td>분류</td>        
     <td >획득점수</td>
     <td>내역</td>
     <td>날짜</td>



  </tr>
  <c:set var="num" value = ""/>
<c:choose>

  <c:when test="${scoreList !=null }" >
    <c:forEach  var="score" items="${scoreList }" varStatus="scoreNum" >
     <tr align="center">
		<td width="5%">${scoreNum.count}</td>		<!-- 카운트 -->
		<td width="10%">${score.user_id }</td>		<!-- 유저 아이디 -->	
		<td width="5%">${score.score_category}</td>	<!-- 유형 -->
		<td width="10%">${score.score_point}</td>	<!-- 획득포인트 -->
		<td width="5%">${score.score_content}</td>	<!-- 획득내역 -->
		<td width="5%">${score.score_date}</td>		<!-- 날짜 -->
	</tr>
    </c:forEach>
     </c:when>
    </c:choose>
</table>
    <br>
    		<a href ="${contextPath}/F/F_P001/categoryScore.page?score_category=1" >문제출제랭킹</a>
    		<a href = "${contextPath}/F/F_P001/listScore.page" >전체랭킹</a>
    		<a href ="${contextPath}/F/F_P001/categoryScore.page?score_category=2" >문제풀이랭킹</a>
    	<div id = "search">
    		<form name = "frmSearch" action = "${contextPath}/F/F_P001/searchUser.page">
    			<input name = "searchUser" type = "text" onKeyUp = "user_idSearch()" />
    			<input type = "submit" name = "search" value = "검 색" />
    		</form>
 		</div>
</body>
</html>