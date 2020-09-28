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
        var list;
        var p_id;
        
        $('#search').click(function(){
            	$.ajax({
             	url: "${contextPath}/pointPays",
                type: "post",
                data: "p_id="+$('#text').val(),
                success: function(data, textStatus){
					list = data;
                	console.log(data);
                	console.log(list);
					
                	alert("success"); 
                },
                error: function(data, textStatus){
                    alert("error");
                },
                complete:function(data, textSatus){
    				alert("complete")
                }
            });    
        });
    });
   	
   	function output() {
   		alert("output");
   		for(var i=0;i<list.length;i++){
   			var k = list[i].point_rest;
   			confole.log(k);
   			$('#result3').text(k);
   		}
   		
   		console.log(list);
   		console.log(list[0]);
   		$('#text').text(list[0].point_rest);
		$('#result1').text(list[0].point_rest);
		$('#result2').text(list.point_rest);
		$('#result4').append("abcde");
	}
   	
/*    	
   	$(document).ready(function(){
        $('#search').click(function(){
            var list;
        	var p_id = $('#text').val();
   		    alert(p_id); 
        
            	$.ajax({
             	url: "${contextPath}/pointPays",
                type: "post",
                data: p_id,
                success: function(data, textStatus){
                	 var jsonInfo = JSON.parse(data);
                	 console.log(jsonInfo);
					$('#text').text(jsonInfo.point_rest);
                },
                error: function(data, textStatus){
                    alert("error");
                },
                complete:function(data, textSatus){
    				alert("complete")
                }
            });    
        });
    });
 */  	
   	</script>
</head>
<body>
    <div id="point_wrapper">
        <h2> 포인트 결제</h2>
                <div>
                    <h5>포인트 조회</h5>
                </div>
                <div>
                    <input type="text" id="text" name="p_id">
                    <button id="search">조회</button><br>
                    <input type="text" id="result1"><br>
                    <input type="text" id="result2"><br>
                    <input type="text" id="result3"><br>
                    <div id="result4"></div><br>

                </div>
    </div>     
	
</body>
</html>