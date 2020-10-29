package project.bumsik.payment_main.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface PaymentMain_Controller {

	public ModelAndView order_amount(String l_id, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public List<Map<String, Object>> orderinfo(@RequestParam(value="no",required = false) String no,@RequestParam(value="tp",required = false) int tp,HttpServletRequest request, HttpServletResponse response) throws Exception;

	public List<Map<String, Object>> discount_cancel(String no, String dc, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView paymentSuccess(String order_id, String type, HttpServletRequest request, HttpServletResponse response)
			throws Exception;
	
}
