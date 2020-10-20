package project.bumsik.payment_kakao.controller;


import project.bumsik.payment_kakao.service.KakaoPay;
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
	
	@GetMapping("/kakaoPay")
    public void kakaoPayGet() {
        System.out.println("get");
    }
     
    @PostMapping("/kakaoPay")
    public String kakaoPay(@RequestParam("order_id") String order_id) {
        //log.info("kakaoPay post............................................");
        System.out.println("post : ready");
        System.out.println("order_id : "+order_id);
        return "redirect:" + kakaopay.kakaoPayReady(order_id);
    }
    
    @GetMapping("**/kakaoPaySuccess")
    public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
        //log.info("kakaoPaySuccess get............................................");
        //log.info("kakaoPaySuccess pg_token : " + pg_token);
    	System.out.println("Success");
    	model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token));
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