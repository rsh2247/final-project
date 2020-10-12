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

$(document).ready(function() {
	var list;
	var category1;
	var category2;
	var category3;
	var preset = [{a:21,b:'기능사'},{a:22,b:'산업기사'},{a:23,b:'기사'}];
	$('#cate1').on('change', function() {
		category1 = document.getElementById('cate1').value;
		$.ajax({
			type : "post",
			url : "ajax/makeProAjax001.pro",
			data : "string="+category1,
			success : function(data,textStatus) {
				list = data;
				changeForm();
			},
			error:function(data, textSatus){
				alert("에러가 발생");
			},
			complete:function(data, textSatus){
			}
		});
		
	})
	
	$('#cate2').on('change', function() {
		category2 = document.getElementById('cate2').value;
		
		$.ajax({
			type : "post",
			url : "ajax/makeProAjax001.pro",
			data : "string="+category2,
			success : function(data,textStatus) {
				list = data;
				console.log(data);
				changeForm2();
			},
			error:function(data, textSatus){
				alert("에러가 발생");
			},
			complete:function(data, textSatus){
			}
		});
		
	})
	
	function changeForm() {
		$('#cate2').empty();
		$('#cate3').empty();
		
		if(category1 == 10){
			document.getElementById('cate2').setAttribute('disabled', 'disabled');
			document.getElementById('cate3').removeAttribute('disabled');
			for(var i = 0; i<list.length; i++){
				var option = $('<option value='+list[i].CATEGORY_ID+'/'+list[i].CATEGORY_NAME+'>'+list[i].CATEGORY_NAME+'</option>')
				$('#cate3').append(option);
			}
		}else if(category1 == 20){
			document.getElementById('cate3').setAttribute('disabled', 'disabled');
			document.getElementById('cate2').removeAttribute('disabled');
			for(var i = 0; i<preset.length; i++){
				var option = $('<option value='+preset[i].a+'>'+preset[i].b+'</option>')
				$('#cate2').append(option);
			}
		}
	}
	
	function changeForm2() {
		$('#cate3').empty();
		document.getElementById('cate3').removeAttribute('disabled');
		for(var i = 0; i<list.length; i++){
			var option = $('<option value='+list[i].CATEGORY_ID+'/'+list[i].CATEGORY_NAME+'>'+list[i].CATEGORY_NAME+'</option>')
			$('#cate3').append(option);
		}
	}
	
	
})

</script>
</head>
<body>
	<p>유저가 만든 문제들, 혹은 기출문제들을 선택하여 문제집을 만들 수 있습니다.</p>
	<form action="makeCol001.pro">
		<ul>
			<li>문제집 분류</li>
			<li><select name="category" id="cate1">
					<option>분류선택</option>
					<option value="10">어학시험</option>
					<option value="20">국가자격시험</option>
			</select></li>
			<li><select name="category2" id="cate2" disabled="disabled">
			</select></li>
			<li><select name="category3" id="cate3" disabled="disabled">
			</select></li>
			<li><input type="submit" value="확인"></li>
		</ul>
	</form>
</body>
</html>