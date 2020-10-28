package project.bumsik.payment_kakao.controller;


import project.bumsik.payment_kakao.service.KakaoPay;
import project.bumsik.payment_kakao.vo.AmountVO;
import project.bumsik.payment_kakao.vo.KakaoPayApprovalVO;
import project.bumsik.payment_main.controller.PaymentMain_Controller;
import project.bumsik.payment_main.service.PaymentMain_Service;
import project.bumsik.payment_point.controller.PaymentPoint_Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
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
	@Autowired
	private PaymentMain_Controller paymentMain_Controller;
	@Autowired
	private PaymentPoint_Controller paymentPoint_Controller;
	
	@GetMapping("/kakaoPay")
    public void kakaoPayGet() {
        System.out.println("get");
    }
	
	String order_price, discount_point, lecture_name, user_id, order_ids, total_price, b_order_id;
	Integer discount_point_int;
	
    @PostMapping("/kakaoPay")
    public String kakaoPay(@RequestParam("order_id") String order_id) {
        System.out.println("post : ready");
        System.out.println("order_id : "+order_id);
        
    	//등록된 주문정보 에서 데이터 조회
		Map<String, Object> orderMap = new HashMap<String,Object>();
		orderMap.put("order_id", order_id);
		b_order_id = order_id;					//주문번호 보존
		
		//강의명추가(조인) searchOrderInfo2
    	List<Map<String, Object>> orderlist = paymentMain_Service.searchOrderInfo2(orderMap);
    	discount_point = (String) orderlist.get(0).get("discount_point");
    	order_price = (String) orderlist.get(0).get("order_price");  	
    	total_price = (String)orderlist.get(0).get("total_price");
    	
        return "redirect:" + kakaopay.kakaoPayReady(orderlist);
    }
    
    @GetMapping("**/kakaoPaySuccess")
    public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model, HttpServletRequest request, HttpServletResponse response) {
        //log.info("kakaoPaySuccess get...pg_token : " + pg_token);
    	System.out.println("Success");
    	KakaoPayApprovalVO info = kakaopay.kakaoPayInfo(pg_token);
    	
    	info.setDiscount(discount_point);
    	info.setOrder_price(order_price);
    	info.setPay_amount(total_price);    	
    	info.setPayment_method_type("kakao");
    	model.addAttribute("info", info);
    	
    	//결제 완료. point와 pay 테이블 insert
    	String order_id = info.getPartner_order_id();
    	String type = info.getPayment_method_type();
    	
    	try {
			paymentPoint_Controller.insertPoint(order_id, request, response);
			paymentMain_Controller.paymentSuccess(order_id, type, request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
    
    	System.out.println("model: "+model);
    	return "payment/paymentSuccess.tiles";
    }
    
    @GetMapping("**/kakaoPayCancel")
    public String kakaoPayCancel(@RequestParam("pg_token") String pg_token, Model model) {
        //log.info("kakaoPaySuccess get...pg_token : " + pg_token);
    	System.out.println("Cancel");
    	return "payment/paymentMain.tiles";
    }
    
    @GetMapping("**/kakaoPayFail")
    public String kakaoPayFail(@RequestParam("pg_token") String pg_token, Model model) {
        //log.info("kakaoPaySuccess get...pg_token : " + pg_token);
    	System.out.println("Fail");
    	return "payment/paymentMain.tiles";
    }

}