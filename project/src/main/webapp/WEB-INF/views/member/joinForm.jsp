<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>
</head>
<body>
	<div id = "wrap">
		<br><br>
		<b><font size = "6" color="gray">회원가입</font></b>
		<br><br><br>
		
		<form method="post" action="../member/joinPro.jsp">
			<table>
				<tr>
					<td id = "title">아이디</td>
					<td>
						<input type="text" name="id" maxlength="20">
						<input type="button" value="중복 확인">
					</td>
				</tr>
				
				<tr>
					<td id = "title">비밀번호</td>
					<td>
						<input type="password" name="password" maxlength="20">
					</td>
				</tr>
				
				<tr>
					<td id = "title">이름</td>
					<td>
						<input type="text" name="name" maxlength="40">
					</td>
				</tr>
				
				<tr>
					<td id = "title">성별</td>
					<td>
						<input type="radio" name="gender" value="남" checked>남
						<input type="radio" name="gender" value="여" checked>여
					</td>
				</tr>
				
				<tr>
					<td id = "title">생일</td>
					<td>
						<input type="text" name="birth_yy" maxlength="4" placeholder="년(4자)" size="6">
						<select name="birth_mm">
							<option value="">월</option>
							<option value="01">1</option>
							<option value="02">2</option>
							<option value="03">3</option>
							<option value="04">4</option>
							<option value="05">5</option>
							<option value="06">6</option>
							<option value="07">7</option>
							<option value="08">8</option>
							<option value="09">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select>
						<input type="text" name="birth_dd" maxlength="2" placeholder="일" size="4">
					</td>
				</tr>
				
				<tr>
					<td id="title">휴대전화</td>
					<td>
						<input type="text" name="phone"/>
					</td>
					</tr>
					<tr>
						<td id = "title">주소</td>
						<td>
							<input type="text" size="50" name="address"	/>
					</td>
				</tr>
			</table>
			<br>
			<input type="submit" value="가입"	/><input type="button" value="취소">
			
		</form>
	</div>
</body>
</html>