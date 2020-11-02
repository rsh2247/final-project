package project.bumsik.payment_kakao.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public interface KakaoPayController {

	public void kakaoPayGet();
	public String kakaoPay(String order_id);
	public String kakaoPaySuccess(String pg_token, Model model, HttpServletRequest request, HttpServletResponse response);
	public String kakaoPayCancel(String pg_token, Model model);
	public String kakaoPayFail(String pg_token, Model model);

}
