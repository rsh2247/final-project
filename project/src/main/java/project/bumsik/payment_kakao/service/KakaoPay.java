package project.bumsik.payment_kakao.service;

import java.math.BigDecimal;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import project.bumsik.payment_kakao.vo.AmountVO;
import project.bumsik.payment_kakao.vo.KakaoPayApprovalVO;

import project.bumsik.payment_kakao.vo.KakaoPayReadyVO;
import project.bumsik.payment_main.service.PaymentMain_Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import project.bumsik.payment_main.service.PaymentMain_Service;
 
@Service
public class KakaoPay {
 
    private static final String HOST = "https://kapi.kakao.com";
    @Autowired PaymentMain_Service paymentMain_Service;
    
    private KakaoPayReadyVO kakaoPayReadyVO;  //응답을 받을 객체
    private KakaoPayApprovalVO kakaoPayApprovalVO;
	
	String order_id;
    public String kakaoPayReady(Map<String, Object> orderMap) {
    	//가맹점 코드 CID / 결제 한 건 코드 TID / 결제,취소에 대한 고유번호 AID
    	System.out.println("kakaoPay Ready, orderMap : "+orderMap);
    	order_id = (String)orderMap.get("pay_id");
    	String tax_free_amount = String.valueOf(Math.round(Integer.parseInt((String)orderMap.get("pay_amount"))*1));
    	
        RestTemplate restTemplate = new RestTemplate();
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "d1a9c84180a072e7ac333439156c58ce");  //발급받은 admin_key
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);  //연결 방식
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");  //테스트용, 실제 발급받은 cid
        params.add("partner_order_id", order_id);	//가맹점 주문번호, tid와 연결하고 대시작업시 사용
        params.add("partner_user_id", (String) orderMap.get("user_id"));//가맹점에서 사용자 구분할 id
        params.add("item_name", (String) orderMap.get("lecture_name"));	//상품 이름
        params.add("quantity", "1");         							//상품 수량
        params.add("total_amount", (String)orderMap.get("pay_amount"));	//상품 총액
        params.add("tax_free_amount", tax_free_amount);//면세
        params.add("approval_url", "http://localhost:8090/devFw/payment/kakaoPaySuccess"); //성공, 실제 호출 url
        params.add("cancel_url", "http://localhost:8090/devFw/payment/kakaoPayCancel");    //취소
        params.add("fail_url", "http://localhost:8090/devFw/payment/kakaoPayFail"); //실패
        System.out.println("add complete");
        System.out.println("params : "+params);
        
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
         //헤더와 바디를 붙인다.
        try {
            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
            //postForObject - POST요청을 보내는 결과를 받는다.
            //RestTemplate을 이용해 카카오페이에 데이터를 보내는 방법이다.
            //post방식으로 HOST + "/v1/payment/ready"에 body(header+body)정보를 보낸다.
            //log.info("" + kakaoPayReadyVO);
            System.out.println(kakaoPayReadyVO.getNext_redirect_pc_url());
            return kakaoPayReadyVO.getNext_redirect_pc_url();
            //마지막 return 값으로 redirect url을 불러와 결제가 완료되면 해당 주소로 가게끔 설정해 놓는다.
 
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return "/pay";
        
    }

	public KakaoPayApprovalVO kakaoPayInfo(String pg_token) {
		System.out.println("kakaoInfo");
    	Map<String, Object> orderMap = new HashMap<String,Object>();
    	orderMap.put("order_id", order_id);
    	orderMap = paymentMain_Service.searchOrderlecName(orderMap);
    	orderMap = changeToLowerMapKey(orderMap);
		
        RestTemplate restTemplate = new RestTemplate();
 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "d1a9c84180a072e7ac333439156c58ce");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
 
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayReadyVO.getTid());
        params.add("partner_order_id", (String)orderMap.get("pay_id"));
        params.add("partner_user_id", (String) orderMap.get("user_id"));
        params.add("pg_token", pg_token);
        params.add("total_amount", (String)orderMap.get("pay_amount"));
//        params.add("discount_amount", discount_point);
        params.add("payload","http://localhost:8090/devFw/mainPage/mainPage001.do");
        System.out.println("kakaopayInfo pg_token : "+ pg_token); 
        
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        System.out.println(body);
        try {
            kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
            System.out.println(kakaoPayApprovalVO.toString());   
            return kakaoPayApprovalVO;
        
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }
    
	//소문자로
	public Map<String, Object> changeToLowerMapKey(Map<String, Object> origin){
		   Map<String, Object> temp = new HashMap<String, Object>();  
		   Set<String> set = origin.keySet();
		   Iterator<String> e = set.iterator();

		   while(e.hasNext()){
		     String key = e.next();
		     Object value = (Object) origin.get(key);
		     temp.put(key.toLowerCase(), value);
		   }
		  origin = null;
		  return temp;
	}
}
    
    

 