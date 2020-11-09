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
	$('#enroll').click(function() {
	    var map = JSON.stringify({
		'post_content' : $('#replyinput').val(),
		'post_parent' : '${post.POST_NUM}',
		'board_num' : '${post.BOARD_NUM}'
	    });
	    $.ajax({
		type : "post",
		url : "replyInsert.user",
		data : "input=" + map,
		success : function(data, textStatus) {
			$('#reply_ul').remove();
			$('#re_list').append('<ul id="reply_ul"></ul>')
		    for(var i in data){
				var reply = '<li><div>'+
				'<div class="reply_id">'+data[i].USER_ID+'</div>'+
				'<div class="reply_content">'+data[i].POST_CONTENT+'</div>'+
				'<div class="reply_date">'+data[i].POST_DATE+'</div>'+
				'</div></li><li class="re_bottom"></li>'
				$('#reply_ul').append(reply);
		    }
			$('#replyinput').val('');
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

#replymodule {
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
.reply_id{
	width: inherit;
	margin: 5px 0 15px 0;
}

.reply_date{
	width: inherit;
	margin: 15px 0 5px 0;
	font-size: small;
	color: #aaa
}
#enroll {
	width: 60px;
	line-height: 30px;
	float: right;
	border: 2px solid #3E60DB;
	border-radius: 6px;
	color:#3E60DB;
	background-color: #fff;
	cursor: pointer;
	transition: all ease 250ms;
}

#enroll:hover {
	background-color: #3E60DB;
	color:#fff;
}

</style>
</head>
<body>
	<div id="replybox">
		<div id="re_list">
			<ul id="reply_ul">
				<c:forEach var="list" items="${reply}">
					<li>
						<div>
							<div class="reply_id">${list.USER_ID}</div>
							<div class="reply_content">${list.POST_CONTENT}</div>
							<div class="reply_date">${list.POST_DATE}</div>
						</div>
					</li>
					<li class="re_bottom"></li>
				</c:forEach>
			</ul>
		</div>
		<div id="replymodule">
			<textarea id="replyinput"></textarea>
			<button id="enroll">등록</button>
		</div>
	</div>
</body>
</html>
