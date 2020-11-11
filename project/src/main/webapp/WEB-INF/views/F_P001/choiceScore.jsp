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

<meta charset="UTF-8">

<link href="<c:url value="/resources/css/choiceSubject.css" />" rel="stylesheet" type = "text/css">

  <title>과목선택</title>
</head>
	<div  style ="align: center; width: 1100px; margin:auto; color:#5573C9;">
		<h1>PRACTICE EVERYDAY RANKING</h1>
		<h2>CHOICE SUBJECT</h2>
	</div>	
	<br>
<body>
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
								<li><a href="${contextPath}/F/F_P001/listScore.page?category_id=1"><span>TOEIC</span></a></li>
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