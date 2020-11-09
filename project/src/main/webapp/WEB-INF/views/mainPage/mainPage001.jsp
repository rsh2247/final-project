<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link href="<c:url value="/resources/fonts/font-awesome.min.css" />" rel="stylesheet"> -->
<!--<link href="<c:url value="/resources/css/xeicon.min.css" />" rel="stylesheet">-->
<!--  <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">-->
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
<script src="https://kit.fontawesome.com/1299206db1.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var images = [ "woman-working-office.jpg," ];
		$('#startbtn').click(function() {
			$("#wholebox").fadeOut(1000);
			$("#contentbox").css('display', 'flex');
			$("#contentbox").fadeIn("slow");
		})

		$('.dropdown-toggle').click(function() {
			if ($(this).nextAll().attr('class') == 'dropdown') {
				$(this).nextAll().removeClass('dropdown');
				$(this).nextAll().addClass('dropdown_open');
			} else {
				$(this).nextAll().removeClass('dropdown_open');
				$(this).nextAll().addClass('dropdown');
			}
		})

		$('#startbtn').click(function() {

		})
				
	})
		function pageMove(action) {
			var form = document.createElement("form");
			form.setAttribute("method","post");
			form.setAttribute("action","${contextPath}/"+action);
			document.body.appendChild(form);	
			form.submit();
		}
</script>
</head>
<style>
:root { -
	-blue: #3E60DB; -
	-darkgrey: #555; -
	-font: 'Open Sans', 'Apple SD Gothic Neo', 'Noto Sans CJK KR',
		'Noto Sans KR', '나눔바른고딕', '나눔고딕', '맑은고딕', 'Helvetica Neue',
		'Helvetica', 'Arial', sans-serif;
}
#wholebox {
	overflow: hidden;
	width: 100%;
	background: linear-gradient(to bottom, rgb(77 76 107/ 19%) 0%, #1d1d25cc
		100%), url(${contextPath}/resources/image/woman-working-office.jpg);
	height: 875px;
	background: linear-gradient(to bottom, rgb(77 76 107/ 19%) 0%, #1d1d25cc
		100%), url(${contextPath}/resources/image/woman-working-office.jpg);
	position: absolute;
}
</style>

<body>
	<c:set var="title" value="Practice Everyday" />
	<div class="wholebox" id="wholebox">
		<div id="titlebox">
			<p id="title">${title}</p>
			<hr
				style="margin: 20px auto 20px auto; width: 70px; height: 4px; border: 0px solid; background-color: #ccc;">
			<p id="titledesc">문제를 만들고 문제를 풀 수 있는 사이트입니다.</p>
		</div>
		<div>
			<!-- - <input type="text" id="search" name="search">-->
			<button id="startbtn">시작</button>
		</div>
		
			
	</div>
	<div id="contentbox">
		<div id="contentinnerbox">
		
		<div class="row" style="height:10px;background-color:#eee"></div>
		<section class="whiteSection">
			<div class="row">
				<div class="col-md-6 col-sm-6 col-xs-12">
					<div class="col-xs-10 text-left">
						<span style="font-weight:bold;"><i class="xi-announce"></i>문제풀기</span>
					</div>
					<div class="text-right col-xs-2">
					<a href=""><i class="fas fa-plus"></i></a>&nbsp;
					</div>
					<div class="clearfix"></div>
					 <table class="table">
						<tbody>
						<tr>
						  <td class="text-center" style="width:10%">
						    <a tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-content="어학시험" data-original-title="" title="">
						      <i class="far fa-file-alt" aria-hidden="true"></i>
						    </a></td>
						  <td class="main_board_text" style="width:90%">
							<a href="javascript:pageMove('problem_solve/c001_003.pro?category=TOEIC')">공인 어학시험 TOEIC</a> </td>
							<!-- <a href="${contextPath}">공인 어학시험 TOEIC</a> </td> -->
							<!-- <a href="https://quz.co.kr/?pid=2&amp;bid=1&amp;subid=v&amp;n=11163&amp;nt=1">2020년 추석연휴에 따른 교재배송 안내</a> </td> -->
						</tr>
						<tr>
						  <td class="text-center" style="width:10%">
						    <a tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-content="어학시험" data-original-title="" title="">
						      <i class="far fa-file-alt" aria-hidden="true"></i>
						    </a></td>
						  <td class="main_board_text" style="width:90%">
						  	<a href="javascript:pageMove('problem_solve/c001_003.pro?category=TOEFL')">공인 어학시험 TOEFL</a> </td>
						</tr>
						<tr>
						  <td class="text-center" style="width:10%">
						    <a tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-content="어학시험" data-original-title="" title="">
						      <i class="far fa-file-alt" aria-hidden="true"></i>
						    </a></td>
						  <td class="main_board_text" style="width:90%">
						  	<a href="javascript:pageMove('problem_solve/c001_003.pro?category=TEPS')">공인 어학시험 TEPS</a> </td>
						</tr>
						<tr>
						  <td class="text-center" style="width:10%">
						    <a tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-content="어학시험" data-original-title="" title="">
						      <i class="far fa-file-alt" aria-hidden="true"></i>
						    </a></td>
						  <td class="main_board_text" style="width:90%">
							<a href="javascript:pageMove('problem_solve/c001_003.pro?category=HSK')">공인 어학시험 HSK</a> </td>
						</tr>
						<tr>
						  <td class="text-center" style="width:10%">
						    <a tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-content="어학시험" data-original-title="" title="">
						      <i class="far fa-file-alt" aria-hidden="true"></i>
						    </a></td>
						  <td class="main_board_text" style="width:90%">
						  	<a href="javascript:pageMove('problem_solve/c001_003.pro?category=JLPT')">공인 어학 시험 JLPT</a> </td>
						</tr>
						</tbody>
					</table>
				<hr>			
				</div>
					<div class="col-md-6 col-sm-6 col-xs-12">
					<div class="col-xs-10 text-left">
						<span style="font-weight:bold;"><i class="far fa-calendar"></i>강의</span>
					</div>
					<div class="text-right col-xs-2">
					<a href=""><i class="fas fa-plus"></i></a>&nbsp;
					</div>
					<div class="clearfix"></div>
					 <table class="table">
						<tbody>
						<tr>
						  <td class="text-center" style="width:10%">
						    <a tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-content="일반분야." data-original-title="" title="">
						      <i class="far fa-calendar" aria-hidden="true"></i>
						    </a></td>
						  <td class="main_board_text" style="width:90%">
							<a href="">2020년 추석연휴에 따른 교재배송 안내</a></td>
						</tr>
						<tr>
						  <td class="text-center" style="width:10%">
						    <a tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-content="일반분야." data-original-title="" title="">
						      <i class="far fa-calendar" aria-hidden="true"></i>
						    </a></td>
						  <td class="main_board_text" style="width:90%">
							<a href="">9월 카드사 무이자 할부 이벤트 안내</a></td>
						</tr>
						<tr>
						  <td class="text-center" style="width:10%">
						    <a tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-content="일반분야." data-original-title="" title="">
						      <i class="far fa-calendar" aria-hidden="true"></i>
						    </a></td>
						  <td class="main_board_text" style="width:90%">
							<a href="">2020년 국가기술자격시험 3회, 4회 시행계획 변경 및 수시 5회…</a></td>
						</tr>
						<tr>
						  <td class="text-center" style="width:10%">
						    <a tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-content="일반분야." data-original-title="" title="">
						     <i class="far fa-calendar" aria-hidden="true"></i>
						    </a></td>
						  <td class="main_board_text" style="width:90%">
							<a href="">택배없는날  관련 배송안내</a></td>
						</tr>
						<tr>
						  <td class="text-center" style="width:10%">
						    <a tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-content="결제관련" data-original-title="" title="">
						      <i class="fa fa-krw" aria-hidden="true"></i>
						    </a></td>
						  <td class="main_board_text" style="width:90%">
							<a href="">8월 카드사 무이자 할부 이벤트 안내</a></td>
						</tr>
						</tbody>
					</table>
				<hr>			
				</div>
				
				<!-- 3 -->
				<div class="col-md-6 col-sm-6 col-xs-12">
					<div class="col-xs-10 text-left">
						<span style="font-weight:bold;"><i class="xi-announce"></i>그룹랭킹!</span>
					</div>
					<div class="text-right col-xs-2">
					<a href="${contextPath}/group/groupmain"><i class="fas fa-plus"></i></a>&nbsp;
					</div>
					<div class="clearfix"></div>
					 <table class="table">
						<tbody>
					
					<c:forEach items="${groupList}" var="list" begin="0" end="4" varStatus="status">
						<tr style="border-bottom: 1px solid #ccc; height: 30px;">
							<td class="text-center" style="width:10%">
						    <a tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-content="일반분야." data-original-title="" title="">
						      <i class="far fa-file-alt" aria-hidden="true"></i>
						    </a></td>
						  <td class="main_board_text" style="width:90%">
							<a href="${contextPath}/cafe/${list.group_num}">${list.GROUP_NAME} 그룹 ${status.count} 위 입니다.</a> </td>
						</tr>
					</c:forEach>

						</tbody>
					</table>
				<hr>			
				</div> <!-- 그룹랭킹 끝 -->
				
				<!-- 4 -->
				<div class="col-md-6 col-sm-6 col-xs-12">
					<div class="col-xs-10 text-left">
						<span style="font-weight:bold;"><i class="xi-announce"></i>유저랭킹!</span>
					</div>
					<div class="text-right col-xs-2">
					<a href=""><i class="fas fa-plus"></i></a>&nbsp;
					</div>
					<div class="clearfix"></div>
					 <table class="table">
						<tbody>
						<tr>
						  <td class="text-center" style="width:10%">
						    <a tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-content="일반분야." data-original-title="" title="">
						      <i class="far fa-file-alt" aria-hidden="true"></i>
						    </a></td>
						  <td class="main_board_text" style="width:90%">
							<a href="">2020년 추석연휴에 따른 교재배송 안내</a> </td>
						</tr>
						<tr>
						  <td class="text-center" style="width:10%">
						    <a tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-content="일반분야." data-original-title="" title="">
						      <i class="far fa-file-alt" aria-hidden="true"></i>
						    </a></td>
						  <td class="main_board_text" style="width:90%">
							<a href="">9월 카드사 무이자 할부 이벤트 안내</a> </td>
						</tr>
						<tr>
						  <td class="text-center" style="width:10%">
						    <a tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-content="일반분야." data-original-title="" title="">
						      <i class="far fa-file-alt" aria-hidden="true"></i>
						    </a></td>
						  <td class="main_board_text" style="width:90%">
							<a href="">2020년 국가기술자격시험 3회, 4회 시행계획 변경 및 수시 5회…</a> </td>
						</tr>
						<tr>
						  <td class="text-center" style="width:10%">
						    <a tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-content="일반분야." data-original-title="" title="">
						      <i class="far fa-file-alt" aria-hidden="true"></i>
						    </a></td>
						  <td class="main_board_text" style="width:90%">
							<a href="">택배없는날  관련 배송안내</a> </td>
						</tr>
						<tr>
						  <td class="text-center" style="width:10%">
						    <a tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-content="결제관련" data-original-title="" title="">
						      <i class="fa fa-krw" aria-hidden="true"></i>
						    </a></td>
						  <td class="main_board_text" style="width:90%">
							<a href="">8월 카드사 무이자 할부 이벤트 안내</a> </td>
						</tr>
						</tbody>
					</table>
				<hr>			
				</div> <!-- 강의 끝 -->
			</div>
		
		</section>
		<div class="row" style="height:10px;background-color:#eee"></div>
		
		</div>
	</div>
	<!--  
	<div id="slide">
		<input type="radio" name="pos" id="pos1" checked> <input type="radio" name="pos" id="pos2"> <input type="radio" name="pos" id="pos3"> <input type="radio" name="pos" id="pos4">
		w<ul>
			<li><img class="img" alt="" src="${contextPath}/resources/image/55EF69943A51DD001B.jpg"></li>
			<li><img class="img" style="top: -50px" alt="" src="${contextPath}/resources/image/1920_1080_20150212120938978419.jpg"></li>
			<li></li>
			<li></li>
		</ul>
		<p class="pos">
			<label for="pos1"></label> <label for="pos2"></label> <label for="pos3"></label> <label for="pos4"></label>
		</p>
	</div>
	-->
</body>
</html>