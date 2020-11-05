<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.list {
	list-style: none;
	text-align: left;
}

#contentbox {
	width: 1100px;
	min-height: 1200px;
	display: flex;
}

#problem {
	margin-top: 50px;
	padding-left: 20px;
	width: 900px;
	display: inline-block;
	float: left;
}

#panel {
	width: 200px;
	background-color: #ccc;
	display: inline-block;
	float: left;
}

#panel ul {
	list-style: none;
	padding-top: 50px;
}

#panel ul li {
	padding: 2px 0 1px 0;
}

.proNum {
	margin-right: 10px;
	display: inline-block;
}

.panelRadio {
	display: none;
}
.panelRadio+label{
	background-color: #000;
}
.answerLabel {
	width: 26px;
	height: 26px;
	display: inline-block;
	background-color: #fff;
	border: 2px solid #000;
	border-radius: 25px;
	cursor: pointer;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script type="text/javascript">

	function check() {
		var maxnum = ${fn:length(list)};
		var pass = false;
		for (var j = 1; j <= maxnum; j++) {
			var bool = false;
			var chk_radio = document.getElementsByName('answer'+j);
			for (var i = 0; i < chk_radio.length; i++) {
				if (chk_radio[i].checked == true) {
					bool = true;
				}
			}
			if(!bool){
				if(!pass){
					var con = confirm("빈 칸이 있습니다. 이대로 제출하시겠습니까?");
				}
				if(con){
					pass = true;
				}else{
					return true;
				}
				var hidden = $('<input type="hidden" name="answer'+j+'" value="'+null+'">');
				$('#answerlist').append(hidden);
			}
		}
		document.getElementById('answerlist').submit();
	}
</script>
</head>
<body>
	<div id="contentbox">
		<div id="problem">
			<ul class="list">
				<c:forEach var="list" items="${list}">
					<li>
						<div style="padding: 15px 0 15px 0; border-bottom: 1px solid #ccc;">
							<div style="float: left; margin-right: 10px;">${list.COL_LIST_NUM}.</div>
							<div style="margin-bottom: 20px;">${list.PRO_CONTENT}</div>
							<div style="margin-left: 20px;">
								<ul class="list">
									<c:forEach var="ordList" items="${list.ordList}">
										<li style="padding-bottom: 3px;"><div class="proNum">(${ordList.cho_num})</div>${ordList.cho_content}</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
		<div id="panel">
			<form action="check_colAnswer.pro" method="post" id="answerlist">
				<ul>
					<c:forEach var="list" items="${list}">
						<li>${list.COL_LIST_NUM}
						<c:set var="num" value="1"/>
						<c:forEach var="ordList" items="${list.ordList}">
								<label class="answerLabel"> <input type="radio" value="${ordList.cho_num}" name="answer${list.PRO_NUM}" class="panelRadio">
								${num}
								<c:set var="num" value="${num+1}"/>
								</label>
							</c:forEach>
						</li>
					</c:forEach>
				</ul>
				<input type="hidden" value="${list[0].COL_NUM}" name="col_num"> <input type="hidden" value="${fn:length(list)}" name="max_num">
			</form>
			<button onclick="check()">답안 제출하기</button>
		</div>
	</div>
</body>
</html>