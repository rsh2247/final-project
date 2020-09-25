<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
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

	function select(sel, list) {
		if (event.target.tagName == "TD") {
			sel = event.target.parentNode;
			sel.setAttribute("class", "selected");
			var num = sel.childNodes[1].childNodes[0].nodeValue;
			//var temp = selected.cloneNode(true);
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
		try{
			preorder = document.getElementById("list").childNodes[3].value;
		}catch(exception){
			preorder = 1;
		}
		console.log(preorder);
		for ( var i in selectedList) {
			selectedList[i].childNodes[3].appendChild(document.createTextNode((preorder*1+i*1)));
			document.getElementById("list").appendChild(selectedList[i]);
		}
		selectReset(selectedList);
		selectedList = [];
	}
	function del() {
		for ( var i in selectedList2) {
			selectedList2[i].childNodes[3].removeC
			document.getElementById("selectable").appendChild(selectedList2[i]);
		}
		selectReset(selectedList2);
		selectedList2 = [];
	}

	function selectReset(selectedList) {
		for ( var i in selectedList) {
			selectedList[i].setAttribute("class", "");
		}
	}
</script>
<style type="text/css">
.colList {
	border-collapse: collapse;
	border: 1px solid #AAA;
	width: 800px;
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

#selectable {
	border-collapse: collapse;
	border: 1px solid #aaa;
	width: 600px;
}

#selectable th {
	height: 35px;
}

#selectable td {
	height: 25px;
}
</style>
</head>
<body>
	<table>
		<tr>
			<td>문제집 제목 <input type="text"></td>
		</tr>
		<tr>
			<td>문제집 리스트
				<table class="colList" id="list" onclick="select(selected2, selectedList2)">
					<tr>
						<th>문제번호</th>
						<th>문제순서</th>
						<th>배점</th>
						<th width="400px">제목</th>
						<th>분류</th>
						<th>난이도</th>
						<th>평점</th>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td><button onclick="add();">추가</button>
				<button onclick="del();">제거</button></td>
		</tr>
	</table>
	<table id="selectable" onclick="select(selected, selectedList)">
		<tr>
			<th>문제번호</th>
			<th></th>
			<th></th>
			<th width="300px">제목</th >
			<th>분류</th>
			<th>난이도</th>
			<th>평점</th>
		</tr>
		<c:forEach var="list" items="${list}">
			<tr>
				<td>${list.PRO_NUM}</td>
				<td></td>
				<td></td>
				<td>${list.PRO_NAME}</td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>