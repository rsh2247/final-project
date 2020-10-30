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

<script type = "text/javascript">
	var loopSearch = true;
	function user_idSearch(){
		if(loopSearch == false)
			return;
			
			var value = document.frmSearch.searchUser.value;
				$.ajax({
					type   : "get",
					async  : "${contextPath}/F/F_P001/searchUser.page",
					data   : {keyword:value},
					succes : function(data, textStatus){
						var jsonInfo = JSON.parse(data);
						displayResult(jsonInfo);
					},
					error : function(data, textStatus){
						alert("에러가 발생했습니다." + data);
					},
					complete : function(data, textStatus){
						
					}
				});
		}

	
</script>

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

     <td >아이디</td>              
     <td >총 점수</td>
     <td>획득정보</td>
     <!-- <td>유저 정보</td> -->
  </tr>
  <c:set var="num" value = ""/>
<c:choose>
  <c:when test="${scoreList ==null }" >
    <tr  height="10">
      <td colspan="10">
         <p align="center">
            <b><span style="font-size:9pt;">등록된 글이 없습니다.</span></b>
        </p>
      </td>  
    </tr>
  </c:when>
  <c:when test="${scoreList !=null }" >
    <c:forEach  var="score" items="${scoreList }" varStatus="scoreNum" >
     <tr align="center">
		<td width="10%">${score.user_id }</td>		<!-- 유저 아이디 -->	
		<td width="10%">${score.score_totalPoint}</td>
		<td width="5%">
			<a href= "${contextPath}/F/F_P001/viewUser_score.page?user_id=${score.user_id }">보기</a>
		</td>
	</tr>
    </c:forEach>
     </c:when>
    </c:choose>
</table>
    <br>
    <table>
    	<div>
    		<a href ="${contextPath}/F/F_P001/categoryScore.page?score_category=1" >문제출제랭킹</a>
    		<a href = "${contextPath}/F/F_P001/listScore.page" >전체랭킹</a>
    		<a href ="${contextPath}/F/F_P001/categoryScore.page?score_category=2" >문제풀이랭킹</a>
    	</div>
    	<div id = "search">
    		<form name = "frmSearch" action = "${contextPath}/F/F_P001/searchUser.page">
    			<input name = "searchUser" type = "text" onKeyUp = "user_idSearch()" />
    			<input type = "submit" name = "search" value = "검 색" />
    		</form>
    		
 		</div>
    </table>
</body>
</html>