package project.bumsik.payment_point.controller;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
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
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import project.bumsik.payment_point.service.PaymentPoint_Service;
import project.bumsik.payment_point.vo.PaymentPoint_VO;
import project.sungho.security.member.CustomUser;
import project.bumsik.payment_main.service.PaymentMain_Service;
import project.bumsik.payment_main.controller.PaymentMain_Controller;

@Controller("payPointController")
public class PaymentPoint_ControllerImpl implements PaymentPoint_Controller{
	private static final Logger logger = LoggerFactory.getLogger(PaymentPoint_ControllerImpl.class);
	
	@Autowired
	private PaymentPoint_Service paymentPoint_Service;
	@Autowired
	private PaymentMain_Controller paymentMain_Controller;
	@Autowired
	private PaymentMain_Service paymentMain_Service;
	
	/* 포인트 조회 */
	@Override
	@RequestMapping(value="/searchPoint", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public List<Map<String, Object>> searchPoint(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("searchPoint진입");
		Map<String, Object> searchMap = new HashMap<String,Object>();
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		searchMap.put("user_id", user.getUsername());
		List<Map<String, Object>> list = paymentPoint_Service.searchList(searchMap);
		
		return list;
	}
	
	@Override
	@RequestMapping(value="/insertPoint", method = { RequestMethod.GET, RequestMethod.POST })

	public String insertPoint(@RequestParam(value="order_id",required = false) String order_id,HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("insertPoint진입");
		System.out.println("order_id :"+order_id);
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
			/* point결제시 필요한 정보 조회 */
			Map<String, Object> searchMap = new HashMap<String,Object>();
			searchMap.put("order_id", order_id);
			searchMap.put("user_id", user.getUsername());
			List<Map<String, Object>> list = paymentMain_Service.serarchOrderPoint(searchMap);
			System.out.println("list : "+list);
			int discount_point = ((BigDecimal)list.get(0).get("DISCOUNT_POINT")).intValue() * -1;	//변동될 금액(point_change, - 금액)
			int current_point_rest = ((BigDecimal)list.get(0).get("point_rest")).intValue();
			int point_rest = current_point_rest + discount_point;								//point_rest
			
			System.out.printf("discount_point : %d%ncurrent_point_rest : %d%npoint_rest : %d%ncurrent_point_rest + discount_point : %d%n",discount_point,current_point_rest,point_rest,current_point_rest + discount_point);
			
			Map<String, Object> insertMap = new HashMap<String,Object>();
			
			insertMap.put("point_change",discount_point);
			insertMap.put("point_rest",point_rest);

			java.util.Date now = new java.util.Date();
			SimpleDateFormat vans = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String point_time = vans.format(now);
			String point_content = "포인트 사용 시각 : "+point_time+"\n 사용금액 : "+ (discount_point*-1) +"\n 포인트 잔액 : "+point_rest;
			insertMap.put("point_content",point_content);
			insertMap.put("user_id", user.getUsername());

			paymentPoint_Service.insertPoint(insertMap);
			return "forward:/paymentSuccess.pay";
	}
	
	//사용 미정... 작동은 함..	
	@Override
	@RequestMapping(value="/updatePoint", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity updatePoint(@RequestParam(value="user_id",required = false) String user_id, @RequestParam(value="usePoint") int usePoint ,HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("updatePoint 진입");

		Map<String, Object> searchMap = new HashMap<String,Object>();
		searchMap.put("user_id", user_id);
		List<Map<String, Object>> list = paymentPoint_Service.searchList(searchMap);
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		System.out.println(list.get(0).get("point_rest").getClass().getName());  //error 발생하여 type 확인
		int point_rest = ((BigDecimal)list.get(0).get("point_rest")).intValue();
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders(); // 헤더변경 시 사용
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");		
		try {
			
			if(point_rest > usePoint ) {
				point_rest = point_rest - usePoint;
				System.out.println("연산후 point_rest : "+point_rest);
				resultMap.put("user_id", user_id);
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
