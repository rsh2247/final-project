package project.bumsik.payment_point.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.bumsik.payment_point.vo.PaymentPoint_VO;

public interface PaymentPoint_Controller {
	public List<PaymentPoint_VO> searchPoint(@RequestParam(value="p_id", required=false) String p_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
