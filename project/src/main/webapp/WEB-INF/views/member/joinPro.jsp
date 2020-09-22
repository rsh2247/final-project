<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 처리 JSP</title>
</head>
<body>
	<%
	request.setCharacterEncoding("euc-kr"); 
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    String name = request.getParameter("name");

    String[] gender = request.getParameterValues("gender");
    String birthyy = request.getParameter("birth_yy");
    
    String[] birthmm = request.getParameterValues("birth_mm");
    String birthdd = request.getParameter("birth_dd");
    String email1 = request.getParameter("email_1");
    
    String[] email2 = request.getParameterValues("email_2");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
	%>
	
	<div id = "wrap">
		<br><br>
		<b><font size="5" color="gray" >회원가입 정보를 확인하세요.</font></b>
		<br><br>
		<font color="blue"><%=name %></font>님, 가입을 축하드립니다.
		<br><br>
		
		<table>
			<tr>
				<td id = "title">아이디</td>
				<td><%=id %></td>
			</tr>
			
			<tr>
				<td id = "title">비밀번호</td>
				<td><%=password %></td>
			</tr>
			
			<tr>
				<td id = "title">성별</td>
				<td>
				<%
				for(String g : gender) {out.println(g);}
				%>
				</td>
			</tr>
			
			<tr>
				<td id = "title">생일</td>
				<td>
				<%=birthyy %>년
				<%
				for(String mm : birthmm) {out.println(mm);}
					%>월 <%=birthdd %>일
				</td>
			</tr>
			
			<tr>
				<td id = "title">이메일</td>
				<td>
				<%=email1 %>
				<%
				for(String e : email2){out.println("@"+e);}
				%>
				</td>
			</tr>
			
			<tr>
				<td id = "title">휴대전화</td>
				<td><%=phone %></td>
			</tr>
			<tr>
				<td id = "title">주소</td>
				<td>
					<%=address %>
				</td>
			</tr>
		</table>
		
		<br>
		<input type="button" value="확인">

	</div>
</body>
</html>