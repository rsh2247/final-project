<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<meta charset="UTF-8">
<title>결제 메인 페이지</title>

<link href="<c:url value="/resources/css/payment.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/board.css" />" rel="stylesheet">
<script src="<c:url value="/resources/js/payment.js" />"></script>

</head>
<body>

<div id="container_wrap">
	<div class="contents">
		<h2 class="title">
			<img src="./resources/img/payment/tit_0102.gif" alt="수강신청"/> 
			<span>Home &gt; 강의상세보기 &gt; <em> 수강신청</em></span>
		</h2>
		<div class="payment_wrap">
			<br />
			<!-- 주문내역 -->
			<h2><img src="./resources/img/payment/tit_0101.gif" alt="주문내역"/></h2>
			<table class="board_list" id="lec_board_list">
				<colgroup>
					<col style="width:;" />
					<col style="width: 122px;" />
					<col style="width: 85px;" />
					<col style="width: 105px;" />
				</colgroup>
				<tbody>
					<tr>
						<th class="first">강의명</th>
						<th>강의분야</th>
						<th>강사아이디</th>
						<th class="last_date">금액</th>
					</tr>
					<tr>
						<td class="title">${lectlist[0].item_name}</td>
						<td>${lectlist[0].lecture_category}</td>
						<td>${lectlist[0].user_id}</td>
						<td>${lectlist[0].lecture_tuition} 원</td>
					</tr>
				</tbody>
			</table>
			<!-- // 주문내역 끝 -->
			<!-- 할인/결제금액 -->
			<div class="sale_pay" style="display: block">

				<dl>
					<dt>
						<ul>
							<li class="total_order">총 주문금액</li>
							<li class="sale_price">할인금액</li>
							<li class="total_price">총 결제금액</li>
						</ul>
					</dt>
					<dd>
						<ul>
							<li class="total_order" id="total_order_total">
								<em>${orderlist[0].order_price}</em>원
							</li>
							<li class="sale_price" id="sale_price_total">
								<em>0</em>원
							</li>
							<li class="total_price" id="total_price_total">
								<em>${orderlist[0].order_price}</em>원
							</li>
						</ul>
					</dd>
				</dl>
				<div class="total_order">
					<h3 style="text-align: left;">포인트</h3>
					<p class="point_coupon">
						<span>현재 보유포인트 : <em>${pointlist[0].point_rest}P</em></span>
					</p>

					<table class="board_list" id="lec_board_list2">
						<colgroup>
							<col style="" />
							<col style="width: 117px;" />
							<col style="width: 133px;" />
						</colgroup>
						<tr>
							<th class="first">강의명</th>
							<th colspan="2" class="p_last">포인트</th>
						</tr>
						<tr>
							<td class="title">
								${lectlist[0].item_name}</td>

					 			<td colspan="2" id="pt${orderlist[0].order_id}">
					 			<input type="text" class="dispt" name="dispt" id="dispt${orderlist[0].order_id}"
								onkeyPress="if ((event.keyCode<48) || (event.keyCode>57)) event.returnValue=false; "
								style="ime-mode: disabled;" onkeyup="point_check(${orderlist[0].order_id});" />
								<strong> P </strong><a href="javascript:point_apply(${orderlist[0].order_id});">
								<img src="./resources/img/button/apply.gif" alt="적용" /></a>
								</td>
						</tr>
					</table>

					<ul class="text" style="padding: 17px 0 24px 35px;">
						<li
							style="list-style-type: circle; text-align: left; 
									color: #939292; line-height: 16px; font-size: 11px;">
							포인트와 쿠폰 할인은 한 개의 강의에 동시에 사용하실 수 없습니다.</li>
						<li
							style="list-style-type: circle; text-align: left; 
									color: #939292; line-height: 16px; font-size: 11px;">
							구매시 사용한 쿠폰과 포인트는 결제 취소 후 재사용이 불가능합니다.</li>
					</ul>
				</div>
				<div class="total_price">
					<dl class="total_sale"> <!-- dl태그  용어설명목록(definition list)-->
						<dt>총 할인내역</dt> 	<!-- dt태그  용어의 제목(definition term)-->
						<dd>				<!-- dd태그  용어설명(definition description) 자동들여쓰기-->
							포인트<span id="ptsale">0 P</span>
						</dd>
						<dd>
							교재 마일리지<span id="book_ptsale">0 P</span>
						</dd>
						<dd>
							쿠폰/할인혜택<span id="cpsale">0 원</span>
						</dd>
					</dl>

					<dl class="benefit">
						<dt>구매 혜택</dt>
						<dd>예상 적립포인트</dd>
						<dd class="point">
							<span id="preusept">0 P</span>
						</dd>
					</dl>
				</div>
			</div>

			<!-- // 할인/결제금액 끝 -->
			<div class="order_info">

				<div class="orderWrap" style="margin-top: 20px">
					<div class="orderWay">
						<ul class="orderEtc">
							<li><span>※</span>등록여부는 금감원 홈페이지(www.fcsc.kr)에서 확인하실 수 있습니다.</li>
						</ul>
					</div>
				</div>
				<div class="orderWrap">
							<h2>결제수단</h2>
					<div class="orderWay">
						<div class="waySelect">
							<label><input type="radio" name="trademethod" value="point" /> 포인트 결제</label> 
							<label><input type="radio" name="trademethod" value="kakao" /> 카카오 결제</label>
						</div>
						<ul class="orderEtc">
							<li style="color: #ff0000;"><span>※</span>결제 시 주의 사항</li>
						</ul>
					</div>
				</div>
				<!-- // 결제수단 끝 -->

				<h3 class="title">
					최소 시스템 사양 및 필수 소프트웨어 [<a href="#;" class="check_btn">자세히 보기▼</a>]
				</h3>
				<div class="type_pay" id="detail_info" style="display: none;">
					<table class="board_list type_pay">
						<caption>결제 최소 사양 상세</caption>
						<colgroup>
							<col width="50%">
							<col width="50%">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">구분</th>
								<th scope="col">최소사양</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="first-child">컴퓨터 등 정보처리장치의 중앙처리장치 속도</td>
								<td>Celeron 2.4Ghz 이상</td>
							</tr>
							<tr>
								<td class="first-child">운영체제등 시스템 소프트웨어 사양</td>
								<td>Windows XP 이상</td>
							</tr>
							<tr>
								<td class="first-child">온라인컨텐츠 구동에 필수적인 소프트웨어</td>
								<td>DirectX 9.0 이상</td>
							</tr>
							<tr>
								<td class="first-child">램 용량</td>
								<td>256MB 이상</td>
							</tr>
							<tr>
								<td class="first-child">화소 등 구동화면 사양</td>
								<td>1024 X 768 트루컬러 16비트</td>
							</tr>
							<tr>
								<td class="first-child">기타 온라인컨텐츠 구동에 필수적인 하드웨어 장치</td>
								<td>GeForce MX440 AGP8 이상<br> (Intel:915G 칩셋,
									AMD:Xpress200시리즈 이상)
								</td>
							</tr>
							<tr>
								<td class="first-child">기술적보호조치에 관한 사항</td>
								<td>컨텐츠의 불법사용 및 유출방지-Windows Media DRM,Aqua Auth<br>
									컨텐츠의 녹화차단-Aqua Director 컨텐츠의 다운로드 DRM-NETSYNC DRM
								</td>
							</tr>
							<tr>
								<td class="first-child">인터넷 속도</td>
								<td>1Mbps 이상(2배속 시에는 2Mbps 이상)</td>
							</tr>
							<tr>
								<td class="first-child">웹브라우져</td>
								<td>Internet Explorer : 6.0 이상</td>
							</tr>
							<tr>
								<td class="first-child">미디어플레이어</td>
								<td>Windows Media Player : 9.0 이상</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<h3 class="title">취소/환불안내</h3>
				<p style="color: #cc0000;">
					<br />[미성년자 계약의 취소]<br /> 미성년자인 회원이 법정대리인의 동의없이 이용계약을 체결한 경우에 회원
					또는 그의 법정대리인은 계약을 취소할 수 있다.
				</p>
				<div class="type_pay">
					<table class="board_list type_pay">
						<colgroup>
							<col width="12%">
							<col width="20%">
							<col width="33%">
							<col width="*">
						</colgroup>
						<thead>
							<tr>
								<th scope="col" class="empty"></th>
								<th scope="col">구분</th>
								<th scope="col">기준</th>
								<th scope="col">환불액</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="rowgroup" rowspan="4" class="first-child">강좌환불</th>
								<td>전액환불</td>
								<td>결제일로부터 7일 이내에 2강 이하 수강했을 경우</td>
								<td>결제금액 100% 환불 가능</td>
							</tr>
							<tr>
								<td rowspan="2" class="first-child"
									style="border-left: 1px solid #cdcdcd">부분환불</td>
								<td>결제일로부터 7일 이내 3강 이상 수강했을 경우</td>
								<td>환불액 = 결제금액 - 학습수수료</td>
							</tr>
							<tr>
								<td>결제일로부터 7일 경과 후</td>
								<td>환불액 = 결제금액 - 학습수수료<br> - 위약금(결제금액의 10%)
								</td>
							</tr>
							<tr>
								<td colspan="3">
									※ 학습 수수료 공제 시 강의 플레이 시간이 아닌 강의를 클릭(오픈)한 기준으로 수강한 강의 수가 산정됩니다.
								</td>
							</tr>

						</tbody>
					</table>
				</div>
				
				<ul class="notice">
					<li>- 할인상품의 경우 학습수수료는 이미 이용한 강좌의 '할인 전 정가'를 기준으로 계산하여 공제합니다.</li>
					<li>- 모바일, 다운로드 서비스 및 기타 제공된 혜택상품을 사용하였을 경우 환불금액에서 공제됩니다.</li>
					<li>- 환불 절차 및 자세한 사항은 <a
						href=""
						target="_blank">[여기]</a>를 참고하시기 바랍니다
					</li>
				</ul>
				<p>
					<input type="checkbox" id="check_refund"> <label
						for="check_refund" class="color_red">환불 규정을 충분히 이해하였고, 이에
						동의합니다. (필수)</label>
				</p>

				<h3 class="title ">결제</h3>
				<div class="guideWrap">
					<div class="guideWay">
						<p>본 상품의 요금 결제 처리를 위하여 결제 관련 개인정보의 위탁 처리가 필요합니다. 개인정보 위탁에 대하여
							거부할 권리가 있으며, 거부 시 상품 구매에 제한을 받을 수 있습니다.</p>
						<ul class="guideEtc">
							<li>요금결제 관련<br /> - 위탁대상 : 카카오페이<br /> - 위탁내용 : 상품 또는 서비스의
								구매 및 요금 결제<br />
							</li>
						</ul>
					</div>
				</div>
				<p>
					<input type="checkbox" id="check_payment"> <label
						for="check_payment" class="color_red">결제 관련 개인정보 처리업무 위탁에
						대하여 동의합니다. (필수)</label>
				</p>

				<h3 class="title">상품 유의사항</h3>
				<span class="useguide_btn p_useguide_btn">상품 유의사항▼</span>

				<p>
					<input type="checkbox" id="check_useguide"> <label
						for="check_useguide" class="color_red">상기 이용안내 및 유의사항을 확인
						및 이해하였으며, 이에 동의합니다. (필수)</label>
				</p>
				<h3 class="title ">이용약관</h3>
				<p class="rep">
					- 선생님 강의 변동사항 발생 시 미리 공지해 드릴 예정이며, 그 경우 다른 선생님 강의로 변경 가능합니다.<br />
					- 제공되는 동영상 강의는 추후 변경될 수 있습니다<br />
					- 결제취소 및 상품 관련 기타 문의, 소비자피해보상의 처리, 재화 등에 대한 불만 처리 및
					    소비자와 사업자 사이의 분쟁 처리에 관한 사항은 고객센터(00-0000-0000)를 이용해 주세요.<br />
				</p>
				<p>
					<input type="checkbox" id="check_contents" value="agree"> <label
						for="check_contents">상기 내용을 확인 및 이해하였으며, 이에 동의합니다.</label>
				</p>

				<p class="btn" id="paybtn">
					<p class="btn" id="paybtn"><a href="javascript:trade_select(${orderlist[0].order_id});">
					<img src="./resources/img/button/pay.gif" alt="결제하기"/></a>
					<a href="javascript:history.go(-1);">
					<img src="./resources/img/button/cancel02.gif" alt="취소"/></a></p>
			</div>
		</div>
	</div>
</div>
</body>
</html>