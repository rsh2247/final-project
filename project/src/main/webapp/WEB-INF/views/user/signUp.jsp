<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#inputform {
	border-collapse: collapse;
	border: 0px;
	margin: 200px auto;
}

#inputform tr {
	border-bottom: 1px solid #ccc;
}

#submitButton {
	float:right;
	width: 70px;
	padding: 8px 10px 8px;
	margin: 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 16px;
	background-color: #3E60DB;
	color: #fff;
	cursor: pointer;
	
}

.inputbox {
	width: 200px;
	padding: 10px 10px 10px;
	margin: 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.leftbox {
	width: 100px;
	text-align: left;
	padding-left: 10px;
	font-size: 14px;
}

.topbox {
	padding: 20px 0 20px 0;
	font-size: 24px;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

var idPattern = /^[A-Za-z0-9]{4,16}$/;
var pwPattern = /^[A-Za-z0-9!-)]{6,16}$/;
var emailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	$(document).ready(function () {
	    $('#submitButton').click(function () {
			var id = $('#idbox').val();
		
			if(id==''){
			    alert('아이디를 입력하세요.');
			}else if(idPattern.test(id)==false){
			    alert('아이디를 형식에 맞춰주세요.');   
			}else if($('#pwbox').val()==''){
			    alert('비밀번호를 입력하세요.');
			}else if(pwPattern.test($('#pwbox').val())==false){
			    alert('비밀번호를 형식에 맞춰주세요.');
			}else if(emailPattern.test($('#emailbox').val())==false){
			    alert('이메일을 형식에 맞춰주세요.');
			}else{
			    $.ajax({
				type : "post",
				url : "ajaxIdCheck",
				data : "id=" + id,
				success : function(data, textStatus) {
					if(data == 1){
					    alert("아이디중복");
					}else{
					    $('#action').submit();
					    $('#action').attr('id','null');
					}
				},
				error : function(data, textSatus) {
					alert("에러가 발생");
				},
				complete : function(data, textSatus) {
				}
			});
			}
		})
	})
	
</script>
</head>
<body>
	<form id="action" action="user.signUp" method="post">
		<table id="inputform">
			<tr style="border: 0px;">
				<td class="topbox" colspan="2">회원가입</td>
			</tr>
			<tr style="border: 0px;">
				<td class="leftbox">ID</td>
				<td><input class="inputbox" name="id" type="text" id="idbox"></td>
			</tr>
			<tr>
				<td colspan="2" class="leftbox"> </td>
			</tr>
			<tr>
				<td class="leftbox">Password</td>
				<td><input class="inputbox" name="pw" type="password" id="pwbox"></td>
			</tr>
			<tr>
				<td class="leftbox">NickName</td>
				<td><input class="inputbox" name="nickName" type="text"></td>
			</tr>
			<tr>
				<td class="leftbox">Email</td>
				<td><input class="inputbox" name="email" type="text" id="emailbox"></td>
			</tr>
			<tr style="border-bottom: 0px;">
				<td colspan="2"><button id="submitButton" type="button" >확인</button></td>
			</tr>
		</table>
	</form>
</body>
</html>