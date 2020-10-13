<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	background-color: #312E41;
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
</head>
<body>
	<form action="user.signUp" method="post">
		<table id="inputform">
			<tr style="border: 0px;">
				<td class="topbox" colspan="2">회원가입</td>
			</tr>
			<tr style="border: 0px;">
				<td class="leftbox">ID</td>
				<td><input class="inputbox" name="id" type="text"></td>
			</tr>
			<tr>
				<td colspan="2" class="leftbox"> </td>
			</tr>
			<tr>
				<td class="leftbox">Password</td>
				<td><input class="inputbox" name="pw" type="password"></td>
			</tr>
			<tr>
				<td class="leftbox">NickName</td>
				<td><input class="inputbox" name="nickName" type="text"></td>
			</tr>
			<tr>
				<td class="leftbox">Email</td>
				<td><input class="inputbox" name="email" type="text"></td>
			</tr>
			<tr style="border-bottom: 0px;">
				<td colspan="2"><input id="submitButton" type="submit" value="확인"></td>
			</tr>
		</table>
	</form>
</body>
</html>