package project.bumsik.payment_main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.bumsik.payment_main.service.PaymentMain_Service;
import project.bumsik.payment_main.vo.Lecture_VO;
import project.bumsik.payment_point.controller.PaymentPoint_ControllerImpl;

@Controller("paymentMain_Controller")
public class PaymentMain_ControllerImpl implements PaymentMain_Controller{
	private static final Logger logger = LoggerFactory.getLogger(PaymentPoint_ControllerImpl.class);
	
	@Autowired
	private PaymentMain_Service paymentMain_Service;
	@Autowired
	private Lecture_VO lecture_VO;
	
	@Override
	@RequestMapping(value="/order_amount", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView order_amount(@RequestParam(value="l_id",required = false) String l_id,HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("order_amount 진입");
		Map<String, Object> searchMap = new HashMap<String,Object>();
		l_id = "a01";
		searchMap.put("l_id", l_id);
		
		List<Map<String, Object>> list = paymentMain_Service.order_amount(searchMap);
		
		//ModelAndView mav = new ModelAndView("/payment/pointPay.do");
		ModelAndView mav = new ModelAndView("payment/paymentMain2.tiles");
		mav.addObject("orderlist",list);
		System.out.println("order_amount : "+mav);

		 
		return mav;
	}
}
