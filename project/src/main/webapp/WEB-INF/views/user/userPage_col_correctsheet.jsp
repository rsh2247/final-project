<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous">

</script>
<script type="text/javascript">
	function com(name,num) {
		var comment = $("#"+name+num);
		if(comment.css('display') == 'none'){
			comment.css('display','inline');
		}else{
			comment.css('display','none');
		}
	}
</script>
<title>Insert title here</title>
<script type="text/javascript">

</script>
<style type="text/css">
#contentbox {
	margin: 50px auto 0 auto;
	width: 1200px;
}

#index {
	width: 250px;
	border-collapse: collapse;
	font-family: 'Open Sans', 'Apple SD Gothic Neo', 'Noto Sans CJK KR', 'Noto Sans KR', '나눔바른고딕', '나눔고딕', '맑은고딕', 'Helvetica Neue', 'Helvetica',
		'Arial', sans-serif;
	float: left;
}

#index td {
	border: 1px solid #d4d4d4;
	padding: 0.7em 0 0.7em 1em;
	font-size: 16px;
	text-align: left;
}

#index a {
	text-decoration: none;
	color: #2c2c2c;
	display: block;
}

#mainbox {
	width: 800px;
	background-color: #fff;
	margin-left: 50px;
	float: left;
}

#maintitle {
	width: 100%;
	height: 40px;
	border-bottom: 1px solid #d4d4d4;
	text-align: left;
	padding-left: 10px;
	margin-bottom: 25px;
	font-size: 21px;
	color: #333;
}

ul {
	list-style: none;
}

.label {
	padding-left: 0.5em;
}

.label:first-child {
	display: inline-block;
}
.pro_content {
	margin-bottom: 20px;
	display: flex;
	word-break: break-all;
}
</style>
</head>
<body>
	<div id="contentbox">
		<jsp:include page="indexTable.jsp"></jsp:include>
		<c:set var="n" value="0"></c:set>
		<div id="mainbox">
			<div id="maintitle">문제집오답</div>
			<div id="maincontent">
				<ul style="text-align: left; margin-left: 10px;">
					<c:forEach var="list" items="${proList}">
						<li style="margin: 15px 0 15px 0;"><div style="float: left; padding-right: 10px;">${list.COL_LIST_NUM}.</div> <div class="pro_content">${list.PRO_CONTENT}</div></li>
						<c:forEach var="cho_list" items="${list.ordList}">
							<li style="padding-bottom: 2px"><label style="padding: 0.7em 0.5em 0.7em 1em">${cho_list.cho_num}</label>${cho_list.cho_content}</li>
						</c:forEach>
						<li style="padding-top: 10px;">입력한 답 : ${answerList[n].COL_WRONGCONTENT}</li>
						<li style="margin: 5px 0 0 0;">정답 : [<p id="answer${n}" style="display: none;">${list.PRO_ANSWER}</p>]
							<button class="btn" onclick="com('answer',${n})">정답확인</button>
							<button class="btn" onclick="com('comment',${n})">해설보기</button>
						</li>
						<li style="border-bottom: 1px solid #ccc; padding: 15px 0 15px 0">
							<p id="comment${n}" style="display: none;">${list.PRO_COMMENT}</p>
						</li>
						<c:set var="n" value="${n+1}"></c:set>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>