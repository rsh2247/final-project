<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	list-style: none;
}

#contentbox {
	height: 1200px;
	margin-top: 20px;
}

#mainbox {
	width: 850px;
	height: 100%;
	margin-left: 25px;
	float: left;
	background-color: #eee;
	text-align: left;
}

.divbox {
	width: 100%;
	margin: 20px 0 20px 0;
}

.divbox li {
	width: 100%;
	padding-left: 12px;
}

.divheader {
	width: 100%;
	border-bottom: 2px solid #555;
	padding: 10px 0 10px 0;
}

.colname {
	padding-left: 15px;
}

.boardbtn {
	width: 90px;
	height: 30px;
	border: 1px solid #555;
	float: right;
	cursor: pointer;
	margin: 10px 5px 10px 5px;
}

.boardbtn:hover {
	background-color: #fff;
}

#tablebox {
	width: 400px;
	margin: 10px 0 10px 20px;
	border: 1px solid #fff;
	border-radius: 5px;
	float: left;
}

#boardList {
	width: 100%;
	margin: 10px 0 10px 0;
	border-collapse: collapse;
}
#boardList td {
	width: 100%;
}
#nameinput{
	margin: 10px 5px 10px 5px;
}
#controlpanel{
	float: left;
}
.selectboard {
	width: -webkit-fill-available;
	padding: 5px 0 5px 10px;
	display: inline-block;
	background-color: #fff;
	cursor: pointer;
}

.selectedboard {
	width: -webkit-fill-available;
	padding: 5px 0 5px 10px;
	display: inline-block;
	background-color: #555;
	color: #fff;
	cursor: pointer;
}
</style>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	var list = [];
    $(document).ready(function() 
	    {
			$('html').click(function(e) {
					    if (e.target.className != 'selectboard'
						    && e.target.className != 'selectedboard') {
						$('.selectedboard').attr('class', 'selectboard');
					    list = [];
					    }
					});
			$('#add').click(function() {
			    		var name = $('#nameinput').val();
					    var map = JSON.stringify({"board_name":name,"group_num":"${result.GROUP_NUM}"});
					    $.ajax({
						type : "post",
						url : "add.user",
						async: false,
						data : "input=" + map,
						success : function(data, textStatus) {
						    var newlist = '<tr><td><button type="button" value="'+data.BOARD_NUM+'" class="selectboard" onclick="select(this)">'+name+'</button></td></tr>'
						    $('#boardList').append(newlist);
						    alert('추가 완료.');
						},
						error : function(data, textSatus) {
							alert("에러가 발생");
						},
						complete : function(data, textSatus) {
						}
					});
			})

			$('#del').click(function() {
			    $('.selectedboard').parent().remove();
			    $.ajax({
				type : "post",
				url : "delete.user",
				traditional : true,
				async: false,
				data : {'data':list},
				success : function(data, textStatus) {
				    alert('삭제 완료.');
				},
				error : function(data, textSatus) {
					alert("에러가 발생");
				},
				complete : function(data, textSatus) {
				}
			});
			})
			
		    })
    function select(e) {
	if ($(e).attr('class') == 'selectboard') {
	    $(e).attr('class', 'selectedboard');
	    list.push($(e).val())
	    console.log(list);
	} else {
	    $(e).attr('class', 'selectboard');
	    for(var i=0; i<list.length; i++){
			if(list[i] == $(e).val()){
			    list.splice(i,1);
			    console.log(list);
			    return;
			}
	    }
	}
    }
</script>
</head>
<body>
	<div id="contentbox">
		<jsp:include page="groupPage_sidebar.jsp"></jsp:include>
		<div id="mainbox">
			<form action="" id="form">
				<div class="divbox">
					<div class="divheader">
						<label class="colname">카페관리</label>
					</div>
					<ul class="ulbox">
						<li><div id='desc'>카페이름</div>
							<div id="inputbox">
								<input type="text">
							</div></li>
						<li><div id='desc'>가입방식</div>
							<div id="inputbox">
								<input type="text">
							</div></li>
						<li><div id='desc'>카페설명</div>
							<div id="inputbox">
								<input type="text">
							</div></li>
					</ul>
				</div>
				<div class="divbox">
					<div class="divheader">
						<label class="colname">게시판관리</label>
					</div>
					<div>게시판목록</div>
					<div id="tablebox">
						<table id="boardList">
							<tr>
								<th></th>
							</tr>
							<c:set var="i" value="1" />
							<c:forEach var="list" items="${boardList}">
								<tr>
									<td><button type="button" class="selectboard" id="list${i}" value="${list.BOARD_NUM}" onclick="select(this)">${list.BOARD_NAME}</button></td>
								</tr>
								<c:set var="i" value="${i+1}" />
							</c:forEach>
						</table>
					</div>
					<div id="controlpanel">
						<input id="nameinput" style="height: 28px;border: 1px solid #ccc;">
						<button type="button" class="boardbtn" id="del">게시판 삭제</button>
						<button type="button" class="boardbtn" id="add">게시판 추가</button>
					</div>
				</div>
				<div class="divbox" style="display: flex;">
					<div class="divheader">
						<label class="colname">카페회원관리</label>
					</div>
					<ul>
						<li></li>
					</ul>
				</div>
			</form>
		</div>
	</div>
</body>
</html>