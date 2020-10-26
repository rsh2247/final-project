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
	font-size: x-large;
}
.divmiddle{
	padding: 25px 0 0px 0;
	padding-left: 20px;
	font-size: large;
}

.desc{
	width: inherit;
	margin: 10px 0px 5px 0px;
}

.inputbox input{
	width: 500px;
	height: 30px;
	padding-left: 0.7em;
	border: 1px solid #555;
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
.memberList{
	width:-webkit-fill-available;
	margin: 10px 20px 20px 20px;
	border-collapse: collapse;
}
.memberList th{
	height: 45px;
	border-bottom: 2px solid #555;
}
.memberList td{
	height: 35px;
	border-bottom: 1px solid #555;
}

.memberbtn{
	width: 80px;
	height: 30px;
	cursor: pointer;
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
.inlineform{
	display: inline-block;
}
</style>
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
				<div class="divbox">
					<div class="divheader">
						<label class="colname">카페관리</label>
					</div>
					<ul class="ulbox">
						<li><div class='desc'>카페이름</div>
							<div class="inputbox">
								<input type="text">
							</div></li>
						<li><div class='desc'>가입방식</div>
							<div class="inputbox">
								<input type="text">
							</div></li>
						<li><div class='desc'>카페설명</div>
							<div class="inputbox">
								<input type="text">
							</div></li>
					</ul>
				</div>
				<div class="divbox">
					<div class="divheader">
						<label class="colname">게시판관리</label>
					</div>
					<div class="divmiddle">게시판목록</div>
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
				<div class="divbox" style="display:inline-block;">
					<div class="divheader">
						<label class="colname">카페회원관리</label>
					</div>
					<div class="divmiddle">회원목록</div>
					<table class="memberList">
						<tr>
							<th width="400px">아이디</th>
							<th>등급</th>
							<th>가입일자</th>
							<th width="200px"></th>
						</tr>
						<c:forEach var="list" items="${memberList.member}">
							<c:if test="${list.G_LIST_STATE ne 'deport'}">
							<tr>
								<td>${list.USER_ID}</td>
								<td>${list.G_LIST_STATE}</td>
								<td>${list.G_LIST_JOINDATE}</td>
								<td>
								<c:if test="${list.G_LIST_STATE ne 'manager'}">
								<form action="deport" method="post" class="inlineform">
								<input type="hidden" name="group_num" value="${result.GROUP_NUM}">
								<input type="hidden" name="user_id" value="${list.USER_ID}">
								<button class="memberbtn" value="${list.USER_ID}">추방</button></form>
								<form action="yield" method="post" class="inlineform">
								<input type="hidden" name="group_num" value="${result.GROUP_NUM}">
								<input type="hidden" name="user_id" value="${list.USER_ID}">
								<button class="memberbtn" >관리자 양도</button></form>
								</c:if></td>
							</tr>
							</c:if>
						</c:forEach>
					</table>
					<div class="divmiddle">가입신청목록</div>
					<table class="memberList">
						<tr>
							<th width="400px">아이디</th>
							<th> </th>
							<th>가입신청일자</th>
							<th width="200px"></th>
						</tr>
						<c:forEach var="list" items="${memberList.candidate}">
							<tr>
								<td>${list.USER_ID}</td>
								<td> </td>
								<td>${list.G_LIST_CANDIDATE}</td>
								<td>
								<form action="apply" class="inlineform">
									<input type="hidden" name="group_num" value="${result.GROUP_NUM}">
									<input type="hidden" name="user_id" value="${list.USER_ID}">
									<input type="hidden" name="apply" value="true">
									<button class="memberbtn">승낙</button>
								</form>
								<form action="apply" class="inlineform">
									<input type="hidden" name="group_num" value="${result.GROUP_NUM}">
									<input type="hidden" name="user_id" value="${list.USER_ID}">
									<input type="hidden" name="apply" value="false">
									<button class="memberbtn">거절</button>
								</form>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
		</div>
	</div>
</body>
</html>