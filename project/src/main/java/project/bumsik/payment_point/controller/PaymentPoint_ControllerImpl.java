package project.bumsik.payment_point.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.bumsik.payment_point.service.PaymentPoint_Service;
import project.bumsik.payment_point.service.PaymentPoint_ServiceImpl;
import project.bumsik.payment_point.vo.PaymentPoint_VO;

@Controller("payPointController")
public class PaymentPoint_ControllerImpl implements PaymentPoint_Controller{
	private static final Logger logger = LoggerFactory.getLogger(PaymentPoint_ControllerImpl.class);
	
	@Autowired
	private PaymentPoint_Service paymentPoint_Service;
	@Autowired
	private PaymentPoint_VO paymentPoint_VO;
	
	
	
	@Override
	@ResponseBody
	@RequestMapping(value="/pointPays", method = { RequestMethod.GET, RequestMethod.POST })
	public List<PaymentPoint_VO> searchPoint(@RequestParam(value="p_id", required=false) String p_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("pointPays 진입");
		Map<String, Object> searchMap = new HashMap<String,Object>();
		searchMap.put("p_id", p_id);
		List<PaymentPoint_VO> list = paymentPoint_Service.searchList(searchMap);
		/*
		 * ModelAndView mav = new ModelAndView("/payment/pointPay.do");
		 * mav.addObject("searchList",list);
		 */
		
		return list;
	}
}
