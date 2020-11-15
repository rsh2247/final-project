<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous">
	
</script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var list;
						var category1;
						var category2;
						var category3;
						var preset = [ {
							a : 21,
							b : '기능사'
						}, {
							a : 22,
							b : '산업기사'
						}, {
							a : 23,
							b : '기사'
						} ];
						$('.category1').on('change', function() {
							category1 = $(this).val();
							var input = $(this);
							$.ajax({
								type : "post",
								url : "ajax/makeProAjax001.pro",
								data : "string=" + category1,
								success : function(data, textStatus) {
									list = data;
									changeForm(input);
								},
								error : function(data, textSatus) {
									alert("에러가 발생");
								},
								complete : function(data, textSatus) {
								}
							});

						})

						$('#cate2').on('change', function() {
							category2 = document.getElementById('cate2').value;

							$.ajax({
								type : "post",
								url : "ajax/makeProAjax001.pro",
								data : "string=" + category2,
								success : function(data, textStatus) {
									list = data;
									console.log(data);
									changeForm2();
								},
								error : function(data, textSatus) {
									alert("에러가 발생");
								},
								complete : function(data, textSatus) {
								}
							});

						})

						function changeForm(input) {
							var cate2 = input.next();
							var cate3 = input.next().next();
							cate2.empty();
							cate3.empty();

							if (category1 == 10) {
								cate2.attr('disabled', 'disabled');
								cate3.removeAttr('disabled');
								for (var i = 0; i < list.length; i++) {
									var option = $('<option value='+list[i].CATEGORY_ID+'/'+list[i].CATEGORY_NAME+'>'
											+ list[i].CATEGORY_NAME
											+ '</option>')
									cate3.append(option);
								}
							} else if (category1 == 20) {
								cate3.attr('disabled', 'disabled');
								cate2.removeAttr('disabled');
								for (var i = 0; i < preset.length; i++) {
									var option = $('<option value='+preset[i].a+'>'
											+ preset[i].b + '</option>')
									cate2.append(option);
								}
							}
						}

						function changeForm2() {
							$('#cate3').empty();
							document.getElementById('cate3').removeAttribute(
									'disabled');
							for (var i = 0; i < list.length; i++) {
								var option = $('<option value='+list[i].CATEGORY_ID+'/'+list[i].CATEGORY_NAME+'>'
										+ list[i].CATEGORY_NAME + '</option>')
								$('#cate3').append(option);
							}
						}
						$('#submitbtn').click(function () {
							$('#finishbox').css('display','none');
						})
						if('${result}'== 1){
							$('#finishbox').css('display','block');
						}

					})
	function submit() {
		$('#form').submit();
	}
	function submit2() {
		$('#form2').submit();
	}
</script>
<style type="text/css">
#maincontent {
	width: 1100px;
	min-height: 600px;
	margin: 70px auto 0 auto;
}

#mainbox {
	padding: 40px 20px 40px 20px;
	border: 1px solid #ddd;
	border-radius: 10px;
}

.maintitle {
	width: 95%;
	border-bottom: 1px solid #d4d4d4;
	text-align: left;
	padding: 0 20px 20px 20px;
	margin: 0 auto 35px auto;
	font-size: 24px;
	font-weight:bold;
	color: #333;
}

.contentitem {
	width: 95%;
	margin: 0 auto 50px auto;
}

#list {
	width: 800px;
	margin: 50px auto 0 auto
}

#list li {
	list-style: none;
	float: left;
	margin-right: 15px;
}

#checkbutton {
	width: 100px;
	height: 40px;
	cursor: pointer;
	background-color: #fff;
	color: #3E60DB;
	border: 2px solid #3E60DB;
	font-size: 18px;
	padding-bottom: 1px;
}

#checkbutton:hover {
	background-color: #3E60DB;
	color: white;
}

.dropbox {
	width: 200px;
	height: 40px;
	cursor: pointer;
	margin: 0 10px 0 10px;
	border: 2px solid #3E60DB;
}

.dropbox option {
	height: 30px;
}

.dropbox:disabled {
	cursor: default;
}

#top {
	width: 1100px;
	height: 100px;
	margin: 0 auto 50px auto;
	text-align: left;
	border-bottom: 3px solid #eee;
}

.bigtitlebox {
	width: 180px;
	height: 100px;
	border-bottom: 3px solid #3E60DB;
	display: inline-block;
}

.bigtitle {
	position: relative;
	top: 40px;
	font-size: 30px;
	text-align: center;
	color: #3E60DB;
	width: 100%;
	height: 100px;
}
#finishbox{
	position: fixed;
	width: 100%;
	height: 1080px;
	bottom: 0px;
	z-index:2;
	background-color: #00000069;
}
#finish{
	width: 400px;
	border: 1px solid #ccc;
	margin: 30% auto 0 auto;
	padding:20px 0 20px 0;
	background-color: #fff;
	box-shadow: 3px 3px #00000024;
}
#submitbtn{
	width: 90px;
    line-height: 30px;
    border: 2px solid #3E60DB;
    border-radius: 30px;
    margin: 30px 0  0 0;
    background-color: #3E60DB;
    color: #fff;
    cursor: pointer;
}

</style>
</head>
<body>
<div id="finishbox" style="display: none;">
	<div id="finish">
	<c:if test="${result == 1}">
	<div style="font-size: 18px;">문제 등록이 완료되었습니다.</div>
	</c:if>
	<c:if test="${result == 2}">
	<div style="font-size: 18px;">문제집 등록이 완료되었습니다.</div>
	</c:if>
	<button id="submitbtn">확인</button>
	</div>
</div>
	<div id="maincontent">
		<div id="top">
			<div class="bigtitlebox">
				<div class="bigtitle">문제 만들기</div>
			</div>
		</div>
		<div id="mainbox">
			<div class="maintitle">문제 만들기</div>
			<div class="contentitem">
				<form action="makePro001.pro" method="post" id="form">
					<ul id="list">
						<li><select name="category" id="cate1"
							class="dropbox category1">
								<option>분류선택</option>
								<option value="10">어학시험</option>
								<option value="20">국가자격시험</option>
						</select> <select name="category2" id="cate2" disabled="disabled"
							class="dropbox">
						</select> <select name="category3" id="cate3" disabled="disabled"
							class="dropbox">
						</select></li>
					</ul>
				</form>
				<button id="checkbutton" onclick="submit()">확인</button>
			</div>

			<div class="maintitle">문제집 만들기</div>
			<div class="contentitem">
				<form action="makeCol001.pro" id="form2">
					<ul id="list">
						<li><select name="category" id="cate1"
							class="dropbox category1">
								<option>분류선택</option>
								<option value="10">어학시험</option>
								<option value="20">국가자격시험</option>
						</select> <select name="category2" id="cate2" disabled="disabled"
							class="dropbox">
						</select> <select name="category3" id="cate3" disabled="disabled"
							class="dropbox">
						</select></li>
					</ul>
				</form>
				<button id="checkbutton" onclick="submit2()">확인</button>
			</div>
		</div>
	</div>
</body>
</html>