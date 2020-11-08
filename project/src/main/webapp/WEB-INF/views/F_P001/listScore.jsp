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
					data   : {user_id:value},
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

  <meta charset="UTF-8">
 

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
  <title>랭킹</title>
</head>
	<h1>PRACTICE EVERYDAY RANKING</h1>
	<br>
<body>
	<div>
		<ul class="score_highest_list">
			<li class="ranking-highest__item ranking-highest__item--big"> <!-- 1위 정보 -->
				<c:forEach
					var="score" items="${scoreList}" begin="0" end="0">
					<div class="ranking-highest__rank">1</div>
					<div class="ranking-highest__icon">
						<img src="${contextPath}/resources/image/${score.user_image}"
						 	 class="ranking-highest__image">
<%-- 						<a href="${contextPath}/F/F_P001/viewUser_score.page?user_id=${score.user_id}">
						<h3 align = "center">${score.user_id}</h3>
						</a> --%>
					</div>
					<div>
						<table>
							<thead>
								<tr>
									<a href="${contextPath}/F/F_P001/viewUser_score.page?user_id=${score.user_id}">
									<h3>${score.user_id}</h3>
									</a>
								</tr>
								<tr>
								<c:forEach var = "userInfo" items = "${userInfo}">
									<c:if test = "${score.user_id eq userInfo.user_id}">
										<th>가  입  일: </th><td> &nbsp; &nbsp;${userInfo.user_signdate}</td>
									</c:if>
								</c:forEach>		
								</tr>
								<tr>
									<th>종 합 점 수: </th><td> &nbsp; &nbsp;${score.score_totalPoint}</td>
								</tr>
								<tr>
								<c:forEach var="category1" items="${categoryList1}">
									<c:if test="${score.user_id eq category1.user_id}">
										<th>문제출제점수: </th><td> &nbsp; &nbsp;${category1.score_totalPoint}</td>
									</c:if>
								</c:forEach>
								</tr>
								<tr>
								<c:forEach var="category2" items="${categoryList2}">
									<c:if test="${score.user_id eq category2.user_id}">
										<th>문제풀이점수: </th><td> &nbsp; &nbsp;${category2.score_totalPoint}</td>
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

	<li class="ranking-highest__item"> <!-- 2위 정보 -->
		<c:forEach var="score" items="${scoreList}" begin="1" end="1">
			<div class="ranking-highest__rank">2</div>
				<%-- <a href="${contextPath}/F/F_P001/viewUser_score.page?user_id=${score.user_id}">${score.user_id}</a> --%> <!-- 유저 아이디 -->
			<div class="ranking-highest__icon" >
				<img src="${contextPath}/resources/image/${score.user_image}"  class="ranking-highest__image"
				 	onerror="this.src='//opgg-static.akamaized.net/images/profile_icons/profileIcondefault.jpg';" >
<!-- 				<a
					href="//www.op.gg/summoner/userName=%EB%AF%B8%EC%B9%9C%EB%93%AF%EC%9D%B4+%ED%8C%8C%EC%9D%B4%ED%8C%85">
					<img
					src="//opgg-static.akamaized.net/images/profile_icons/profileIcon4665.jpg?image=q_auto&amp;v=1518361200"
					class="ranking-highest__image"
					onerror="this.src='//opgg-static.akamaized.net/images/profile_icons/profileIcondefault.jpg';">
				</a> -->
			</div>
			<div class="ranking-highest-champions">
				<div class="ranking-highest-champion">
					<table>
						<tr>
							<a href="${contextPath}/F/F_P001/viewUser_score.page?user_id=${score.user_id}">${score.user_id}</a> <!-- 유저 아이디 -->
						</tr>
						<tr>
							<th>종합점수: </th>
							<td class="ranking-highest-champion__winratio ranking-highest-champion__winratio--red">${score.score_totalPoint}</td>
						</tr>
	<%-- 					</table>
						<span
							class="ranking-highest-champion__winratio ranking-highest-champion__winratio--red">${score.score_totalPoint}
						</span> --%>
						<tr>
							<c:forEach var="category1" items="${categoryList1}">
								<c:if test="${score.user_id eq category1.user_id}">
									<th>문제출제점수: </th>
										<td class="ranking-highest-champion__winratio ranking-highest-champion__winratio--blue">${category1.score_totalPoint}</td>
								</c:if>
							</c:forEach>
						</tr>
						<tr>					
						<c:forEach var="category2" items="${categoryList2}">
							<c:if test="${score.user_id eq category2.user_id}">
								<th>문제풀이점수: </th>
									<td class="ranking-highest-champion__winratio ranking-highest-champion__winratio--green">${category2.score_totalPoint}</td>
							</c:if>
						</c:forEach>
						</tr>
					</table>	
				</div>
			</div>
		</c:forEach>
	</li>

	<li class="ranking-highest__item"> <!-- 3위 정보 -->
		<c:forEach var="score"
			items="${scoreList}" begin="2" end="2">
			<div class="ranking-highest__rank">3</div>
			<div class="ranking-highest__icon">
				<a
					href="${contextPath}/F/F_P001/viewUser_score.page?user_id=${score.user_id}">${score.user_id}</a>
				<a
					href="//www.op.gg/summoner/userName=%EB%AF%B8%EC%B9%9C%EB%93%AF%EC%9D%B4+%ED%8C%8C%EC%9D%B4%ED%8C%85">
					<img
					src="//opgg-static.akamaized.net/images/profile_icons/profileIcon4665.jpg?image=q_auto&amp;v=1518361200"
					class="ranking-highest__image"
					onerror="this.src='//opgg-static.akamaized.net/images/profile_icons/profileIcondefault.jpg';">
				</a>
			</div>
			<div class="ranking-highest-champions">
				<div class="ranking-highest-champion">
					<span
						class="ranking-highest-champion__winratio ranking-highest-champion__winratio--red">${score.score_totalPoint}</span>
					<c:forEach var="category1" items="${categoryList1}">
						<c:if test="${score.user_id eq category1.user_id}">
							<span
								class="ranking-highest-champion__winratio ranking-highest-champion__winratio--blue">${category1.score_totalPoint}</span>
						</c:if>
					</c:forEach>
					<c:forEach var="category2" items="${categoryList2}">
						<c:if test="${score.user_id eq category2.user_id}">
							<span
								class="ranking-highest-champion__winratio ranking-highest-champion__winratio--green">${category2.score_totalPoint}</span>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</c:forEach></li>

	<li class="ranking-highest__item"> <!-- 4위 정보 -->
		<c:forEach var="score"
			items="${scoreList}" begin="3" end="3">
			<div class="ranking-highest__rank">4</div>
			<div class="ranking-highest__icon">
				<a
					href="${contextPath}/F/F_P001/viewUser_score.page?user_id=${score.user_id}">${score.user_id}</a>
				<a
					href="//www.op.gg/summoner/userName=%EB%AF%B8%EC%B9%9C%EB%93%AF%EC%9D%B4+%ED%8C%8C%EC%9D%B4%ED%8C%85">
					<img
					src="//opgg-static.akamaized.net/images/profile_icons/profileIcon4665.jpg?image=q_auto&amp;v=1518361200"
					class="ranking-highest__image"
					onerror="this.src='//opgg-static.akamaized.net/images/profile_icons/profileIcondefault.jpg';">
				</a>
			</div>
			<div class="ranking-highest-champions">
				<div class="ranking-highest-champion">
					<span
						class="ranking-highest-champion__winratio ranking-highest-champion__winratio--red">${score.score_totalPoint}</span>
					<c:forEach var="category1" items="${categoryList1}">
						<c:if test="${score.user_id eq category1.user_id}">
							<span
								class="ranking-highest-champion__winratio ranking-highest-champion__winratio--blue">${category1.score_totalPoint}</span>
						</c:if>
					</c:forEach>
					<c:forEach var="category2" items="${categoryList2}">
						<c:if test="${score.user_id eq category2.user_id}">
							<span
								class="ranking-highest-champion__winratio ranking-highest-champion__winratio--green">${category2.score_totalPoint}</span>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</c:forEach></li>

	<li class="ranking-highest__item"> <!-- 5위 정보 -->
		<c:forEach var="score"
			items="${scoreList}" begin="4" end="4">
			<div class="ranking-highest__rank">5</div>
			<div class="ranking-highest__icon">
				<a
					href="${contextPath}/F/F_P001/viewUser_score.page?user_id=${score.user_id}">${score.user_id}</a>
				<a
					href="//www.op.gg/summoner/userName=%EB%AF%B8%EC%B9%9C%EB%93%AF%EC%9D%B4+%ED%8C%8C%EC%9D%B4%ED%8C%85">
					<img
					src="//opgg-static.akamaized.net/images/profile_icons/profileIcon4665.jpg?image=q_auto&amp;v=1518361200"
					class="ranking-highest__image"
					onerror="this.src='//opgg-static.akamaized.net/images/profile_icons/profileIcondefault.jpg';">
				</a>
			</div>
			<div class="ranking-highest-champions">
				<div class="ranking-highest-champion">
					<span
						class="ranking-highest-champion__winratio ranking-highest-champion__winratio--red">${score.score_totalPoint}</span>
					<c:forEach var="category1" items="${categoryList1}">
						<c:if test="${score.user_id eq category1.user_id}">
							<span
								class="ranking-highest-champion__winratio ranking-highest-champion__winratio--blue">${category1.score_totalPoint}</span>
						</c:if>
					</c:forEach>
					<c:forEach var="category2" items="${categoryList2}">
						<c:if test="${score.user_id eq category2.user_id}">
							<span
								class="ranking-highest-champion__winratio ranking-highest-champion__winratio--green">${category2.score_totalPoint}</span>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</c:forEach></li>

	<div>
		<br> <br>
		<table class="score_table">	<!-- 6위부터의 정보 -->
			<thead>
				<tr>
					<th class="score_header">순위</th>
					<th class="score_header">아이디</th>
					<th class="score_header">총 점수</th>
					<th class="score_header">획득정보</th>
				</tr>
			</thead>
			<c:set var="num" value="" />
			<c:choose>
				<c:when test="${scoreList !=null }">
					<c:forEach var="score" items="${scoreList }" varStatus="scoreNum"
						begin="5">
						<tr align="center">
							<td class="score_cell">${score.score_rank}</td>
							<!-- 카운트 -->
							<td class="score_cell">${score.user_id }</td>
							<!-- 유저 아이디 -->
							<td class="score_cell">${score.score_totalPoint}</td>
							<td class="score_cell"><a
								href="${contextPath}/F/F_P001/viewUser_score.page?user_id=${score.user_id }">보기</a>
							</td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</table>
	</div>
<div><br>

    <table> <!-- 하위 메뉴 -->
    	<div>
    		<a href ="${contextPath}/F/F_P001/categoryScore.page?score_category=1" >문제출제랭킹</a>
    		<a href = "${contextPath}/F/F_P001/listScore.page" >전체랭킹</a>
    		<a href ="${contextPath}/F/F_P001/categoryScore.page?score_category=2" >문제풀이랭킹</a>
    	</div>
    	<div id = "search">
    		<form name = "frmSearch" action = "${contextPath}/F/F_P001/searchUser.page">
    			<input name = "searchUser" type = "text" style="width:200px;" placeholder = "유저 아이디를 입력하세요." onKeyUp = "user_idSearch()" />
    			<input type = "submit" name = "search" value = "검 색" />
    		</form>
 		</div>
    </table>
</div>    
</body>
</html>