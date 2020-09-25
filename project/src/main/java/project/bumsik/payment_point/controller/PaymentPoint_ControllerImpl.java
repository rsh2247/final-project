package project.bumsik.payment_point.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import project.bumsik.payment_point.service.PaymentPoint_Service;
import project.bumsik.payment_point.service.PaymentPoint_ServiceImpl;
import project.bumsik.payment_point.vo.PaymentPoint_VO;

@Controller
public class PaymentPoint_ControllerImpl implements PaymentPoint_Controller{
	private static final Logger logger = LoggerFactory.getLogger(PaymentPoint_ControllerImpl.class);
	
	@Override
	@RequestMapping(value="/payment_point", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchList(String p_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
}
