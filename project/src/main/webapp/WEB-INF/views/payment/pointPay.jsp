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
        	text-align:right;
            padding: 5px;
        }
        table{
        	padding-bottom: 10px;
        }

    </style>  

    
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
   	<script type="text/javascript">
   	
   	$(document).ready(function(){
        var list, list2;
        var p_id = $('#result').val();
        var point_rest;
        
        $('#search').click(function(){
            	$.ajax({
             	url: "${contextPath}/searchPoint",
                type: "post",
                data: "p_id="+$('#result').val(),
                success: function(data, textStatus){
					list = data;
					console.log(list);
					console.log(list[0].point_rest);
					/* $('#result').empty(); */
					point_rest = $('#result').val(list[0].point_rest);
					
					
                },
                error: function(data, textStatus){
                    alert("error");
                },
                complete:function(data, textSatus){  				
                }
            });    
        });
		
        

        $('#update').click(function(){
        	
            	var sendData={
                	"p_id" : "abcd",	
                	"usePoint" : $('#result2').val()	
                };
            
            	$.ajax({
             	url: "${contextPath}/updatePoint",
                type: "post",
                data: sendData,
                success: function(data, textStatus){
					list2 = data;
					console.log(list2);
					console.log(list2.point_rest);
					
					$('#result3').val(list2.point_rest);					
                },
                error: function(data, textStatus){
                    alert("error");
                },
                complete:function(data, textSatus){  				
                }
            });    
        });
        
        
    });
   	 	
   	</script>
</head>
<body>
    <div id="point_wrapper">
        		<h2> 포인트 결제</h2>
        		
                <div>
                    <h5>포인트 조회</h5>
                </div>
                <div>
                    <input type="text" id="result" name="p_id">
                    <button id="search">조회</button><br>
                </div>
                
                <div>
                    <h5>포인트 사용</h5>
                </div>
                <div>
                    <input type="text" id="result2" name="p_id2">
                    <button id="update">사용</button><br>
                </div>
                
                <div>
                    <h5>잔여 포인트</h5>
                </div>
                <div>
                    <input type="text" id="result3">
                    <button id="balance">사용</button><br>
                </div>
    </div>     
	
</body>
</html>