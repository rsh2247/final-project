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
                    //    $('#pay').attr("action","${contextPath}/payment/pointPay.do").submit();                  
                        $('#pay').attr("action","${contextPath}/payment/pointPay.do").submit();                  
                    }else if(data="kakao"){
                    	
                    	var url = "${contextPath}/kakaoPay";
                    	var name = "pay";
                    	var option = "width = 500, height = 500, top = 100, left = 100, location = no";
                    	
                       window.open("",pay,option);
                       $('#pay').attr("target",pay);
                       $('#pay').attr("action",url).submit();
                        
                    }
                });
            });
            
    </script>
</head>
<body>

	<div id="payment_wrapper">
		
		
				<form id = "order_amount" method="post" action="{contextPath}/order_amount">
				<h2> 주문정보</h2>               
                <table>
					<tr>
						<th scope="row">강의번호</th>
						<td>${orderlist[0].lecture_id}</td>
					</tr>
					<tr>
						<th scope="row">강의분야</th>
						<td>${orderlist[0].lecture_category}</td>
					</tr>
						<tr>
						<th scope="row">강의명</th>
						<td>${orderlist[0].lecture_name}</td>
					</tr>
					<tr>
						<th scope="row">강사아이디</th>
						<td>${orderlist[0].user_id}</td>
					</tr>
					<tr>
						<th scope="row">수강료</th>
						<td>${orderlist[0].lecture_tuition}</td>
					</tr>
				</table>
				</form>
	
	
	
        <h2> 결제 수단 선택</h2>
        <form name="pay" id="pay" method="post">             
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