package project.bumsik.payment_main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface PaymentMain_Controller {

	public ModelAndView order_amount(String l_id, HttpServletRequest request, HttpServletResponse response) throws Exception;

}
