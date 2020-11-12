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
<script type="text/javascript">
    $(document).ready(function() {
	$('#starRev span').click(function() {
	    $(this).parent().children('span').removeClass('on');
	    $(this).addClass('on').prevAll('span').addClass('on');
	    var num = $('.on').length;
	    $('#score').val(num);
	    return false;
	});
    })
</script>
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
	border-bottom: 1px solid #ddd;
	padding-bottom: 20px; margin-bottom: 30px;
}

#title {
	font-size: xx-large;
	border-bottom: 1px solid #ddd;
	margin-bottom: 20px;
	padding-bottom: 20px;
}

#proname {
	display: inline-block;
	font-size: x-large;
	width: 50%;
}

#confirmbtn {
	width: 90px;
	line-height: 35px;
	background-color: #fff;
	margin-top: 20px;
	border: 1px solid #ccc;
	cursor: pointer;
	float: right;
}

.starR1 {
	background: url('${contextPath}/resources/image/star.png') no-repeat -69px 0;
	background-size: auto 100%;
	width: 20px;
	height: 40px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR2 {
	background: url('${contextPath}/resources/image/star.png') no-repeat right 0;
	background-size: auto 100%;
	width: 20px;
	height: 40px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR1.on {
	background-position: 0 0;
}

.starR2.on {
	background-position: -20px 0;
}

#starRev {
	min-width: 100px;
	display: inline-block;
	float: right;
	    position: relative;
    top: -20px;
}
</style>
</head>
<body>
	<div id="contentbox">
		<form action="evalConfirm.pro" method="post">
			<div style="width: 800px; margin: 0 auto 0 auto;">
				<div id="titlebox">
					<div id="title">문제평가</div>
					<div id="titledesc">${result.category_name} | ${result.tag_name}</div>
					<div id="proname">${result.pro_name}</div>
					<div id="starRev">
						<span class="starR1 on">별1_왼쪽</span> <span class="starR2">별1_오른쪽</span> <span class="starR1">별2_왼쪽</span> <span class="starR2">별2_오른쪽</span> <span class="starR1">별3_왼쪽</span> <span class="starR2">별3_오른쪽</span> <span class="starR1">별4_왼쪽</span> <span class="starR2">별4_오른쪽</span> <span
							class="starR1"
						>별5_왼쪽</span> <span class="starR2">별5_오른쪽</span>
					</div>
				</div>
				<div id="textbox">
					<textarea id="editor" name="col_eval_content"></textarea>
				</div>
				<input type="hidden" name="pro_eval_score" id="score" value="1">
				<input type="hidden" name="pro_num" value="${result.pro_num}">
				<input type="hidden" name="category" value="${result.category_name}">
				<input type="hidden" name="category_id" value="${result.category_id}">
				<input type="hidden" name="user_id" value="${result.user_id}">
				<button id="confirmbtn">확인</button>
			</div>
		</form>
	</div>
	<script type="text/javascript">
	CKEDITOR.replace('editor');
    </script>
</body>
</html>