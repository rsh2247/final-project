<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="padding-left" value="10" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#contentbox {
	width: 1000px;
	margin: 50px auto 0 auto;
	text-align: left;
}

#contentlist {
	list-style: none;
}

#nameinput {
	height: 30px;
	width: 780px;
	border: 1px solid #ccc;
	padding: 0 0 2px 10px;
	font-size: 18px;
}

#select {
	width: 200px;
	height: 34px;
	border: 1px solid #ccc;
	float: right;
}

#example {
	list-style: none;
}

#example li {
	float: left;
}

#answer {
	list-style: none;
}

#answer input {
	width: 200px;
	height: 20px;
}

.pro_table {
	border-collapse: collapse;
	width: 100%;
}

.pro_table td {
	border: 1px solid #aaa;
}

#comment {
	width: 600px;
	height: 30px;
	border: 1px solid #ccc;
	padding-left: 10px;
}

#submitinput {
	width: 100px;
	height: 40px;
	float: right;
	padding-bottom: 2px;
	border: 2px solid #3E60DB;
	color: #3E60DB;
	font-size: 18px;
	background-color: #fff;
	float: right;
	cursor: pointer;
}

#submitinput:hover {
	background-color: #3E60DB;
	color: #fff;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous">
    
</script>
<script type="text/javascript" src="${contextPath}/resources/ckeditor/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
    $(document)
	    .ready(
		    function() {
			var tagId;
			var choiceNum;
			$('#select').on('change', function() {
			    temp = document.getElementById('select').value;
			    choiceNum = temp.split('/')[2];
			    choiceNum *= 1;
			    makeExample();
			})

			function makeExample() {
			    $('#example').empty();
			    $('#answer').empty();
			    for (var i = 0; i < choiceNum; i++) {
				var option = $('<li id="' + 'choice' + (i + 1)
					+ '"><input type="text" name = "choice'
					+ (i + 1) + '"> </li>')
				$('#example').append(option);
			    }
			    if (choiceNum > 1) {
				var answer = $('<li colspan="5"><select id=selectNum name="answer"></select></li>');
				$('#answer').append(answer);
				for (var i = 0; i < choiceNum; i++) {
				    var choices = $('<option value="' + (i + 1)
					    + '">' + (i + 1) + '</option>');
				    $('#selectNum').append(choices);
				}
			    } else {
				var answer = $('<li>정답 : <input type="text" name="answer"></li>');
				$('#answer').append(answer);
			    }
			}

		    })
</script>
</head>
<body>
	<div id="contentbox">
		<form action="makePro002.pro" method="post">
			<ul id="contentlist">
				<li style="height: 40px; font-size: 24px; padding-left: 12px; border-bottom: 1px solid #ccc">${categoryName}</li>
				<li style="padding-left: 0px; margin: 10px 0 10px 0;"><input id="nameinput" type="text" name="name" placeholder="문제제목을 입력해주세요."> <select id="select" name="tag">
						<c:forEach var="list" items="${list}">
							<option value="${list.TAG_ID}/${list.TAG_NAME}/${list.TAG_ISCHOICE}">${list.TAG_NAME}</option>
						</c:forEach>
				</select></li>
				<li style="margin: 10px 0 10px 0;"></li>
				<li><textarea id="editor" name="content"></textarea></li>
				<li><ul id="example"></ul></li>
				<li><ul id="answer"></ul></li>
				<li style="margin: 10px 0 10px 0;"><input type="text" name="comment" id="comment" placeholder="해설을 입력해주세요."></li>
				<li><input type="hidden" value="${categoryId}" name="categoryId"> <input type="hidden" value="${categoryName}" name="categoryName"> <input id="submitinput" type="submit" value="확인"></li>
			</ul>
		</form>
	</div>
	<script>
	CKEDITOR.replace('editor');
    </script>
</body>
</html>