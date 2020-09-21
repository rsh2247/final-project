<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.menu {
margin-top: 50px;
}
</style>

</head>
<body>
<div class="menu">
<form action="collection_page.pro" method="post">
<select name="number">
<c:forEach var="list" items="${list}">
<option value="${list.col_num}">${list.col_name}</option>
</c:forEach>
</select> 지난 기출
<input type="submit" value="확인">
</form>

<form action="" method="post">
<select>
<option value="test1"> test1</option>
<option value="test2"> test2</option>
</select> 랜덤 기출
<input type="submit" value="확인">
</form>
</div>
</body>
</html>