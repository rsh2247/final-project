<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
<tr>
<th>
</th>
<th>
</th>
</tr>
<c:forEach var="list" items="${list}">
<tr>
<td>
${list.COL_LIST_NUM}. ${list.PRO_NAME}
</td>
<td>
${list.PRO_CONTENT}
</td>
</tr>
</c:forEach>
</table>
</body>
</html>