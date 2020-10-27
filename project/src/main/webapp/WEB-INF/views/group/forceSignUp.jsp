<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#innerbox {
	width: inherit;
	padding: 45px 30px 45px 45px;
	border: 1px solid #ddd;
	border-radius: 5px;
	text-align: left;
}

#desc1 {
	font-size: x-large;
	margin-bottom: 10px;
}

#desc2 {
	font-size: large;
	margin-bottom: 10px;
}

#desc3{
	color: #888;
}

#titletext {
	color: #3E60DB;
	display: inline-block;
}
#signUpbtn{
	width: 150px;
	height: 40px;
	margin: 20px 5px 0 5px;;
	font-size: large;
	font-weight:bold;
	border: 0px;
	border-radius: 5px;
	background: #d9e5fb;
	color: #3E60DB;
	cursor: pointer;
}
</style>
</head>
<body>
	<div id="contentbox">
		<jsp:include page="groupPage_sidebar.jsp" flush="false" />
		<div id="mainbox">
			<div id="innerbox">
				<div id="desc1">카페 회원가입이 필요합니다.</div>
				<div id="desc2">
					<p id="titletext">${result.GROUP_NAME}</p>
					그룹에 가입해보세요
				</div>
				<div id="desc3">${result.GROUP_DESC}</div>
				<form action="" method="post">
					<button id="signUpbtn">카페 가입하기</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>