<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#previewLayer{
	width: 100%;
	height: 100%;
	background-color: rgb(0,0,0,25%);
	position: fixed;
	z-index: 1;
	top: 0px;
}
#previewBox {
	width: 800px;
	height: 600px;
	background-color: #eee;
	position: relative;
	margin: 200px auto;
	z-index: 1;
}
</style>
</head>
<body>
	<div id="previewLayer">
		<div id="previewBox">
			<ul>
				<li style="border:">그룹 이름</li>
			</ul>
		</div>
	</div>
</body>
</html>