<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${contextPath}/resources/ckeditor/ckeditor/ckeditor.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style type="text/css">
#cke_11 {
	display: none;
}

#cke_1_resizer {
	display: none;
}

#cke_1_contents {
	min-height: 400px;
}

#contentbox {
	width: 1100px;
	margin: 50px auto 0 auto;
}

#titlebox {
	text-align: left;
}

#title {
	display: inline-block;
	font-size: xx-large;
	width: 50%;
}

#starbox {
	display: inline-block;
	width: 49%;
}

#stars1 {
	width: 200px;
}
#stars2{
	width: 200px;
}
#titledesc {
	color: #555;
}
</style>
</head>
<body>
	<div id="contentbox">
		<div style="width: 800px; margin: 0 auto 0 auto;">
			<div id="titlebox">
				<div id="titledesc">${result.category_name}|${result.tag_name}</div>
				<div id="title">${result.pro_name}</div>
				<div id="starbox">
					<img id="stars1" alt="" src="${contextPath}/resources/image/stars.png">
				</div>
			</div>
			<div id="textbox">
				<textarea id="editor"></textarea>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	CKEDITOR.replace('editor');
    </script>
</body>
</html>