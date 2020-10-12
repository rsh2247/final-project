package project.bumsik.payment_point.controller;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.bumsik.payment_main.vo.Lecture_VO;
import project.bumsik.payment_point.service.PaymentPoint_Service;
import project.bumsik.payment_point.vo.PaymentPoint_VO;

@Controller("payPointController")
public class PaymentPoint_ControllerImpl implements PaymentPoint_Controller{
	private static final Logger logger = LoggerFactory.getLogger(PaymentPoint_ControllerImpl.class);
	
	@Autowired
	private PaymentPoint_Service paymentPoint_Service;
	@Autowired
	private PaymentPoint_VO paymentPoint_VO;
	
	@Override
	@RequestMapping(value="/searchPoint", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public List<Map<String, Object>> searchPoint(@RequestParam(value="p_id",required = false) String p_id,HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("searchPoint진입");
		Map<String, Object> searchMap = new HashMap<String,Object>();
		searchMap.put("p_id", p_id);
		System.out.println("search searchMap : "+searchMap);
		
		List<Map<String, Object>> list = paymentPoint_Service.searchList(searchMap);
		System.out.println("list : "+list);
		
		return list;
	}

	@Override
	@RequestMapping(value="/updatePoint", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity updatePoint(@RequestParam(value="p_id",required = false) String p_id, @RequestParam(value="usePoint") int usePoint ,HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("updatePoint 진입");
		System.out.println("p_id : " + p_id);
		System.out.println("usePoint : " + usePoint);
		
		Map<String, Object> searchMap = new HashMap<String,Object>();
		searchMap.put("p_id", p_id);
		List<Map<String, Object>> list = paymentPoint_Service.searchList(searchMap);
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		System.out.println(list.get(0).get("point_rest").getClass().getName());  //error 발생하여 type 확인
		int point_rest = ((BigDecimal)list.get(0).get("point_rest")).intValue();
		
		System.out.println("point_rest : "+point_rest);
		System.out.println("usePoint : " + usePoint);
		
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders(); // 헤더변경 시 사용
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");		
		try {
			
			if(point_rest > usePoint ) {
				point_rest = point_rest - usePoint;
				System.out.println("연산후 point_rest : "+point_rest);
				resultMap.put("p_id", p_id);
				resultMap.put("point_change", usePoint);
				resultMap.put("point_rest", point_rest);
				paymentPoint_Service.updatePoint(resultMap);
				
			}else {
				point_rest = Math.abs(point_rest-usePoint);
			}		
			
		} catch (Exception e) {
			message = " <script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요');";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}		
		return resEnt;
		
		
	}
}
