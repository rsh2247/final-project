package project.bumsik.payment_kakao.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public interface KakaoPayController {

	public void kakaoPayGet()  throws Exception;
	public String kakaoPay(String order_id) throws Exception;
	public String kakaoPaySuccess(String pg_token, Model model, HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public String kakaoPayCancel(String pg_token, Model model) throws Exception;
	public String kakaoPayFail(String pg_token, Model model) throws Exception;
	public Map<String, Object> changeToLowerMapKey(Map<String, Object> origin) throws Exception;

}
