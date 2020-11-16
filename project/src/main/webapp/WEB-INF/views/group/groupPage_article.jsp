<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#articlebox {
	width: 100%;
	border: 1px solid #ddd;
	border-radius: 8px;
	border: 1px solid #eee;
	margin-bottom: 50px;
}

#innerbox {
	width: inherit;
	padding: 20px 25px 20px 25px;
	text-align: left;
}

#namebox {
	border-bottom: 1px solid #eee;
	padding: 5px 0 5px 10px;
}
#titlebox{
	font-size: xx-large;
	margin-bottom: 10px;
}
#maincontent {
	padding: 15px 0 5px 10px;
	min-height: 300px;
}
#postimage{
	width: 60px;
	height: 60px;
	border: 1px solid #eee;
	border-radius: 50px;
}
#replybox {
	margin: 30px 0 0 0;
}
.re_bottom{
	margin: 15px 0 10px;
	border-bottom: 1px solid #eee;	
}
</style>
</head>
<body>
	<div id="contentbox"><jsp:include page="groupPage_sidebar.jsp" flush="false"></jsp:include>
		<div id="mainbox">
			<div id="articlebox">
				<div id="innerbox">
					<div id="namebox">
					<div id="titlebox">${post.POST_TITLE}</div>
					<div style="display: inline-block;"> <img id="postimage" src="${contextPath}/resources/image/${post.USER_IMAGE}"> </div>
					<div style="display: inline-block; position: relative; vertical-align: top;top:8px; left: 3px;">${post.USER_ID} </div>
					<div style="display: inline-block; position: relative; right: 30px; bottom: 15px;color:#aaa; font-size: 14px">${post.POST_DATE}</div>
					</div>
					<div id="maincontent">${post.POST_CONTENT}</div>
					<div style="border-bottom: 1px solid #eee; margin: 10px 0 10px;"></div>
					<div id="replybox">
						<jsp:include page="../article/reply.jsp" /></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>