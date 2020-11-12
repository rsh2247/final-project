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
<script>
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

<meta charset="UTF-8">

<link href="<c:url value="/resources/css/choiceSubject.css" />" rel="stylesheet" type = "text/css">
<link href="<c:url value="/resources/css/rankScore.css" />" rel="stylesheet">
  <title>과목선택</title>
</head>
	<div  style ="align: center; width: 1100px; margin:auto; color:#5573C9;">
		<h1>PRACTICE EVERYDAY RANKING</h1>
		<br>
		<br>
		<h2>ALLROUND USER SCORE</h2>
	</div>	
	<br>
<body>
<div style ="align: center; width: 1100px; margin:auto;">
		<ul class="score_highest_list">
			<li class="ranking-highest__item ranking-highest__item--big"> <!-- 1위 정보 -->
				<c:forEach
					var="score" items="${allUserScore}" begin="0" end="0">
					<div class="ranking-highest__rank">1</div>
					<div class="ranking-highest__icon">
						<img src="${contextPath}/resources/image/${score.USER_IMAGE}"
						 	 class="ranking-highest__image">
					</div>
					<div>
						<table>
							<thead>
								<tr>
									<%-- <a href="${contextPath}/F/F_P001/viewUser_score.page?user_id=${score.USER_ID}"> --%>
									<h3>${score.USER_ID}</h3>
									</a>
								</tr>
								<tr>
									<th>종 합 점 수: </th><td class="ranking-highest-champion__winratio--red"> &nbsp; &nbsp;${score.SCORE_TOTALPOINT}</td>
								</tr>
							</thead>
						</table>
					</div>
				</c:forEach>
			</li>
		</ul>
	</div>
<div style ="width: 1100px; margin:auto;">
	<li class="ranking-highest__item"> <!-- 2위 정보 -->
		<c:forEach var="score" items="${allUserScore}" begin="1" end="1">
			<div class="ranking-highest__rank">2</div>
			<div class="ranking-highest__icon" >
				<img src="${contextPath}/resources/image/${score.USER_IMAGE}"  class="ranking-highest__image"
				 	onerror="this.src='//opgg-static.akamaized.net/images/profile_icons/profileIcondefault.jpg';" >
			</div>
			<div class="ranking-highest-champions">
				<div class="ranking-highest-champion">
					<table>
						<tr>
							<%-- <a href="${contextPath}/F/F_P001/viewUser_score.page?user_id=${score.USER_ID}">--%>&nbsp;${score.USER_ID}</a> <!-- 유저 아이디 -->
						</tr>
						<tr>
							<th>종&nbsp;합&nbsp;점&nbsp;수: </th>
							<td class="ranking-highest-champion__winratio ranking-highest-champion__winratio--red">&nbsp;${score.SCORE_TOTALPOINT}</td>
						</tr>					
					</table>
				</div>
			</div>
		</c:forEach>
	</li>

	<li class="ranking-highest__item"> <!-- 3위 정보 -->
		<c:forEach var="score"
			items="${allUserScore}" begin="2" end="2">
			<div class="ranking-highest__rank">3</div>
			<div class="ranking-highest__icon" >
				<img src="${contextPath}/resources/image/${score.USER_IMAGE}"  class="ranking-highest__image"
				 	onerror="this.src='//opgg-static.akamaized.net/images/profile_icons/profileIcondefault.jpg';" >
			</div>
			<div class="ranking-highest-champions">
				<div class="ranking-highest-champion">
					<table>
						<tr>
							<%-- <a href="${contextPath}/F/F_P001/viewUser_score.page?user_id=${score.USER_ID}">--%>&nbsp;${score.USER_ID}</a><!-- 유저 아이디 -->
						</tr>
						<tr>
							<th>종&nbsp;합&nbsp;점&nbsp;수: </th>
							<td class="ranking-highest-champion__winratio ranking-highest-champion__winratio--red">&nbsp;${score.SCORE_TOTALPOINT}</td>
						</tr>
					</table>	
				</div>
			</div>
		</c:forEach>
	</li>

	<li class="ranking-highest__item"> <!-- 4위 정보 -->
		<c:forEach var="score"
			items="${allUserScore}" begin="3" end="3">
			<div class="ranking-highest__rank">4</div>
			<div class="ranking-highest__icon" >
				<img src="${contextPath}/resources/image/${score.USER_IMAGE}"  class="ranking-highest__image"
				 	onerror="this.src='//opgg-static.akamaized.net/images/profile_icons/profileIcondefault.jpg';" >
			</div>
			<div class="ranking-highest-champions">
				<div class="ranking-highest-champion">
					<table>
						<tr>
							<%-- <a href="${contextPath}/F/F_P001/viewUser_score.page?user_id=${score.USER_ID}">--%>&nbsp;${score.USER_ID}</a> <!-- 유저 아이디 -->
						</tr>
						<tr>
							<th>종&nbsp;합&nbsp;점&nbsp;수: </th>
							<td class="ranking-highest-champion__winratio ranking-highest-champion__winratio--red">&nbsp;${score.SCORE_TOTALPOINT}</td>
						</tr>
					</table>	
				</div>
			</div>
		</c:forEach>
	</li>

	<li class="ranking-highest__item"> <!-- 5위 정보 -->
		<c:forEach var="score"
			items="${allUserScore}" begin="4" end="4">
			<div class="ranking-highest__rank">5</div>
			<div class="ranking-highest__icon" >
				<img src="${contextPath}/resources/image/${score.USER_IMAGE}"  class="ranking-highest__image"
				 	onerror="this.src='//opgg-static.akamaized.net/images/profile_icons/profileIcondefault.jpg';" >
			</div>
			<div class="ranking-highest-champions">
				<div class="ranking-highest-champion">
					<table>
						<tr>
							<%-- <a href="${contextPath}/F/F_P001/viewUser_score.page?user_id=${score.USER_ID}"> --%>&nbsp;${score.USER_ID}</a> <!-- 유저 아이디 -->
						</tr>
						<tr>
							<th>종&nbsp;합&nbsp;점&nbsp;수: </th>
							<td class="ranking-highest-champion__winratio ranking-highest-champion__winratio--red">&nbsp;${score.SCORE_TOTALPOINT}</td>
						</tr>
					</table>	
				</div>
			</div>
		</c:forEach>
	</li>
</div>	

	<div  style ="align: center; width: 1100px; margin:auto; color:#5573C9;">
		<br><br><br><br>
		<h2>CHOICE SUBJECT</h2></div>
<div style ="align: center; width: 1100px; margin:auto;" >
	<div class="global-menu" >
		<div class="menu-popular">
			<div class="inner">
				<div class="section">
				</div>
			</div>
		</div>

		<div class="menu-item">
			<div class="inner">

				<div class="section">
					<div class="menu-title">
						<h2 class="title">공인어학시험</h2>
					</div>
					<div class="menu-list">
						<div class="list">
							<ul>
								<li><a href="${contextPath}/F/F_P001/listScore.page?category_id=1001"><span>TOEIC</span></a></li>
								<li class=""><a href="${contextPath}/F/F_P001/listScore.page?category_id=2"><span>TOEFL</span></a></li>
								<li><a href="//gov.eduwill.net/Common/Product/goods/auto/index.asp?masterSeq=NzYyOQ=="><span>TEPS</span></a></li>
								<li class=""><a href="//seven.eduwill.net"><span>HSK</span></a></li>
								<li><a href="//post.eduwill.net"><span>JLPT</span></a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="section">
					<div class="menu-title">
						<h2 class="title">국가기술자격</h2>
					</div>
					<div class="menu-list">
						<div class="list">
							<ul>
								<li><a href="//land.eduwill.net"><span>공인중개사</span></a></li>
								<li class=""><a href="//house.eduwill.net"><span>주택관리사</span></a></li>
								<li class=""><a href="//guard.eduwill.net"><span>경비지도사</span></a></li>
								<li class=""><a href="//trade.eduwill.net"><span>국제무역사</span></a></li>
								<li class="hover"><a href="//road.eduwill.net"><span>도로교통사고감정사</span></a></li>
								<li><a href="//trans.eduwill.net"><span>물류관리사</span></a></li>
								<li class=""><a href="//well.eduwill.net"><span>사회복지사1급</span></a></li>
								<li class=""><a href="//flow.eduwill.net"><span>유통관리사</span></a></li>
								<li><a href="//job.eduwill.net"><span>직업상담사</span></a></li>
								<li class=""><a href="//admin.eduwill.net"><span>행정사</span></a></li>
							</ul>
						</div>
						<div class="list">
							<ul>
								<li><a href="//energy.eduwill.net"><span>전기기사</span></a></li>
								<li><a href="//elec.eduwill.net"><span>전기기능사</span></a></li>
								<li><a href="//engin.eduwill.net"><span>소방시설관리사</span></a></li>
								<li><a href="//engin.eduwill.net"><span>소방설비기사</span></a></li>
								<li><a href="//safety.eduwill.net"><span>산업안전기사</span></a></li>
								<li><a href="//arch.eduwill.net"><span>건축기사</span></a></li>
								<li><a href="//civ.eduwill.net"><span>토목기사</span></a></li>
								<li class=""><a href="${contextPath}/F/F_P001/listScore.page?category_id=2"><span>정보처리기사</span></a></li>
								<li class="hover"><a href="//it.eduwill.net"><span>전산세무회계</span></a></li>
							</ul>
						</div>

					</div>
				</div>

				<div class="section">
					<div class="menu-title">
						<h2 class="title">민간기술자격</h2>
					</div>
					<div class="menu-list">
						<div class="list">
							<ul>
								<li class=""><a href="//public.eduwill.net/zPublic/main.asp?utm_source=global&amp;utm_medium=textbanner&amp;utm_campaign=public_200604"><span>한국사능력검증시험</span></a></li>
								<li><a href="//public.eduwill.net/zPublic/main.asp?utm_source=global&amp;utm_medium=textbanner&amp;utm_campaign=big_200604"><span>KBS한국어능력시험</span></a></li>
								<li><a href="//public.eduwill.net/zPublic/main.asp?utm_source=global&amp;utm_medium=textbanner&amp;utm_campaign=big_200604"><span>자산관리사(FP)</span></a></li>
								<li><a href="//public.eduwill.net/zPublic/main.asp?utm_source=global&amp;utm_medium=textbanner&amp;utm_campaign=big_200604"><span>도로교통사고감정사</span></a></li>

							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>		

</body>
</html>