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
			var score = $('<input type="text" name="score'+i+'" class="scorebox"></input>')
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
		selectedList2.sort(function(a, b) {
			return (a.childNodes[3].childNodes[0].nodeValue
					- b.childNodes[3].childNodes[0].nodeValue)*order;
		})

	}

	function selectReset(selectedList) {
		for ( var i in selectedList) {
			selectedList[i].setAttribute("class", "");
		}
		selectedList = [];
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

.scorebox {
	width: 25px;
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
				<button onclick="del();">제거</button>
				<button onclick="up();">위</button>
				<button onclick="down();">아래</button></td>
		</tr>
	</table>
	<table id="selectable" onclick="select(selected, selectedList)">
		<tr>
			<th>문제번호</th>
			<th></th>
			<th></th>
			<th width="300px">제목</th>
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
	<form action="">
	<input type="submit" value="확인">
	</form>
</body>
</html>