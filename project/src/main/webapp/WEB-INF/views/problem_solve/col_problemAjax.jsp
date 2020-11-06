<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="ajax">
		<ul class="list">
			<c:forEach var="list" items="${list}">
				<c:if test="${list.COL_LIST_NUM >= page.startNum &&  list.COL_LIST_NUM <= page.endNum}">
					<li>
						<div style="padding: 15px 0 15px 0; border-bottom: 1px solid #ccc;">
							<div style="float: left; margin-right: 10px;">${list.COL_LIST_NUM}.</div>
							<div class="pro_content">${list.PRO_CONTENT}</div>
							<div style="margin-left: 20px;">
								<ul class="list">
									<c:forEach var="ordList" items="${list.ordList}">
										<li style="padding-bottom: 3px;"><label style="cursor: pointer;" for="${list.PRO_NUM}-${ordList.cho_num}"><div class="proNum">(${ordList.cho_num})</div>${ordList.cho_content}</label></li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</li>
				</c:if>
			</c:forEach>
		</ul>
		<input type="hidden" id="col_num" name="col_num" value="${result.col_num}"> 
		<input type="hidden" id="nextNum" value="${page.nowPage}"> 
		<input type="hidden" id="prevNum" value="${page.nowPage-1}">
		<div id="navibar">
			<c:if test="${page.nowPage != 1}">
				<button class="arrow" onclick="arrow(-1)" style="background-image: url('${contextPath}/resources/image/left.png');"></button>
			</c:if>
			<c:if test="${page.nowPage != page.listNum}">
				<button class="arrow" onclick="arrow(1)" style="background-image: url('${contextPath}/resources/image/right.png');"></button>
			</c:if>
		</div>
	</div>
</body>
</html>