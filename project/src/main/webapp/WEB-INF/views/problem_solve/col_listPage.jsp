<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#coltable {
	border-collapse: collapse;
	border: 0px solid black;
	margin: auto;
	border-radius: 5px;
}

#coltable th {
	height: 50px;
	font-size: 18px;
	color: #fff;
	background-color: #5976e0;
}

#coltable td {
	height: 35px;
	padding: 2px 0 2px 0;
	border-bottom: 1px solid #ddd;
}


#contentbox {
	width: 1000px;
	margin: 100px auto 0 auto;
}

.elipse {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 130px;
}

.star1 {
	display: inline-block;
	height: 25px;
	position: absolute;
}

.star2 {
	display: inline-block;
	height: 25px;
}

.col_title {
	text-decoration: none;
	color: black;
	padding-left: 20px;
}

.col_title:hover {
	text-decoration: underline;
}

.evalscorelist {
	cursor: pointer;
}

.inline {
	display: inline-block;
	width: 400px;
}
.pagebtn {
	width: 35px;
	line-height: 35px;
	border: 0px solid #ccc;
	border-radius: 20px;
	background-color: #fff;
	font-size:16px;
	cursor: pointer;
	transition: all ease 300ms;
}
.pagebtn:hover{
	background-color: #5976e0;
	color: #fff;
}

.colorbtn {
	background-color: #3E60DB;
	color: #fff;
}
#evalbox {
	width: 100%;
	height: 100%;
	top: 0px;
	position: fixed;
	z-index: 1;
	background-color: #55555555;
	display: none;
}

#eval {
	width: 900px;
	min-height: 100px;
	margin: 150px auto 0 auto;
	padding-bottom: 15px;
	background-color: #fff;
	overflow: scroll;
	overflow-x:hidden;
}

#evallist {
	list-style: none;
}

#evaltitle {
	width: 850px;
	height: 60px;
	font-size: 24px;
	font-weight: bold;
	margin: 0 auto;
	border-bottom: 2px solid #ddd;
	padding: 15px 0 0 0.5em;
	text-align: left;
}

.evalli {
	width: 850px;
	margin: 15px auto 15px auto;
	border: 1px solid #ddd;
	border-radius: 8px;
	text-align: left;
}

.evallisttitle {
	width: 800px;
	height: 60px;
	margin: 10px auto -1px auto;
	border-bottom: 1px solid #ddd;
}

.evalid {
	font-size: 20px;
}

.evaldate {
	font-size: 14px;
	color: #999;
}

.evalcontent {
	width: 800px;
	min-height: 50px;
	margin: 15px auto 10px auto;
	padding-bottom: 15px;
}
.instar{
    width: 122px;
	height: 25px;
	background-size: cover;
    display: flex;
    position: relative;
    top: 25px;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {

	$('.evalscorelist').click(function() {
		    $('#evalbox').css('display',
			    'block')
		    var val = $(this).children("input")
			    .val();
		    var input = {"col_num" : val};
		    $('#evallist').children().remove();
		    $('#evaltitle').empty();
		    $.ajax({
				type : "post",
				url : "colevallist.pro",
				data : input,
				success : function(data) {
				    var title = "title"
				    $('#evaltitle').append( title);
				    for ( var i in data) {
					var content = data[i].COL_EVAL_CONTENT;
					var li = '<li class="evalli"><div class="evallisttitle">'
						+ '<span class="inline"><p class="inline evalid">'
						+ data[i].USER_ID
						+ '</p><p class="inline evaldate">'
						+ data[i].COL_EVAL_DATE
						+ '</p></span>'
						+ '<span class="inline">'
						+ '<span class="instar" style="background-image:url(${contextPath}/resources/image/stars1.png);'
						+ 'width:'+data[i].COL_EVAL_SCORE*12.2+'px"></span>'
						+ '<img class="star2" alt="" src="${contextPath}/resources/image/stars2.png"></span>'
						+ '</div>'
					if (content != undefined) li += '<div class="evalcontent">'+ content;
					li += "</div></li>";
					$("#evallist").append(li);
				    };
				    if (data.length == 0) {
					var li = '<li style="margin:15px 0 10px 0">아직 평가가 등록되지 않았습니다.</li>';
					$("#evallist").append(li);
				    }
				},
				error : function() {

				}
			    })
		})
	
	
	$('#evalbox').click(function(e) {
	    if (e.target == this)
		$(this).css('display', 'none');
	})
	$('#maxPage').on('change',function () {
		$(this).parent().submit();
	})
	
	var maxPages = $('#maxPage').children();
	for(var i=0; i<maxPages.length; i++){
		if($(maxPages[i]).val() == '${result.maxPage}'){
			console.log($(maxPages[i]).val())
			$(maxPages[i]).attr('selected','selected');
		}
	}
	
	
    })
</script>
</head>
<body>
	<div id="evalbox">
		<div id="eval">
			<div id="evaltitle"></div>
			<ul id="evallist">
			</ul>
		</div>
	</div>
	<div id="contentbox">
	<div style="height: 52px;border-bottom: 2px solid #ccc; margin:0 auto 30px auto; width: 1000px;  text-align: left; ">
			<div style="line-height: 50px;padding: 0 15px 0 15px;border-bottom: 2px solid #3E60DB;color:#3E60DB; display:inline-block; font-size: 24px;">${result.category}</div>
			<div style="display: inline-block; float: right;">
			<form action="userColselect_page.pro">
				<select id="maxPage" name="maxPage" style="height: 42px;padding:0 10px 0 10px; top:10px;position:relative;border:0px; border-bottom: 2px solid #ccc;">
				<option value="10">10개씩 보기</option>
				<option value="15">15개씩 보기</option>
				<option value="20">20개씩 보기</option>
				</select>
				<input type="hidden" name="category" value="${result.category}">
				<input type="hidden" name="category" value="${result.pageNum}">
			</form>
			</div>
		</div>
		<table id="coltable">
			<tr>
				<th width="20px"></th>
				<th width="100px">번호</th>
				<th width="550px">문제집 이름</th>
				<th width="130px">제작자</th>
				<th width="200px">평점</th>
			</tr>
			<c:forEach items="${list}" var="list">
				<c:set var="num" value="${list.SCORE*12.2}" />
				<tr style="border-bottom: 1px solid #ccc; height: 30px;">
					<td></td>
					<td>${list.COL_NUM}</td>
					<td style="text-align: left; padding-left: 10px;"><a class="col_title" href="col_problemPage.pro?col_num=${list.COL_NUM}">${list.COL_NAME}</a></td>
					<td><div class="elipse">${list.USER_ID}</div></td>
					<td><span class="evalscorelist"> 
					<input type="hidden" value="${list.COL_NUM}"> 
					<img style="clip: rect(0px,${num}px,30px,0px);" class="star1" alt="" src="${contextPath}/resources/image/stars1.png"> <img class="star2" alt=""
							src="${contextPath}/resources/image/stars2.png"
						>
					</span></td>
				</tr>
			</c:forEach>
		</table>
		<div style="margin: 20px;">
			<c:set var="pageNum" value="1" />
			<c:forEach begin="1" end="${page.listNum}">
				<c:if test="${pageNum == page.nowPage}">
					<button class="pagebtn colorbtn" value="${pageNum}" onclick="location.href='${contextPath}/problem_solve/list.pro?category=${result.category}&maxPage=${result.maxPage}&pageNum=${pageNum}'">${pageNum}</button>
				</c:if>
				<c:if test="${pageNum != page.nowPage}">
					<button class="pagebtn" value="${pageNum}" onclick="location.href='${contextPath}/problem_solve/list.pro?category=${result.category}&maxPage=${result.maxPage}&pageNum=${pageNum}'">${pageNum}</button>
				</c:if>
				<c:set var="pageNum" value="${pageNum + 1}" />
			</c:forEach>
		</div>
		
	</div>
</body>
</html>