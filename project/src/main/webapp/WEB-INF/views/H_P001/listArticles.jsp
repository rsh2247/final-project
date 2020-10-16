<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <title>글목록창</title>
</head>
<script>
	function fn_articleForm(isLogOn,articleForm,loginForm){
	  /* if(isLogOn != '' && isLogOn != 'false'){ */
	    location.href=articleForm;
	  /* }else{
	    alert("로그인 후 글쓰기가 가능합니다.")
	    location.href=loginForm+'?action=/yoonju/H/H_P001/articleForm.do';
	  } */
	}
</script>
	<h1>자유 게시판</h1>
	<br>
<body>
<table align="center" border="1"  width="70%" style="border-left: none; border-right: none; 
border-bottom: none; border-top: none; " >
  <tr height="10" align="center"  bgcolor="#FFBBC">
     <td >글번호</td>
     <td >작성자</td>              
     <td >제목</td>
     <td >작성일</td>
  </tr>
<c:choose>
  <c:when test="${articlesList ==null }" >
    <tr  height="10">
      <td colspan="4">
         <p align="center">
            <b><span style="font-size:9pt;">등록된 글이 없습니다.</span></b>
        </p>
      </td>  
    </tr>
  </c:when>
  <c:when test="${articlesList !=null }" >
    <c:forEach  var="article" items="${articlesList }" varStatus="articleNum" >
     <tr align="center">
	<td width="5%">${articleNum.count}</td>			<!-- 글번호 카운팅? 글번호는 post_num인데..?? -->
	<td width="10%">${article.user_id }</td>		<!-- 아이디겠지..? -->
	<td align='left'  width="35%">
	  <span style="padding-right:30px"></span>
 		<a class='cls1' href="${contextPath}/**/viewArticle.page?post_num=${article.post_num}">${article.post_title}</a>
	  </td>
	  <td  width="10%">${article.post_date}</td> 	<!-- 작성일이겠지..? -->
	</tr>
    </c:forEach>
     </c:when>
    </c:choose>
</table>
<!-- <a  class="cls1"  href="#"><p class="cls2">글쓰기</p></a> -->
<a  class="cls1"  href="<%-- javascript:fn_articleForm('${isLogOn}', --%>'${contextPath}/yoonju/H/H_P001/articleForm.pro' 
                                                    <%-- '${contextPath}/user/loginPage.do' --%>)"><p class="cls2">글쓰기</p></a>
</body>
</html>