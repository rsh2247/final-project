<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.example {
	list-style: none;
}

.example li {
	display: block;
	padding: 5px 0 5px 0 ;
}
#contentbox{
	width: 1100px;
}
#proTable {
	margin: 50px auto 30px auto;
	border-collapse: collapse;
	width: 1000px;
	text-align: left;
}

#proTable tr td {
	padding-bottom: 10px;
	padding-top: 10px;
}

.pro_td {
	border-bottom: 1px solid #ccc;
	font-size: 24px;
	text-align: left;
	padding-left: 5px;
}

#answerBox {
	border-radius: 0px;
	border: 0px solid;
	border-bottom: 1px solid #2a52be;
}

#submitBox {
	width: 100px;
	line-height: 35px;
	border: 1px solid #3E60DB;
	margin-top: 20px;
	color: #fff;
	font-size: 16px;
	background-color: #3E60DB;
	cursor: pointer;
	transition: all ease 300ms 0s;
}

#submitBox:hover {
	background-color: #2a4296;
	border: 1px solid #2a4296;
}

#submitBox:active{
	margin: 22px 2px 2px 2px;
	width: 95px;
	line-height: 32px;
	transition: all ease 100ms 0s;
}

#tagbox {
	color: #555;
	margin: 15px 0 15px 0;
}

#toptitle {
	font-size: xx-large;
	margin-left: 20px;
}
.radiobtn{
	display: none;
}
.radiobtn:checked + span .check{
	display: inline-block;
}
.radiobtn:checked + .textbtn{
	position: relative;
	left: -17px;
}
.numbtn{
	width: 20px;
	line-height: 18px;
	border: 1px solid #555;
	border-radius: 20px;
	color: #555;
	text-align: center;
	font-size: 15px;
	font-weight: bold;
	display: inline-block;
	margin-right: 5px;
}

.check{
	width: 17px;
	height: 17px;
	display: none;
	position: relative;
    left: 20px;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
    $('#submitBox').click(function () {
		var num = $('input[name=answer]');
		var pass = false;
		for(var i in num){
		    if(num[i].checked == true){
				pass = true;
		    }
		}
		if(pass){
		    document.getElementById('submit').submit();
		}else{
		    alert('정답을 입력해주세요.');
		}
    })
})
</script>
</head>
<body>
	<div id="contentbox">
		<table id="proTable">
			<c:forEach var="problem" items="${list}">
				<tr>
					<td style="height: 40px"><div id="tagbox">${problem.CATEGORY_NAME} | ${problem.TAG_NAME}</div>
						<div id="toptitle">${problem.PRO_NAME}</div></td>
				</tr>
				<tr>
					<td class="pro_td">문제</td>
				</tr>
				<tr>
					<td style="padding: 40px 0 40px 5px; text-align: left;">${problem.PRO_CONTENT}</td>
				</tr>
				<c:if test="${problem.TAG_ISCHOICE ne 'N'}">
					<tr>
						<td class="pro_td">보기</td>
					</tr>
				</c:if>
				<c:if test="${problem.TAG_ISCHOICE eq 'N'}">
					<td class="pro_td">정답입력</td>
				</c:if>
			</c:forEach>
		</table>
		<form action="check_answer.pro" method="post" style="margin-bottom: 100px;" id="submit">
			<c:forEach var="problem" items="${list}">
				<c:if test="${problem.TAG_ISCHOICE ne 'N'}">
					<div style="text-align: left; width: 1000px; margin-left: 60px;">
						<ul class="example">
							<c:forEach var="example" items="${list2}">
								<li><label style="cursor: pointer;"><input type="radio" class="radiobtn" value="${example.CHO_NUM}" name="answer">
								<span class="textbtn"><img class="check" alt="" src="${contextPath}/resources/image/check.png"><span class="numbtn">${example.CHO_NUM}</span> ${example.CHO_CONTENT}</span></label></li>
							</c:forEach>
						</ul>
					</div>
				</c:if>
				<c:if test="${problem.TAG_ISCHOICE eq 'N'}">
					<input name="answer" id="answerBox" type="text">
				</c:if>
				<input type="hidden" name="proNum" value="${problem.PRO_NUM}">
			</c:forEach>
			<input id="submitBox" type="button" value="확인">
		</form>
	</div>
</body>
</html>