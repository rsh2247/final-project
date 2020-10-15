<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 
<%
  request.setCharacterEncoding("UTF-8");
%> 

<head>
<meta charset="UTF-8">
<title>글쓰기창</title>
<script  src="http://code.jquery.com/jquery-latest.min.js">

   function readURL(input) {
      if (input.files && input.files[0]) {
	      var reader = new FileReader();
	      reader.onload = function (e) {
	        $('#preview').attr('src', e.target.result);
          }
         reader.readAsDataURL(input.files[0]);
      }
  }  
  function backToList(obj){
    obj.action="${contextPath}/yoonju/H/H_P001/listArticles.do";
    obj.submit();
  }
  
  var cnt=1;
  function fn_addFile(){
	  $("#d_file").append("<br>"+"<input type='file' name='file"+cnt+"' />");
	  cnt++;
  }  

</script>
<script type="text/javascript" src="${contextPath}/resources/ckeditor/ckeditor/ckeditor.js"></script>

 <title>글쓰기창</title>
</head>
<body>
<h1 style="text-align:center">글쓰기</h1>

  <form name="articleForm" method="post" action="${contextPath}/yoonju/H/H_P001/addNewArticle.do"  enctype="multipart/form-data">
  <input type = "hidden" name = "post_parent" value = ""/>
  <input type = "hidden" value = "${member.name} ">
	<div class="container" align= "center">
    <div class="content" style="width: 70%" align = "center">
    
        <div class="row justify-content-md-center">
            <div class="col-sm-9">
            <div class="input-group mb-3">
                <div class="input-group-prepend" align = "left">
                    <label class="input-group-text">제목</label>
                  </div>            
                  <input type="text" name = "post_title" style = "width: 99%">      <!-- 제목 설정 -->  <!-- 여기를 수정해야 함 (아이디 추가??) --> 
                </div>
            </div>
            <div class="col-sm-3">
                <div class="input-group mb-3" align = "left">
                    <select id="post_category">
                    <option selected>지역</option>
                    <option value="1">서울/경기</option>
                    <option value="2">강원도</option>
                    <option value="3">경상도</option>
                    <option value="4">전라도</option>
                    <option value="5">충청도</option>
                    <option value="6">제주/기타</option>
                  </select>  
                </div>
            </div>            
      </div>
      
      <hr>
      
      <div class="row justify-content-md-center">
          <div class="col_c" style="margin-bottom: 30px">
                <div class="input-group">                 
                  <textarea name = "post_content" id="post_content">내용을 입력하세요.</textarea> <!-- 에디터 안의 내용이 이 쪽으로 들어간다 -->
                  <script type="text/javascript">
                  CKEDITOR.replace('post_content'
                                                  , {height: 500                                                  
                                                  });
                  </script>
                </div>
            </div> 
      </div>
      
<!--       <div class="row justify-content-md-center">
            <div class="input-group mb-3">
              <div class="input-group-prepend">
                <span class="input-group-text">GitHub</span>
              </div>
              <input type="text" class="form-control">
            </div>
      </div> -->
      
      <div class="row justify-content-md-center" align = "left">
            <div class="input-group mb-3">
              <div class="input-group-prepend">
                <span class="input-group-text" id="imageFileName">썸네일</span>
              </div>
              <br>
              <div class="custom-file">
                  &nbsp;<input type="file" id="imageFileName">
              </div>
            </div>
      </div>
      <br>
      <div align = "right">
        <button type="submit" style="width: 20%; font-weight: bold">등   록</button>
            <input type= button value = "목록보기" onClick="backToList(this.form)" style="width: 20%; " />
        </div>
  </div>
</div>
</form>


<%-- 
  <form name="articleForm" method="post"   action="${contextPath}yoonju/H/H_P001/addNewArticle.do"   enctype="multipart/form-data">
    <table border="0" align="center">
      <input type="hidden" name="parentNo" value=""/>
      <tr>
					<td align="right"> 작성자</td>
					<td colspan=2  align="left"><input type="text" size="20" maxlength="100"  value="${member.name }" readonly/> </td>
			</tr>
	     <tr>
			   <td align="right">글제목: </td>
			   <td colspan="2"><input type="text" size="67"  maxlength="500" name="title" /></td>
		 </tr>
	 		<tr>
				<td align="right" valign="top"><br>글내용: </td>
				<td colspan=2><textarea name="content" rows="10" cols="65" maxlength="4000"></textarea> </td>
     </tr>
     <tr>
			  <td align="right">이미지파일 첨부:  </td>
			  <td> <input type="file" name="imageFileName"  onchange="readURL(this);" /></td>
			  <td><img  id="preview" src="#"   width=200 height=200/></td>
			  
			  
			  <td align="right">이미지파일 첨부</td>
				<td align="left"> <input type="button" value="파일 추가" onClick="fn_addFile()"/></td>
				
				
	   </tr>
	   <tr>
	      <td colspan="4"><div id="d_file"></div></td>
	   </tr>
	    <tr>
	      <td align="right"> </td>
	      <td colspan="2">
	       <input type="submit" value="글쓰기" />
	       <input type=button value="목록보기"onClick="backToList(this.form)" />
	      </td>
     </tr>
    </table>
  </form> --%>
</body>
</html>
