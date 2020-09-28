<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        #point_wrapper{
            border: 10px solid lightblue;
            padding: 5px 20px;
            position: absolute;
            top: 50%;
            left: 50%;
            width: 450px; height: 250;
            margin-left: -220px;
            margin-top: -170px;

            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        h2{
            font-size: 25px;
            padding-bottom: 10px;
        }
        h5{
            font-size: 15px;
            padding-bottom: 10px;
        }
        label{
            flex:1;
            text-align: left;
        }
        button{
            width: 85px;
            /* float: initial; */
            padding: 3px;
        }
        input{
            padding: 5px;
        }

    </style>    
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
   	<script type="text/javascript">
   	
   	$(document).ready(function(){
        $('#search').click(function(){
            var p_id = $('#text').val();
   		    alert(p_id); 
        
            	$.ajax({
             	url: "${contextPath}/pointPays",
                type: "post",
                data: p_id,
                success: function(data){
                	 var jsonInfo = JSON.parse(data);
					$('#text').text(jsonInfo.point_rest);
                },
                error: function(){
                    alert("error");
                }
            });    
        });
    });
   	
  	
   	</script>
</head>
<body>
    <div id="point_wrapper">
        <h2> 포인트 결제</h2>
        <form name="pay" id="pay">             
                <div>
                    <h5>포인트 조회</h5>
                </div>
                <div>
                    <input type="text" id="text" name="point">
                    <button id="search">조회</button>
                </div>
        </form>    
    </div>     
	
</body>
</html>