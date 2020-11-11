
function getContextPath() {
	var hostIndex = location.href.indexOf(location.host) + location.host.length;
	return location.href.substring(hostIndex,location.href.indexOf('/', hostIndex + 1));
};

$(function () {

    $(".check_btn").click(function(){
        if ($("#detail_info").is(":hidden")) {
            $("#detail_info").slideDown("slow");
        }else {
            $("#detail_info").hide("slow");
        }
    });
});

//매개변수 no 주문번호, tp = total_price
var point_check = function (no) {

    var pt = new Array();
    var ptcnt = $("input[name=dispt]").size();
    var total_pt = 0;		//입력받을 포인트
    var usepoint='';   		//가지고 있는 포인트

	$.ajax({
     	url: getContextPath()+"/searchPoint",
        type: "post",
        async: false,							//default : true, true일때 usepoint가 ''으로 유지됨
        success: function(data, textStatus){
			list = data;
			usepoint = list[0].point_rest;
        },
        error: function(data, textStatus){
            alert("error");
        },
        complete:function(data, textSatus){  				
        }
    }); 
    
    for (i = 0; i < ptcnt; i++) {
        pt[i] = $("input[name=dispt]").eq(i).val();
        if (!pt[i]) pt[i] = 0;
        total_pt += parseInt(pt[i], 10);
    }

    var usedpoint = $("#ptsale").html().replace(' P', '').replace(/,/g, '');	//총 할인 내역에 적용된 point
    var targe_point = $('#dispt' + no).val();    								//입력 받은 포인트    

    //입력 받은 포인트 > 보유 포인트 || 적용한 포인트 + 입력받은 포인트 > 보유포인트
    if (total_pt > usepoint || parseInt(usedpoint) + parseInt(targe_point) > usepoint) {
        alert('보유포인트를 초과하였습니다.');
        $('#dispt' + no).val('');
        console.log(no);
    }
}

//point 조회와 적용
var total_price;	//포인트 적용 후 받아올 total_price
var point_apply = function (no) {

	/*tp 입력포인트*/
    var tp = $('#dispt' + no).val();
    
    /*최소 사용 point 설정*/
    if (tp < 100) {
        alert('100포인트 이상 사용 가능합니다.');
        return;
    }
    
    /*포인트 적용 사항 변경  적용 */ 
    $.ajax({
    	url: getContextPath()+"/orderinfo",
        type: "POST",
        dataType: "json",
        data: {no: no, tp: tp},
        success: function (data) {
            if (data[0].point_over == '0') {
                alert('강의가격보다 포인트 사용금액이 큽니다. 다시 확인해주세요.');
                location.reload();
            } else {
            	console.log(data[1].dis);
				console.log("dp : "+data[0].discount_point)
				console.log("tp : "+data[0].total_price)
                $("#sale_price_total em").text(data[0].discount_point);    	// 할인 금액, discount_point
                $("#total_price_total em").text(data[0].total_price);   	// 할인 적용된 total_price
                $("#ptsale").text(data[0].discount_point);               	// 총할인내역-point  
                $("#pt" + no).html(data[1].dis);   							// point 입력 table(td)
                
                total_price = data[0].total_price;
            }
        },
        error: function(data){
            alert("error");
        },
        complete:function(data){  				
        }
    });
    
}

/*할인 취소, no = 주문번호*/
var discount_cancel = function (no, type) {
    $.ajax({
        url: getContextPath()+"/discount_cancel",
        type: "POST",
        dataType: "json",
        data: {type: type, no: no},
        success: function (data) {
        	console.log(data[1].dis);
            $("#sale_price_total em").text(data[0].discount_point);    	// 할인 금액, discount_point
            $("#total_price_total em").text(data[0].total_price);   	// 할인 적용된 total_price
            $("#ptsale").text(data[0].discount_point+" P");               	// 총할인내역-point  
            $("#pt" + no).html(data[1].dis);   							// point 입력 table(td)
            total_price = data[0].total_price;
        }
    });
}


// 약관, 결제 방법등 체크박스 선택
var trade_select = function (no) {
    var paynote_chk = $("#paynote_chk").val();

    if(!$("#check_refund").is(':checked') || !$("#check_payment").is(':checked') 
		|| (!$("#check_useguide").is(':checked') && paynote_chk) 
		|| !$("#check_contents").is(':checked')){
        alert("위 내용을 확인하셨을 경우 체크박스를 클릭해 주세요.");
        $("#check_contents").focus();
        return;
    }     
    var send = new Array();
    var method = $("input[name=trademethod]:checked").val();
    // 결제 방법이 선택되지 않았을 때
    if (!method) {
        alert('결제방법을 선택해주세요.');
        $("input[name=trademethod]").eq(0).focus();
        return;
    }
    payment(no);	//체크 다 됬으면 주문번호(no) 전송하여 결재
}

// 결제하기, no = 주문번호
var payment = function(no){
	//method : 결제 방식(point,kakao)
	var method = $("input[name=trademethod]:checked").val();

    if(!$("#check_contents").is(':checked')){
        alert("위 내용을 확인하셨을 경우 체크박스를 클릭해 주세요.");
        $("#check_contents").focus();
        return;
    }
	
    if(confirm('입력하신 결제 정보로 주문을 하시겠습니까?')){
        if(method == 'kakao'){
        	if(total_price==0){
        		alert('총 결제 금액이 0원 입니다. 포인트 결제를 선택해 주세요.');	
        		$("input[name=trademethod]").attr("checked",false)	//포인트로 전액 결제시 결제 방식을 kakao로 선택했을 때
                $("input[name=trademethod]").eq(0).focus();			//결제 방식 선택 쪽으로 이동~
        		if(method == 'point') {								//포인트가 선택 됬다면 팝업 띄우고 주문번호와 action 전송
        			postPopUp(no,"/insertPoint");
        		}
        	}else{
        		postPopUp(no,"/kakaoPay");        		
        	}

        }else if(method == 'point'){
        	if(total_price!=0){				
        		alert('총 결제 금액이 남았습니다. 다른 결제 방법 선택해 주세요.');
        		$("input[name=trademethod]").attr("checked",false)	//포인트 적용후 결제금액이 남았을 떄
                $("input[name=trademethod]").eq(0).focus();			//결제 방식 선택 쪽으로 이동~
        		if(method == 'kakao') postPopUp(no,"/kakaoPay");	//kakao가 선택 됬다면 팝업 띄우고 주문번호와 action 전송

        	}else if(total_price == 0){
        		postPopUp(no,"/insertPoint");	//포인트로 전액 결제
        	/*	var url=getContextPath()+"/mainPage/mainPage001.do";	//결제 완료후 페이지 이동
        		location.replace(url);*/
        	}
        }
    }
}

//결제창 popUp, no = 주문번호
function postPopUp(no, action) {
	var option = "width = 500, height = 500, top = 100, left = 100, location = yes";
	
	var form = document.createElement("form");	//form을 생성해서 action 수행
	form.setAttribute("method","post");
	form.setAttribute("action",getContextPath()+action);
	document.body.appendChild(form);
	
	/*value로 주문번호 전송*/
	var insert = document.createElement("input");
	insert.setAttribute("type","hidden");
	insert.setAttribute("name","order_id");
	insert.setAttribute("value",no);
	form.appendChild(insert);
	
	window.open('','new_popup', option);		//popUp 띄움
	form.setAttribute("target",'new_popup');
	
	form.submit();
	
	
}

// ie version check
var ie_version_chk = function() {

    var word;
    var version = "N/A";

    var agent = navigator.userAgent.toLowerCase();
    var name = navigator.appName;

    // IE old version ( IE 10 or Lower )
    if ( name == "Microsoft Internet Explorer" ) {
        word = "msie ";
    }else {
        return false;
    }

    var reg = new RegExp( word + "([0-9]{1,})" );
    if ( reg.exec( agent ) != null ) {
        version = RegExp.$1 + RegExp.$2;
    }

    if(version < 10) {
        return true;
    }else{
        return false;
    }
}