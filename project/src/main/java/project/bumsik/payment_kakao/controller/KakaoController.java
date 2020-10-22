package project.bumsik.payment_kakao.controller;


import project.bumsik.payment_kakao.service.KakaoPay;
import project.bumsik.payment_kakao.vo.KakaoPayApprovalVO;
import project.bumsik.payment_main.service.PaymentMain_Service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

 
@Controller
public class KakaoController {
    
	@Autowired
    private KakaoPay kakaopay;
	public void setKakaopay(KakaoPay kakaopay) {
		this.kakaopay = kakaopay;
	}
	@Autowired
	private PaymentMain_Service paymentMain_Service;
	
	
	
	@GetMapping("/kakaoPay")
    public void kakaoPayGet() {
        System.out.println("get");
    }
	
	String order_price, discount_point, lecture_name, user_id, order_ids, total_price, b_order_id;
	
    @PostMapping("/kakaoPay")
    public String kakaoPay(@RequestParam("order_id") String order_id) {
        System.out.println("post : ready");
        System.out.println("order_id : "+order_id);
        
    	//등록된 주문정보 에서 데이터 조회
		Map<String, Object> orderMap = new HashMap<String,Object>();
		orderMap.put("trade_key", order_id);
		b_order_id = order_id;					//주문번호 보존
		
		//강의명추가(조인) searchOrderInfo2
    	List<Map<String, Object>> orderlist = paymentMain_Service.searchOrderInfo2(orderMap);
    	
    	total_price = (String)orderlist.get(0).get("total_price");
    	discount_point = (String) orderlist.get(0).get("discount_point");
    	lecture_name = (String) orderlist.get(0).get("LECTURE_NAME");
    	user_id = (String) orderlist.get(0).get("user_id");
    	
    	
    	
        return "redirect:" + kakaopay.kakaoPayReady(orderlist);
    }
    
    @GetMapping("**/kakaoPaySuccess")
    public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
        //log.info("kakaoPaySuccess get............................................");
        //log.info("kakaoPaySuccess pg_token : " + pg_token);
    	model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token));
    	
    	System.out.println("Success");
    	//결제 완료 되었으니 point와 pay 테이블 insert
    	
    	
    	
    	
    	KakaoPayApprovalVO info = kakaopay.kakaoPayInfo(pg_token);
    	System.out.println("model: "+model);
    	return "payment/kakaoPaySuccess.tiles";
    }
    
    @GetMapping("**/kakaoPayCancel")
    public String kakaoPayCancel(@RequestParam("pg_token") String pg_token, Model model) {
        //log.info("kakaoPaySuccess get............................................");
        //log.info("kakaoPaySuccess pg_token : " + pg_token);
    	System.out.println("Cancel");
    	return "payment/paymentMain.tiles";
    }
    
    @GetMapping("**/kakaoPayFail")
    public String kakaoPayFail(@RequestParam("pg_token") String pg_token, Model model) {
        //log.info("kakaoPaySuccess get............................................");
        //log.info("kakaoPaySuccess pg_token : " + pg_token);
    	System.out.println("Fail");
    	return "payment/paymentMain.tiles";
    }
    
    /*
  
    public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
        //log.info("kakaoPaySuccess get............................................");
        //log.info("kakaoPaySuccess pg_token : " + pg_token);
    	System.out.println("Success");
    	model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token));
        return "kakaoPaySuccess.do";
    }
    */
}