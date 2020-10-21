<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#articlebox {
	width: 100%;
	border: 1px solid #eee;
	border-radius: 5px;
	border: 1px solid #eee;
}

#innerbox {
	width: 800px;
	padding: 20px 25px 20px 25px;
	text-align: left;
}

#namebox {
	border-bottom: 1px solid #eee;
	font-size: xx-large;
	padding: 5px 0 5px 10px;
}
#maincontent{
	padding: 15px 0 5px 10px;
}
</style>
</head>
<body>
	<div id="contentbox"><jsp:include page="groupPage_sidebar.jsp" flush="false"></jsp:include>
		<div id="mainbox">
			<div id="articlebox">
				<div id="innerbox">
					<div id="namebox">${post.POST_TITLE}</div>
					<div id="maincontent">${post.POST_CONTENT}</div>
					<div id="replybox"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>