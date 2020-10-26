<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<c:set var="article"  value="${articleMap.article}"  />
<c:set var="imageFileList"  value="${articleMap.imageFileList}"  />



<%
  request.setCharacterEncoding("UTF-8");
%> 

<head>
   <meta charset="UTF-8">
   <title>글보기</title>
   <style>
     #tr_file_upload{
       display:none;
     }
     #tr_btn_modify{
       display:none;
     }
   
   </style>
   <script  src="http://code.jquery.com/jquery-latest.min.js"></script> 
   <script type="text/javascript" >
     function backToList(obj){								/* 뒤로가기 */
	    obj.action="${contextPath}/H/H_P001/listArticles.page";
	    obj.submit();
     }
 
	 function fn_enable(obj){								/* 수정한 데이터 */
		 document.getElementById("i_post_title").disabled=false;
		 document.getElementById("i_post_content").disabled=false;
		 document.getElementById("i_imageFileName").disabled=false;
		 document.getElementById("tr_btn_modify").style.display="block";
		 document.getElementById("tr_file_upload").style.display="block";
		 document.getElementById("tr_btn").style.display="none";
	 }
	 
 	 function fn_modify_article(obj){						/* 수정하기 제출 */
		 obj.action="${contextPath}/H/H_P001/modifyArticle.user";
		 obj.submit();
	 }
	 
	 function fn_remove_article(url,post_num){				/* 글 삭제하기 */
		 var form = document.createElement("form");
		 form.setAttribute("method", "post");
		 form.setAttribute("action", url);
	     var articleNOInput = document.createElement("input");
	     articleNOInput.setAttribute("type","hidden");
	     articleNOInput.setAttribute("name","post_num");
	     articleNOInput.setAttribute("value", post_num);
		 
	     form.appendChild(articleNOInput);
	     document.body.appendChild(form);
	     form.submit();
	 
	 }
	 
	 function fn_reply_form(url, post_parent){			/* 댓글달기? */
		console.log("########################");
			 
		var form = $("form[name='frmArticle']");
		 form.attr("method", "post");
		 form.attr("action", url);
	     /* var parentNOInput = document.createElement("input");
	     parentNOInput.setAttribute("type","hidden");
	     parentNOInput.setAttribute("name","post_parent");
	     parentNOInput.setAttribute("value", post_parent);
		 
	     form.appendChild(parentNOInput);
	     document.body.appendChild(form); */
	     console.log("form의 내용 ! "+JSON.stringify(form));
		 form.submit();
	 }
	 
	 function readURL(input) {
	     if (input.files && input.files[0]) {
	         var reader = new FileReader();
	         reader.onload = function (e) {
	             $('#preview').attr('src', e.target.result);
	         }
	         reader.readAsDataURL(input.files[0]);
	     }
	 }  
/* 	 
	  function modifyArticle(obj){
		    obj.action="${contextPath}/H/H_P001/modArticle.user";
		    obj.submit();
		  } */
	  
	  
 </script>
</head>
<body>
  <form name="frmArticle" method="post"  action="${contextPath}"  enctype="multipart/form-data">
  <%-- <input type="hidden" name="post_num" value="${article2.post_num}"/> --%>
  <table  border=0  align="center">
  <tr>
   <td width=150 align="center" bgcolor=#FF9933>
      글번호
   </td>
   <td >
    <input type="text"  value="${article2.post_num}"  disabled />
    <input type="hidden" name="post_num" value="${article2.post_num}"  />
   </td>
  </tr>
  <tr>
    <td width="150" align="center" bgcolor="#FF9933">
      작성자 아이디
   </td>
   <td >
    <input type=text value="${article2.user_id}" name="writer"  disabled />
   </td>
  </tr>
  <tr>
    <td width="150" align="center" bgcolor="#FF9933" >
      제목
   </td>
   <td>
    <input type=text value="${article2.post_title}"  name="post_title"  id="i_post_title" disabled />
   </td>   
  </tr>
  <tr>
    <td width="150" align="center" bgcolor="#FF9933">
      내용
   </td>
   <td>
    <textarea rows="20" cols="60"  name="post_content"  id="i_post_content"  disabled />${article2.post_content}</textarea>
   </td>  
  </tr>

 	
  <c:choose> 
	  <c:when test="${not empty article2.imageFileName && article2.imageFileName!='null' }">
	   	<tr>
		    <td width="150" align="center" bgcolor="#FF9933"  rowspan="2">
		      이미지
		   </td>
		   <td>
		     <input  type= "hidden"   name="originalFileName" value="${article2.imageFileName }" />
		    <img src="${contextPath}/download.do?post_num=${article2.post_num}&imageFileName=${article2.imageFileName}" id="preview"  /><br>
		   </td>   
		  </tr>  
		  <tr>
		    <td ></td>
		    <td>
		       <input  type="file"  name="imageFileName " id="i_imageFileName"   disabled   onchange="readURL(this);"   />
		    </td>
		  </tr> 
		 </c:when>
		 <c:otherwise>
		    <tr  id="tr_file_upload" >
				    <td width="150" align="center" bgcolor="#FF9933"  rowspan="2">
				      이미지
				    </td>
				    <td>
				      <input  type= "hidden"   name="originalFileName" value="${article2.imageFileName }" />
				    </td>
			    </tr>
			    <tr>
				    <td ></td>
				    <td>
				       <img id="preview"  /><br>
				       <input  type="file"  name="imageFileName " id="i_imageFileName"   disabled   onchange="readURL(this);"   />
				    </td>
			  </tr>
		 </c:otherwise>
	 </c:choose>
  <tr>
	   <td width="150" align="center" bgcolor="#FF9933">
	      등록일자
	   </td>
	   <td>
	    <input type=text value="<fmt:formatDate value="${article2.post_date}" />" disabled />
	   </td>   
  </tr>
  <!-- 댓글 코드 시작 -->
 	<tr>
 		<td>작성자</td>
 		<td>
 			첫 번째 댓글
 		</td>
 	</tr> 
 	<tr>
 		<td>작성자</td>
 		<td>
 			두 번째 댓글
 		</td>
 	</tr> 
  	<tr>
  	<td>작성자</td>
 		<td>
 			세 번째 댓글
 		</td>
 	</tr> 
  <tr>
				<td align="center" valign="top"><br><input  value="${cus.getUsername()}" disabled/>  </td>
				<td align= "left" colspan=2><textarea name="post_content" rows="10" cols="65" maxlength="4000"></textarea> </td>
     </tr>
  
  
  
  
  
  <!-- 댓그 코드 끝 -->
  <tr   id="tr_btn_modify"  align="center"  >
	   <td colspan="2"   >
	       <input type=button value="확인"   onClick="fn_modify_article(frmArticle)"  >
           <input type=button value="취소"  onClick="backToList(frmArticle)">
	   </td>   
  </tr>
    
  <tr  id="tr_btn"    >
   <td colspan="2" align="center">
       <c:if test="${pageContext.request.userPrincipal.name == article2.user_id }">
	      <input type=button value="수정하기" onClick="fn_enable(this.form)" />
	      <input type=button value="삭제하기" onClick="fn_remove_article('${contextPath}/H/H_P001/removeArticle.user', ${article2.post_num})">
	    </c:if>
	    <input type=button value="리스트로 돌아가기"  onClick="backToList(this.form)">
	     <input type=button value="답글쓰기"  onClick="fn_reply_form('${contextPath}/H/H_P001/addrplyArticle.user', ${article2.post_num})">
   </td>
  </tr>
 </table>
 </form>
</body>
</html>