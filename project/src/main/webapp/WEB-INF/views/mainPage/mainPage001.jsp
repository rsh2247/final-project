<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
ul, li {
	list-style: none;
}

#slide {
	height: 500px;
	position: relative;
	overflow: hidden;
}

#slide ul {
	width: 400%;
	height: 100%;
	transition: 1s;
}

#slide ul:after {
	content: "";
	display: block;
	clear: both;
}

#slide li {
	float: left;
	width: 25%;
	height: 100%;
}

#slide li:nth-child(1) {
	background: #faa;
}

#slide li:nth-child(2) {
	background: #ffa;
}

#slide li:nth-child(3) {
	background: #faF;
}

#slide li:nth-child(4) {
	background: #aaf;
}

#slide input {
	display: none;
}

#slide label {
	display: inline-block;
	vertical-align: middle;
	width: 10px;
	height: 10px;
	border: 2px solid #666;
	background: #fff;
	transition: 0.3s;
	border-radius: 50%;
	cursor: pointer;
}

#slide .pos {
	text-align: center;
	position: absolute;
	bottom: 10px;
	left: 0;
	width: 100%;
	text-align: center;
}

#pos1:checked ~ul {
	margin-left: 0%;
}

#pos2:checked ~ul {
	margin-left: -100%;
}

#pos3:checked ~ul {
	margin-left: -200%;
}

#pos4:checked ~ul {
	margin-left: -300%;
}

#pos1:checked ~.pos>label:nth-child(1) {
	background: #666;
}

#pos2:checked ~.pos>label:nth-child(2) {
	background: #666;
}

#pos3:checked ~.pos>label:nth-child(3) {
	background: #666;
}

#pos4:checked ~.pos>label:nth-child(4) {
	background: #666;
}
</style>
<body>
	<div id="slide">
		<input type="radio" name="pos" id="pos1" checked> 
		<input type="radio" name="pos" id="pos2"> 
		<input type="radio" name="pos" id="pos3"> 
		<input type="radio" name="pos" id="pos4">
		<ul>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
		<p class="pos">
			<label for="pos1"></label> 
			<label for="pos2"></label> 
			<label for="pos3"></label> 
			<label for="pos4"></label>
		</p>
	</div>
</body>
</html>