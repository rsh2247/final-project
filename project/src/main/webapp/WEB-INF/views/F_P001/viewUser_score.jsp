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
.score_table {margin:auto; align: center; width:70%;table-layout:fixed; paddding-left:50px; background-color:#ededed;border:solid 1px #cdd2d2;}
.score_header{height:41px;padding:0;border-bottom:1px solid #cdd2d2;background:#f2f2f2;line-height:17px;font-size:14px;text-align:center;color:#444b4b;font-weight:normal;}
.score_cell{border-bottom:1px solid #cdd2d2;height:54px;line-height:16px;font-family:Helvetica,AppleSDGothic,"Apple SD Gothic Neo",AppleGothic,Arial,Tahoma;font-size:14px;}
.score_highest_list{text-align:center;margin-bottom:20px;}
.score_highest_box{position:relative;display:inline-block;padding:14px 18px;border:2px solid #bdbbbb;width:220px;background:#fff;box-sizing:border-box;text-align:left;margin-top:30px;margin-left:30px;}.ranking-highest__item a{text-decoration:none;}
.score_highest_box_big{display:block;width:800px;margin:0 auto;padding:35px 40px;border-width:5px;}
.score_highest_box_big+score_highest_box{margin:0;}
.score_highest_box:after{visibility:hidden;display:block;font-size:0;content:"";clear:both;height:0;}
.score_highest_rank{width:30px;background:#bdbbbb;padding:3px 0;line-height:24px;font-family:Helvetica,AppleSDGothic,"Apple SD Gothic Neo",AppleGothic,Arial,Tahoma;font-size:21px;text-align:center;color:#fff;}.ranking-highest__item .ranking-highest__rank{position:absolute;top:0;left:0;margin-top:-2px;margin-left:-2px;}

.highest-rank{border-radius: 100px; }


</style>
<link href="<c:url value="/resources/css/rankScore.css" />" rel="stylesheet">
  <meta charset="UTF-8">
  <title>랭킹</title>
</head>
	<div  style ="align: center; width: 1100px; margin:auto; color:#5573C9;">
		<h1>PRACTICE EVERYDAY RANKING</h1>
		<h2>USER SCORE INFOMATION</h2>
	</div>
	<br>
	
<body>
	<div style ="align: center; width: 1100px; margin:auto;">
		<ul class="score_highest_list">
			<li class="ranking-highest__item ranking-highest__item--big">
				<c:forEach
					var="score" items="${scoreList}" begin="0" end="0">
					<div class="ranking-highest__icon">
					<img src="${contextPath}/resources/image/${score.USER_IMAGE}"
						 class="ranking-highest__image">
						<h3 align= "center">${score.USER_ID}</h3>
					</div>
					<div>
						<table>
							<thead>
								<tr>
								<c:forEach var = "userInfo" items = "${userInfo}">
									<c:if test = "${score.USER_ID eq userInfo.USER_ID}">
										<th>가  입  일: </th><td>&nbsp;&nbsp;  <fmt:formatDate pattern="yyyy-MM-dd" value="${userInfo.USER_SIGNDATE}"/></td>
									</c:if>
								</c:forEach>		
								</tr>
								<tr>
									<th>종 합 점 수: </th><td> &nbsp; &nbsp;${score.SCORE_TOTALPOINT}</td>
								</tr>
								<tr>
								<c:forEach var="category1" items="${categoryList1}">
									<c:if test="${score.USER_ID eq category1.USER_ID}">
										<th>문제출제점수: </th><td> &nbsp; &nbsp;${category1.SCORE_TOTALPOINT}</td>
									</c:if>
								</c:forEach>
								</tr>
								<tr>
								<c:forEach var="category2" items="${categoryList2}">
									<c:if test="${score.USER_ID eq category2.USER_ID}">
										<th>문제풀이점수: </th><td> &nbsp; &nbsp;${category2.SCORE_TOTALPOINT}</td>
									</c:if>
								</c:forEach>		
								</tr>
							</thead>
						</table>
					</div>
				</c:forEach>
			</li>
		</ul>
	</div>




	<div style ="align: center; width: 1100px; margin:auto;">
		<h3>문제출제정보</h3>
		<table class="score_table">
				<tr>
					<th class="score_header">구분</th>
					<th class="score_header">문제번호</th>
					<th class="score_header">문제내역</th>
					<th class="score_header">획득점수</th>
					<th class="score_header">획득날짜</th>
				</tr>

			<c:choose>
				<c:when test="${categoryInfo1 !=null }">
					<c:forEach var="list1" items="${categoryInfo1}" varStatus="scoreNum">
						<tr align="center">
							<td class="score_cell">${scoreNum.count}</td>
							<td class="score_cell">${list1.PRO_NUM}</td>	
							<td class="score_cell">${list1.PRO_NAME}</td>
							<td class="score_cell">${list1.SCORE_POINT}</td>
							<td class="score_cell"><fmt:formatDate pattern="yyyy-MM-dd" value="${list1.SCORE_DATE}"/></td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</table>
		</div>
<br>

	<div style ="align: center; width: 1100px; margin:auto;">
		<br> <br>
		<h3>문제집정보</h3>
		<table class="score_table">	
				<tr>
					<th class="score_header">구분</th>
					<th class="score_header">문제번호</th>
					<th class="score_header">문제내역</th>
					<th class="score_header">획득점수</th>
					<th class="score_header">획득날짜</th>
				</tr>

			<c:choose>
				<c:when test="${categoryInfo2 !=null }">
					<c:forEach var="list2" items="${categoryInfo2}" varStatus="scoreNum">
						<tr align="center">
							<td class="score_cell">${scoreNum.count}</td>
							<td class="score_cell">${list2.PRO_NUM}</td>	
							<td class="score_cell">${list2.PRO_NAME}</td>
							<td class="score_cell">${list2.SCORE_POINT}</td>
							<td class="score_cell"><fmt:formatDate pattern="yyyy-MM-dd" value="${list2.SCORE_DATE}"/></td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</table>
		</div>
    <br>
<div style ="align: center; width: 1100px; margin:auto;"><br>
	<c:forEach var="score" items="${scoreList}" begin = "0" end="0">
    <table>
    	<div>
    		<a href ="${contextPath}/F/F_P001/categoryScore.page?score_content=문제출제&category_id=${score.CATEGORY_ID}" >문제출제랭킹</a>
    		<a href ="${contextPath}/F/F_P001/listScore.page?category_id=${score.CATEGORY_ID}" >전체랭킹</a>
    		<a href ="${contextPath}/F/F_P001/categoryScore.page?score_content=문제집&category_id=${score.CATEGORY_ID}" >문제집랭킹</a>
    	</div>
    	<div id = "search">
    		<form name = "frmSearch" action = "${contextPath}/F/F_P001/searchUser.page?">
    			<input type="hidden" id="gameToken" name="category_id" value="${score.CATEGORY_ID}">
    			
    			<input name = "searchUser" type = "text" style="width: 200px;" placeholder = "유저 아이디를 입력하세요." />
    			<input type = "submit" name = "search" value = "검 색" />
    		</form>
 		</div>
    </table>
    </c:forEach>
</div>    
</body>
</html>