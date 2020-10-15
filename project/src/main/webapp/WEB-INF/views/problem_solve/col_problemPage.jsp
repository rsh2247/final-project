<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#proTable {
	margin: 100px auto 0 auto;
	border-collapse: collapse;
	width: 900px;
}

#proTable tr td {
	text-align: left;
	border: 0px solid #000;
}

.proTD {
	padding: 12px 5px 12px 5px
}

.exTD {
	padding: 2px 5px 2px 25px;
}

#panel {
	min-height: 1000px;
	min-width: 200px;
	float: right;
	background-color: #ccc;
}

#panel ul {
	list-style: none;
	padding-top: 50px;
	height: 800px;
}

#panel ul li {
	padding: 2px 0 1px 0;
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
	<div id="panel">
		<form action="check_colAnswer.pro" method="post" id="answerlist">
			<ul>
				<c:forEach var="list" items="${list}">
					<li>${list.COL_LIST_NUM}<c:forEach var="ordList" items="${list.ordList}">
							<input type="radio" value="${ordList.cho_num}" name="answer${list.PRO_NUM}" class="panelRadio">
						</c:forEach>
					</li>
				</c:forEach>
			</ul>
			<input type="hidden" value="${list[0].COL_NUM}" name="col_num">
			<input type="hidden" value="${fn:length(list)}" name="max_num"> 
		</form>
		<button onclick="check()">답안 제출하기</button>
	</div>
	<table id="proTable">
		<c:forEach var="list" items="${list}">
			<tr>
				<td class="proTD" style="text-align: right; width: 30px">${list.COL_LIST_NUM}.</td>
				<td>${list.PRO_CONTENT}</td>
			</tr>
			<c:forEach var="ordList" items="${list.ordList}">
				<tr>
					<td colspan="2" class="exTD">(${ordList.cho_num}) ${ordList.cho_content}</td>
				</tr>
			</c:forEach>
		</c:forEach>
	</table>
</body>
</html>