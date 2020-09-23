<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.pro_table {
	border-collapse: collapse;
}

.pro_table td {
	border: 1px solid #aaa;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous">
	
</script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var tagId;
						var choiceNum;
						$('#select').on('change', function() {
							temp = document.getElementById('select').value;
							choiceNum = temp.split('/')[2];
							choiceNum *= 1;
							makeExample();
						})

						function makeExample() {
							$('#example').empty();
							$('#answer').empty();
							for (var i = 0; i < choiceNum; i++) {
								var option = $('<td id="' + 'choice' + (i + 1)
										+ '"><input type="text"> </td>')
								$('#example').append(option);
							}
							if (choiceNum > 1) {
								var answer = $('<td><select id=selectNum name="answer"></select></td>');
								$('#answer').append(answer);
								for (var i = 0; i < choiceNum; i++) {
									var choices = $('<option value="' + (i + 1)
											+ '">' + (i + 1) + '</option>');
									$('#selectNum').append(choices);
								}
							} else {
								var answer = $('<td><input type="text" name="answer"></td>');
								$('#answer').append(answer);
							}
						}

					})
</script>
</head>
<body>
	<form action="makePro002.pro" method="post">
		<table class="pro_table">
			<tr>
				<th colspan="5">${categoryName}</th>
			</tr>
			<tr>
				<td colspan="5">문제제목<input type="text" name="name"></td>
			</tr>
			<tr>
				<td colspan="5">문제분류 <select id="select" name="tag">
						<c:forEach var="list" items="${list}">
							<option value="${list.TAG_ID}/${list.TAG_NAME}/${list.TAG_ISCHOICE}">${list.TAG_NAME}</option>
						</c:forEach>
				</select>
				</td>
			</tr>
			<tr>
				<td colspan="5"><textarea name="content" ></textarea></td>
			</tr>
			<tr id="example">
			</tr>
			<tr id="answer">
			</tr>
			<tr>
				<td colspan="5"><input type="text" name="comment"></td>
			</tr>
			<tr>
				<td colspan="5">
				<input type="hidden" value="${categoryId}" name="categoryId">
				<input type="hidden" value="${categoryName}" name="categoryName">
				<input type="submit" value="확인"></td>
			</tr>
		</table>
	</form>
</body>
</html>