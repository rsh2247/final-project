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
    $(document).ready(
	    function() {
		$('.btnlink').click(
			function() {
			    location.href = getContextPath() + '/cafe/'
				    + $(this).val();
			})

		function getContextPath() {
		    var hostIndex = location.href.indexOf(location.host)
			    + location.host.length;
		    return location.href.substring(hostIndex, location.href
			    .indexOf('/', hostIndex + 1));
		}
		;
	    })
</script>
<style type="text/css">
* {
	
}
.btn:nth-child(1) {
	font-weight: bold;
	color: #3E60DB;
	border-bottom: 2.5px solid #3E60DB;
}
.previewImg {
	width: 70px;
	height: 70px;
	border-radius: 50px;
}

.titlebar {
	width: 100%;
}
.displaybox{
	display: inline-block;
	margin: 0 15px 0 15px;
}
.titlebox{
	display: inline-block;
	position: absolute;
	height: inherit;
}


.eachlist {
	margin: 20px 0 20px 0;
	text-align: left;
}

#ullist li {
	border-bottom: 1px solid #eee;
}
.cafeinfo{
	display: inline-block;
	color: #555;
	font-size: small;
	font-family: Inter, "Noto Sans KR", "Noto Sans JP", "Malgun Gothic", "맑은 고딕", sans-serif;
}
.btnlink {
	background-color: transparent;
	border: none;
	font-size: larger;
	font-family: Inter, "Noto Sans KR", "Noto Sans JP", "Malgun Gothic", "맑은 고딕", sans-serif;
	cursor: pointer;
}

.btnlink:hover {
	text-decoration: underline;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
    $(document).ready(
	    function() {
		var list = 1;
		$('.btnlink1').click(function() {
		    var num = $(this).val();
		    $('#previewLayer').css('display', 'block');
		    $.ajax({
			type : "post",
			url : "ajaxGroupSelect.pro",
			async : false,
			data : "group_num=" + num,
			success : function(data, textStatus) {
			    list = data;
			    $('#groupNum').val(data.GROUP_NUM);
			    $('#groupLeader').text(data.GROUP_LEADER);
			    $('#groupDate').text(data.GROUP_DATE)
			    $('#groupName').text(data.GROUP_NAME);
			},
			error : function(data, textSatus) {
			    alert("에러가 발생");
			},
			complete : function(data, textSatus) {
			}
		    });
		});

		$('#previewLayer').click(function(event) {
		    if (event.target == this) {
			$(this).css('display', 'none');
		    }
		})

		$('#btn').click(
			function() {
			    location.href = getContextPath() + '/cafe/'
				    + list.GROUP_NUM;
			})

		function getContextPath() {
		    var hostIndex = location.href.indexOf(location.host)
			    + location.host.length;
		    return location.href.substring(hostIndex, location.href
			    .indexOf('/', hostIndex + 1));
		}
		;

	    })
</script>
</head>
<body>
	<jsp:include page="groupPreview.jsp" />
	<div id="contentbox">
		<jsp:include page="groupIndex.jsp" />
		<ul id="ullist">
			<c:forEach var="list" items="${list}">
				<li><div class="eachlist">
						<div class="titlebar">
							<div class="displaybox">
								<img class="previewImg" alt="" src="${contextPath}/resources/image/${list.GROUP_ICON}">
							</div>
							<div class="titlebox"><button class="btnlink" value="${list.GROUP_NUM}">${list.GROUP_NAME}</button></div>
							<div style="display: inline-block; position: absolute; margin-top: 30px;"><p class="cafeinfo">매니저 : ${list.GROUP_LEADER} 멤버 수 : ${list.MEMBER_COUNT}</p></div>
							<div style="display: inline-block;"><p class="cafeinfo">Since ${list.GROUP_DATE}</p></div>
						</div>
					</div></li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>