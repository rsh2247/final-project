<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>결제 완료</title>

<script src="<c:url value="/resources/js/payment.js" />"></script>

<style type="text/css">
table.approved {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    margin: 20px 10px;
}
table.approved th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #efefef;
}
table.approved td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}

</style>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">

   function closeIt()
  {		
		event.returnValue = "창을 닫겠습니까?";
		var url="${contextPath}/lecture/main.do";
    	opener.location.href = url; 	
  }
   
</script>
    
</head>
<body onbeforeunload="closeIt()">

	<h1>결제가 정상적으로 완료되었습니다.</h1>
<hr>
<table class="approved">
	<tr>
		<th scope="row">결제시각</th>
		<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${info.approved_at}"/></td>
	</tr>
	<tr>
		<th scope="row">결제번호</th>
		<td>${info.partner_order_id}</td>
	</tr>
		<tr>
		<th scope="row">상품명</th>
		<td>${info.item_name}</td>
	</tr>
	<tr>
		<th scope="row">할인금액</th>
		<td>${info.discount_point} 원</td>
	</tr>
	<tr>
		<th scope="row">주문금액</th>
		<td>${info.order_price} 원</td>
	</tr>
	<tr>
		<th scope="row">총 결제 금액</th>
		<td>${info.pay_amount} 원</td>
	</tr>
</table>

</body>
</html>
