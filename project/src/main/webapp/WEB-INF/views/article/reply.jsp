<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
		$('#enroll').click(function () {
		    var map = JSON.stringify({'post_content':$('#replyinput').val(),'post_parent':'${post.POST_NUM}'});
		    $.ajax({
			type : "post",
			url : "replyInsert.user",
			data : "input="+map,
			success : function(data, textStatus) {
			    alert(data);
				var reply = '<>'
			},
			error : function(data, textSatus) {
				alert("에러가 발생");
			},
			complete : function(data, textSatus) {
			}
		});
		})
    })
</script>
<style type="text/css">
#replybox {
	width: 100%;
}
#replymodule{
	width: inherit;
	padding: 10px 10px 10px 10px;
	border: 1px solid #eee;
	border-radius: 10px;
	display: inline-block;
	
}
#replyinput {
	width: inherit;
	height: 100px;
	padding: 10px 10px 10px 10px;
	border: 0px solid #ddd;
	resize: none;
}
#enroll{
	width: 60px;
	height: 30px;
	float: right;
}

</style>
</head>
<body>
	<div id="replybox">
		<div id="re_list">
			<ul>
				<c:forEach var="list" items="${reply}">
					<li>${list.USER_ID}</li>
					<li>${list.POST_CONTENT}</li>
					<li>${list.POST_DATE}</li>
					<li class="re_bottom"></li>
				</c:forEach>
			</ul>
		</div>
		<div id="replymodule">
			<textarea id="replyinput"></textarea>
			<button id="enroll" >등록</button>
		</div>
	</div>
</body>
</html>
