package project.bumsik.payment_point.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.bumsik.payment_point.vo.PaymentPoint_VO;

public interface PaymentPoint_Controller {
	public List<Map<String, Object>> searchPoint(HttpServletRequest request, HttpServletResponse response) throws Exception;
	ResponseEntity insertPoint(String order_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity updatePoint(String p_id, int usepoint, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
}
