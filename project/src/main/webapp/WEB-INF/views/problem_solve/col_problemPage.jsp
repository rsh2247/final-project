<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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
}

#problembox {
	width: 1100px;
	min-height: 1050px;
	margin: 20px auto 50px auto;
	border: 1px solid #eee;
	border-radius: 20px;
	display: flex;
}

#topbar {
	height: 120px;
	margin: 50px auto 0 auto;
	border: 1px solid #eee;
	border-radius: 20px;
}

#problem {
	margin-top: 50px;
	padding: 0 25px 0 25px;
	width: 900px;
	display: inline-block;
	float: left;
}

#panel {
	width: 200px;
	display: inline-block;
	border-left: 1px solid #eee;
	float: left;
}

#panel_ul {
	list-style: none;
	padding: 50px 20px 0 20px;
}

#panel_ul li {
	padding: 2px 0 1px 0;
	margin-bottom: 5px;
}

#panel_ul li:nth-child(5n) {
	margin-bottom: 15px;
	padding-bottom: 15px;
	border-bottom: 2px solid #eee;
}

.proNum {
	margin-right: 10px;
	display: inline-block;
}

.pro_content {
	margin-bottom: 20px;
	display: flex;
	word-break: break-all;
}

.panelRadio {
	display: none;
}

.panelRadio:checked+label {
	background-color: #000;
	color: #fff;
}

.answerLabel {
	width: 22px;
	line-height: 20px;
	display: inline-block;
	background-color: #fff;
	border: 1px solid #000;
	border-radius: 25px;
	font-size: 13px;
	cursor: pointer;
}

#confirmbtn {
	width: 170px;
	line-height: 35px;
	border: 2px solid #3e60db;
	border-radius: 35px;
	margin-top: 15px;
	background-color: #3e60db;
	color: #fff;
	cursor: pointer;
	font-size: 16px;
	transition: ease 250ms;
}

#confirmbtn:hover {
	background-color: #213a92;
	border-color: #213a92;
}

#confirmbtn:active {
	background-color: #fff;
	color: #3e60db;
	border: 2px solid #3e60db;
}

#navibar {
	margin-top: 20px;
}

.arrow {
	border: 1px solid #ccc;
	border-radius: 20px;
	background-color: #fff;
	background-size: 26px;
	background-repeat: no-repeat;
	background-position: center;
	width: 60px;
	height: 40px;
	cursor: pointer;
}

.arrow:hover {
	background-color: #ccc;
}

.bignum {
	font-size: 28px;
}

#clock {
	width: 200px;
	height: 100%;
	padding-top: 24px;
	float: right;
	position: relative;
	border-left: 1px solid #eee;
}

#titlebox {
	width: 850px;
	display: inline-block;
	text-align: left;
	padding: 10px 0 0 0;
}
#title1{
	font-size: 20px;
	padding-left: 5px;
}
#title2{
	margin-top: 10px;
	font-size: 26px;
}
#clockbox {
	margin-bottom: 10px;
}

.clockbtn {
	width: 75px;
	line-height: 28px;
	border: 2px solid #3e60db;
	border-radius: 15px;
	color: #3e60db;
	background-color: #fff;
	cursor: pointer;
	transition: all ease 300ms;
}
.clockbtn:disabled {
	background-color: #3e60db2e;
    border: 2px solid #0635dc00;
    color: #ffffff;
}
.clockbtn:disabled:hover {
	background-color: #3e60db2e;
    border: 2px solid #0635dc00;
    color: #ffffff;
    cursor: default;
}
.clockbtn:hover {
	background-color: #3e60db;
	color: #fff;
}
.clockbtn:active {
	color: #3e60db;
	background-color: #fff;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
    var stTime = 0;
	var endTime = 0;
	var timerStart
	var hour
	var min
	var sec
	var milisec
	var startBtn = document.getElementById('testStartBtn');
	var stopBtn = document.getElementById('testStopBtn');
	var mile = Date.now()
	startBtn.addEventListener('click', function() {
		if(!stTime) {
			stTime = Date.now()+1000*60*60*9 // 처음 시작할 때
		} else {
			stTime += (Date.now() - endTime) // 재시작할 때
		}
		timerStart = setInterval(function() {
		var nowTime = new Date(Date.now() - stTime)
		hour = addZero(nowTime.getHours())
		min = addZero(nowTime.getMinutes())
		sec = addZero(nowTime.getSeconds())
		milisec = addZero(Math.floor(nowTime.getMilliseconds() / 10))
		document.getElementById('postTestHour').innerText = hour
		document.getElementById('postTestMin').innerText = min
		document.getElementById('postTestSec').innerText = sec
		document.getElementById('postTestMilisec').innerText = milisec
		}, 1)
		$('#testStartBtn').attr('disabled','');
	})
	
	stopBtn.addEventListener('click', function() {
		if(timerStart) {
			clearInterval(timerStart)
			endTime = Date.now() // STOP시점의 시간 저장
		}
		$('#testStartBtn').removeAttr('disabled');
	})
	function hourCal(num) {
	    return num-9
	}
	function addZero(num) {
		return (num < 10 ? '0'+num : ''+num)
	}
	
})

	function arrow(num) {
	var col_num = $('#col_num').val();
	var nowNum = $('#nextNum').val()*1+num*1;
    var input = {'col_num':col_num, 'pageNum':nowNum};
    $.ajax({
	type : "post",
	url : "col_problemRefresh",
	data : input,
	success : function(data, textStatus) {
	    var html = jQuery('<div>').html(data);
	    var content = html.find('#ajax').html();
	    console.log(content);
	    $('#problem').html(content);
	},
	error : function(data, textSatus) {
	    alert("에러가 발생");
	},
	complete : function(data, textSatus) {
	}
    });
    }
	function check() {
		var maxnum = ${fn:length(list)};
		var pass = false;
		for (var j = 1; j <= maxnum; j++) {
			var bool = false;
			var chk_radio = document.getElementsByName('answer'+j);
				console.log(chk_radio.length);
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
		<div id="topbar">
			<div id="titlebox">
				<div id="title1">${result.CATEGORY_NAME}</div>
				<div id="title2">${result.COL_NAME}</div>
			</div>
			<div id="clock">
				<div id="clockbox">
					<span id="postTestHour" class="bignum">00</span> : <span
						id="postTestMin" class="bignum">00</span>
					<!-- 분 -->
					<span>:</span> <span id="postTestSec" class="bignum">00</span>
					<!--초-->
					<span>.</span> <span id="postTestMilisec">00</span>
					<!--밀리초-->
				</div>
				<div id="clockbtnbox">
					<button class="clockbtn" type="button" id="testStartBtn">START</button>
					<!--시작/재시작/기록 버튼-->
					<button class="clockbtn" type="button" id="testStopBtn">STOP</button>
					<!--스톱 버튼-->
				</div>
			</div>
		</div>
		<div id="problembox">
			<div id="problem">
				<ul class="list">
					<c:forEach var="list" items="${list}">
						<c:if
							test="${list.COL_LIST_NUM >= page.startNum &&  list.COL_LIST_NUM <= page.endNum}">
							<li>
								<div
									style="padding: 15px 0 15px 0; border-bottom: 1px solid #ccc;">
									<div style="float: left; margin-right: 10px;">${list.COL_LIST_NUM}.</div>
									<div class="pro_content">${list.PRO_CONTENT}</div>
									<div style="margin-left: 20px;">
										<ul class="list">
											<c:forEach var="ordList" items="${list.ordList}">
												<li style="padding-bottom: 3px;"><label
													style="cursor: pointer;"
													for="${list.COL_LIST_NUM}-${ordList.cho_num}"><div class="proNum">(${ordList.cho_num})</div>${ordList.cho_content}</label></li>
											</c:forEach>
										</ul>
									</div>
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
				<input type="hidden" id="col_num" name="col_num"
					value="${result.COL_NUM}"> <input type="hidden"
					id="nextNum" value="${page.nowPage}"> <input type="hidden"
					id="prevNum" value="${page.nowPage-1}">
				<div id="navibar">
					<c:if test="${page.nowPage != 1}">
						<button class="arrow" onclick="arrow(-1)"
							style="background-image: url('${contextPath}/resources/image/left.png');"></button>
					</c:if>
					<c:if test="${page.nowPage != page.listNum}">
						<button class="arrow" onclick="arrow(1)"
							style="background-image: url('${contextPath}/resources/image/right.png');"></button>
					</c:if>
				</div>
			</div>
			<div id="panel">
				<form action="check_colAnswer.pro" method="post" id="answerlist">
					<ul id="panel_ul">
						<c:forEach var="list" items="${list}">
							<li>${list.COL_LIST_NUM}<c:set var="num" value="1" /> <c:forEach
									var="ordList" items="${list.ordList}">
									<input type="radio" value="${ordList.cho_num}"
										id="${list.COL_LIST_NUM}-${ordList.cho_num}"
										name="answer${list.COL_LIST_NUM}" class="panelRadio">
									<label class="answerLabel"
										for="${list.COL_LIST_NUM}-${ordList.cho_num}">${num}<c:set
											var="num" value="${num+1}" />
									</label>
								</c:forEach>
							</li>
						</c:forEach>
					</ul>
					<input type="hidden" value="${list[0].COL_NUM}" name="col_num">
					<input type="hidden" value="${fn:length(list)}" name="max_num">
				</form>
				<button onclick="check()" id="confirmbtn">답안 제출하기</button>
			</div>
		</div>
	</div>
</body>
</html>