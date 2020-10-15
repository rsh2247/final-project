<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous">
	
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
						$('#cate1').on('change', function() {
							category1 = document.getElementById('cate1').value;

							$.ajax({
								type : "post",
								url : "ajax/makeProAjax001.pro",
								data : "string=" + category1,
								success : function(data, textStatus) {
									list = data;
									changeForm();
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

						function changeForm() {
							$('#cate2').empty();
							$('#cate3').empty();

							if (category1 == 10) {
								document.getElementById('cate2').setAttribute(
										'disabled', 'disabled');
								document.getElementById('cate3')
										.removeAttribute('disabled');
								for (var i = 0; i < list.length; i++) {
									var option = $('<option value='+list[i].CATEGORY_ID+'/'+list[i].CATEGORY_NAME+'>'
											+ list[i].CATEGORY_NAME
											+ '</option>')
									$('#cate3').append(option);
								}
							} else if (category1 == 20) {
								document.getElementById('cate3').setAttribute(
										'disabled', 'disabled');
								document.getElementById('cate2')
										.removeAttribute('disabled');
								for (var i = 0; i < preset.length; i++) {
									var option = $('<option value='+preset[i].a+'>'
											+ preset[i].b + '</option>')
									$('#cate2').append(option);
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

					})
	function submit() {
		$('#form').submit();
	}
</script>
<style type="text/css">
#maincontent {
	width: 1000px;
	min-height: 600px;
	margin: 50px auto 0 auto;
	margin: 50px auto 0 auto;
}

#maintitle {
	width: 90%;
	height: 40px;
	border-bottom: 1px solid #d4d4d4;
	text-align: left;
	padding-left: 10px;
	margin-left: 5%;
	margin-bottom: 25px;
	font-size: 21px;
	color: #333;
	margin-bottom: 25px;
}

#contentitem {
	width: 90%;
	margin: 0 auto 0 auto;
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
	border: 2px solid #3E60DB;
}

.dropbox option {
	height: 30px;
}

.dropbox:disabled {
	cursor: default;
}
</style>
</head>
<body>
	<div id="maincontent">
		<div id="maintitle">문제 만들기</div>
		<div id="contentitem">
			<form action="makePro001.pro" method="post" id="form">
				<ul id="list">
					<li><select name="category" id="cate1" class="dropbox">
							<option>분류선택</option>
							<option value="10">어학시험</option>
							<option value="20">국가자격시험</option>
					</select></li>
					<li><select name="category2" id="cate2" disabled="disabled" class="dropbox">
					</select></li>
					<li><select name="category3" id="cate3" disabled="disabled" class="dropbox">
					</select></li>
				</ul>
			</form>
			<button id="checkbutton" onclick="submit()">확인</button>
		</div>
	</div>
</body>
</html>