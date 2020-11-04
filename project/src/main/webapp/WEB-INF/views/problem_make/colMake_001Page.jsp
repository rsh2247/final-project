<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
    var selectedList = [];
    var selectedList2 = [];
    var selected;
    var selected2;

    $(document).ready(function() {
	$('html').click(function(e) {
	    if (e.target.tagName != 'TD' && e.target.className != 'btn') {
		$('.selectedboard').attr('class', 'none');
		$('.selected').attr('class', 'none');
		selectedList = [];
		selectedList2 = [];
	    }
	});
    });

    function select(sel, list) {
	if (event.target.tagName == "TD") {
	    sel = event.target.parentNode;
	    sel.setAttribute("class", "selected");
	    var num = sel.childNodes[1].childNodes[0].nodeValue;
	    for ( var i in list) {
		if (num == list[i].childNodes[1].childNodes[0].nodeValue) {
		    sel.removeAttribute("class");
		    list.splice(i, 1);
		    return;
		}
	    }
	    list.push(sel);
	}

    }
    function add() {
	var preorder
	try {
	    preorder = document.getElementById("list").lastChild.childNodes[3].childNodes[0].nodeValue;
	} catch (exception) {
	    preorder = 0 * 1;
	}
	for ( var i in selectedList) {
	    var score = $('<input type="number" name="score' + (i * 1 + 1 * 1)
		    + '" class="scorebox"></input>')
	    var selected = selectedList[i].childNodes[5];
	    $(selected).append(score);
	    selectedList[i].childNodes[3].appendChild(document
		    .createTextNode((preorder * 1 + (i * 1 + 1) * 1)));
	    document.getElementById("list").appendChild(selectedList[i]);
	}
	selectReset(selectedList);
	selectedList = [];
    }
    function del() {
	for ( var i in selectedList2) {
	    var target = selectedList2[i].childNodes[3].childNodes[0];
	    var target2 = selectedList2[i].childNodes[5].childNodes[0];
	    $(target).remove();
	    $(target2).remove();
	    document.getElementById("selectable").appendChild(selectedList2[i]);
	}
	selectReset(selectedList2);
	selectedList2 = [];
	sort();
    }

    function up() {
	listSort(1);
	for ( var i in selectedList2) {
	    var target = selectedList2[i];
	    if (target.previousSibling.nodeName == "TR") {
		selectedList2[i].parentNode.insertBefore(target,
			target.previousSibling);
	    }
	}
	sort();
    }

    function down() {
	listSort(-1);
	for ( var i in selectedList2) {
	    var target = selectedList2[i];
	    if (target.nextSibling != null) {
		selectedList2[i].parentNode.insertBefore(target,
			target.nextSibling.nextSibling);
	    }
	}
	sort();
    }

    function sort() {
	var con = $('#list').children();
	con = con.splice(1, con.length - 1);
	for ( var i in con) {
	    if (i == 0) {
		con[i].childNodes[3].childNodes[0].nodeValue = 1;
	    } else {
		con[i].childNodes[3].childNodes[0].nodeValue = con[i - 1].childNodes[3].childNodes[0].nodeValue * 1 + 1;
	    }
	}
    }

    function listSort(order) {
	selectedList2
		.sort(function(a, b) {
		    return (a.childNodes[3].childNodes[0].nodeValue - b.childNodes[3].childNodes[0].nodeValue)
			    * order;
		})
    }

    function selectReset(selectedList) {
	for ( var i in selectedList) {
	    selectedList[i].setAttribute("class", "");
	}
	selectedList = [];
    }

    function naming() {
	var list = $('#list').children();
	list = list.splice(1, list.length - 1);
	for ( var i in list) {
	    var tdList = list[i].childNodes;
	    for ( var j in tdList) {
		if (tdList[j].nodeName == 'TD' && j <= 3) {
		    var value = 0;
		    var name;
		    if (j == 1)
			name = 'pro_num';
		    else
			name = 'col_list_num';
		    try {
			value = tdList[j].childNodes[0].nodeValue;
		    } catch (e) {
		    }
		    var hiddenInput = $('<input type="hidden" name="' + name
			    + (i * 1 + 1 * 1) + '"' + ' value ="' + value
			    + '"></input>');
		    $(tdList[j]).append(hiddenInput);
		}
	    }
	}
    }
</script>
<style type="text/css">
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
#contentbox {
	width: 1100px;
	margin: 50px auto 200px auto;
}

#innerbox {
	width: 800px;
	margin: 0 auto 0 auto;
}

#colname {
	width: 100%;
	line-height: 35px;
	padding: 0 0 2px 10px;
	font-size: 18px;
	border: 1px solid #ccc;
	float: left;
}

.colList {
	width: 100%;
	border-collapse: collapse;
	border: 1px solid #AAA;
	border-collapse: collapse;
}

.colList th {
	height: 40px;
}

.colList td {
	height: 30px;
}

.selected {
	background: black;
	color: white;
}

.scorebox {
	width: 25px;
	line-height: 20px;
	text-align:center;
	border: 1px solid #ccc;
}

.btn {
	width: 100px;
	line-height: 35px;
	margin: 10px 5px 0 0;
	border: 1px solid #3E60DB;
	border-radius: 4px;
	background-color: #fff;
	font-size: 14px;
	font-weight: bold;
	color: #3E60DB;
	float: left;
	cursor: pointer;
	transition: all ease 300ms 0s;
}

.btn:hover {
	color: #fff;
	background: #3E60DB;
}
.btn:active{
	margin:12px 8px 3px 6px;
	width: 91px;
	line-height: 30px;
	transition: all ease 100ms 0s;
}

#submitbtn {
	width: 100px;
	line-height: 35px;
	background-color: #3E60DB;
	color: #fff;
	border: 1px solid #3E60DB;
	border-radius: 4px;
	float: right;
	font-size: 14px;
	font-weight: bold;
	margin-top: 20px;
	cursor: pointer;
	transition: all ease 300ms 0s;
}

#submitbtn:hover{
	background-color: #2a4296;
	border: 1px solid #2a4296;
}
#submitbtn:active{
	margin:22px 2px 3px 5px;
	width: 95px;
	line-height: 32px;
	transition: all ease 100ms 0s;
}

#listtable {
	width: 100%;
	margin-bottom: 30px;
}

#selectable {
	width: 100%;
	border-collapse: collapse;
	border: 1px solid #aaa;
	border-collapse: collapse;
}

#selectable th {
	height: 35px;
}

#selectable td {
	height: 35px;
	cursor: pointer;
}

.star1 {
	display: inline-block;
	height: 30px;
	position: absolute;
}

.star2 {
	display: inline-block;
	height: 30px;
}

.midtitle {
	width: fit-content;
	margin: 35px 0 25px 10px;
	text-align: left;
	font-size: large;
	color: #555;
}
</style>
</head>
<body>
	<div id="contentbox">
		<div id="innerbox">
			<form action="makeCol002.pro">
				<table id="listtable" style="border-collapse: collapse;">
					<tr style="width: 100%; border-bottom: 1px solid #ccc; margin: 10px 0 10px 0; float: left;">
						<td style="height: 40px; padding-left: 10px; font-size: 24px">${category}</td>
					</tr>
					<tr>
						<td><input id="colname" name="col_name" type="text" placeholder="문제집 제목을 입력해주세요."> <input type="hidden" name="categoryId" value="${categoryId}"> <input type="hidden" name="categoryName" value="${categoryName}"></td>
					</tr>
					<tr>
						<td><p class="midtitle">문제집</p></td>
					</tr>
					<tr>
						<td>
							<table class="colList" id="list" onclick="select(selected2, selectedList2)">
								<tr>
									<th width="70px;">문제번호</th>
									<th width="70px;">문제순서</th>
									<th width="60px;">배점</th>
									<th width="350px">제목</th>
									<th>분류</th>
									<th>평점</th>
								</tr>
							</table>
						</td>
					</tr>
					<tr style="margin-top: 30px;">
						<td><button onclick="add();" type="button" class="btn">추가</button>
							<button onclick="del();" type="button" class="btn">제거</button>
							<p style="display: inline-block; margin:0px 15px 0px 15px; float: left;"></p>
							<button onclick="up();" type="button" class="btn">위</button>
							<button onclick="down();" type="button" class="btn">아래</button></td>
					</tr>
				</table>
				<p class="midtitle">문제 리스트</p>
				<table id="selectable" onclick="select(selected, selectedList)">
					<tr>
						<th width="200px;">문제번호</th>
						<th></th>
						<th></th>
						<th width="350px">제목</th>
						<th>분류</th>
						<th>평점</th>
					</tr>
					<c:forEach var="list" items="${list}">
						<c:set var="num" value="${list.SCORE*14.8}" />
						<tr>
							<td>${list.PRO_NUM}</td>
							<td></td>
							<td></td>
							<td style="text-align: left;">${list.PRO_NAME}</td>
							<td style="font-size: small;">${list.TAG_NAME}</td>
							<td><img style="clip: rect(0px,${num}px,30px,0px);" class="star1" alt="" src="${contextPath}/resources/image/stars1.png"> <img class="star2" alt="" src="${contextPath}/resources/image/stars2.png"></td>
						</tr>
					</c:forEach>
				</table>
				<input onclick="naming();" type="submit" value="확인" id="submitbtn">
			</form>
		</div>
	</div>
</body>
</html>