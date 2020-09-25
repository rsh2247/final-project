<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
   <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<meta charset="UTF-8">
<title>결제 메인 페이지</title>
<style>
#payment_wrapper {
	border: 10px solid lightblue;
	padding: 5px 20px;
	position: absolute;
	top: 50%;
	left: 50%;
	width: 450px;
	height: 250;
	margin-left: -220px;
	margin-top: -170px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

h3 {
	font-size: 25px;
	padding-bottom: 20px;
}

label {
	flex: 1;
	text-align: left;
}

button {
	width: 85px;
	float: initial;
	padding: 3px;
}

input {
	padding: 5px;
}

</style>
    <script>
            $(document).ready(function(){
                $('#payId').click(function(){
                    var data = $('input[name="payment"]:checked').val();
                    if(data=="point"){
                        $('#pay').attr("action","${contextPath}/payment/pointPay.do").submit();;                  
                    }else if(data="kakao"){
                        $('#pay').attr("action","${contextPath}/kakaoPay").submit();                   
                    }
                });
            });
    </script>
</head>
<body>

	<div id="payment_wrapper">
        <h2> 결제 수단 선택</h2>
        <form name="pay" id="pay" method="post" action="">             
                <div>
                    <input type="radio" name="payment" id="op1" value="point" checked>
                    <label for="point">포인트 결제</label>
                    <input type="radio" name="payment" id="op2"  value="kakao">
                    <label for="kakao">카카오 결제</label>
                </div>
                <div>
                    <button type="button" name="button" id="payId">결제하기</button>
                    <!-- <button onclick="select()">결제하기</button> -->
                </div>
        </form>    
    </div>    

</body>
</html>