<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>결제 완료</title>
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
</head>
<body>

	<h1>결제가 정상적으로 완료되었습니다.</h1>
<hr>
<table class="approved">
	<tr>
		<th scope="row">결제시각</th>
		<td>${info.pay_date}</td>
	</tr>
	<tr>
		<th scope="row">결제번호</th>
		<td>${info.pay_id}</td>
	</tr>
	<tr>
		<th scope="row">상품명</th>
		<td>${info.lecture_name}</td>
	</tr>
	<tr>
		<th scope="row">주문금액</th>
		<td>${info.order_price}</td>
		<td>포인트 사용 ${info.discount_point}</td>
	</tr>
	<tr>
		<th scope="row">총 결제 금액</th>
		<td>${info.pay_amount}</td>
	</tr>
</table>
  
<br><br><br>
<hr>
  
<h2>[[${info}]]</h2>

</body>
</html>
