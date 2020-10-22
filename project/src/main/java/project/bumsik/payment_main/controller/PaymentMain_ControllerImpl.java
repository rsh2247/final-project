package project.bumsik.payment_main.controller;

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
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.bumsik.payment_main.service.PaymentMain_Service;
import project.bumsik.payment_point.controller.PaymentPoint_ControllerImpl;
import project.bumsik.payment_point.service.PaymentPoint_Service;
import project.sungho.security.member.CustomUser;


@Controller("paymentMain_Controller")
public class PaymentMain_ControllerImpl implements PaymentMain_Controller{
	private static final Logger logger = LoggerFactory.getLogger(PaymentPoint_ControllerImpl.class);
	
	@Autowired
	private PaymentMain_Service paymentMain_Service;
	@Autowired
	private PaymentPoint_Service paymentPoint_Service;

	
	@Override
	@RequestMapping(value="/order", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView order_amount(@RequestParam(value="l_id",required = false) String l_id,HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("mapping: order / order_amount 진입");
		ModelAndView mav = new ModelAndView("payment/paymentMain.tiles");
		
		/* 주문번호 생성 */
		java.util.Date now = new java.util.Date();
	    SimpleDateFormat vans = new SimpleDateFormat("yyMMdd");
	    String wdate = vans.format(now);
		int order_key = paymentMain_Service.seq_order_id();
		String trade_key = wdate+order_key;
		System.out.println("trade_key :"+trade_key);
		
		//강의 id 임의 설정
		l_id = "a01";
		Map<String, Object> lectMap = new HashMap<String,Object>();
		lectMap.put("l_id", l_id);
		
		//securityContext로 session의 id정보 가져옴.
		String userId = null;
		if(SecurityContextHolder.getContext().getAuthentication().getPrincipal().equals("anonymousUser")){
			userId = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		}else {
			userId = ((CustomUser)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
		}
		//order insert
		Map<String, Object> orderMap = new HashMap<String,Object>();
		
		orderMap.put("trade_key", trade_key);		//주문번호, order_num
		orderMap.put("p_id", userId);				//유저ID, user
		orderMap.put("l_id", l_id);					//강의번호, lecture
		List<Map<String, Object>> lectlist = paymentMain_Service.order_lecture(lectMap); 	//강의 정보 조회 list
		int order_price = ((BigDecimal)lectlist.get(0).get("lecture_tuition")).intValue();	//수강료
		System.out.println("11");
		orderMap.put("order_price", order_price);	//order_price
		
		paymentMain_Service.insertOrderInfo1(orderMap);	//주문정보 insert order_id, user_id, lecture_id, order_price(lecture_tution) 
		List<Map<String, Object>> orderlist = paymentMain_Service.searchOrderInfo(orderMap);
		
		//point 정보 조회
		Map<String, Object> pointMap = new HashMap<String,Object>();		
		pointMap.put("p_id", userId);
		List<Map<String, Object>> pointlist = paymentPoint_Service.searchList(pointMap);
		
		//point 적립&사용 기록이 전혀 없는 user, 예외 발생하여...
		if(pointlist.size() == 0 ) {
			Map<String, Object> insertMap = new HashMap<String,Object>();
			insertMap.put("point_change", 0);
			insertMap.put("point_rest", 0);
			insertMap.put("p_id", userId);
			insertMap.put("point_content", "");
			paymentPoint_Service.insertPoint(insertMap);
			pointlist = paymentPoint_Service.searchList(pointMap);
			System.out.println(""+pointlist);
		}
		
		
		
		
		
		
		mav.addObject("orderlist",orderlist);
		mav.addObject("lectlist",lectlist);
		mav.addObject("pointlist",pointlist);
		System.out.println("order_amount : "+mav);
		
	 
		return mav;
	}
	
	/* 할인정보 적용 */
	@Override
	@RequestMapping(value="/orderinfo", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public List<Map<String, Object>> orderinfo(@RequestParam(value="no",required = false) String no,
			@RequestParam(value="tp",required = false) int tp,HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("orderinfo진입");
		Map<String, Object> orderMap = new HashMap<String,Object>();

		//order search(price)
		orderMap.put("trade_key", no);			//주문번호(order_id) , 조건
		List<Map<String, Object>> orderlist = paymentMain_Service.searchOrderInfo(orderMap);
		int order_price = ((BigDecimal)orderlist.get(0).get("order_price")).intValue();
		System.out.println("order_price : "+order_price);
		orderMap.put("discount_point", tp);		//할인 금액, 사용 포인트, sale_price_total(discount_point)
		
		//포인트 적용 최종가격 
		int total_price = order_price-tp;
		orderMap.put("total_price", total_price);		//할인 적용한 금액
		System.out.println("total_price : "+total_price);
		
		//강의 가격보다 포인트가 큰지 비교, flag 0,1
		int point_over = total_price >= 0 ? 1 : 0;
		orderMap.put("point_over", point_over);
		System.out.println("point over : "+point_over);
		
		String point_cancel = "<td colspan=2 id=pt${orderlist[0].order_id}>  할인 취소  \r\n"+ 
				"<a href=\"javascript:discount_cancel(${orderlist[0].order_id},'cancel');\">"
				+"<img src=\"./resources/img/button/close.gif\" alt=\"닫기\"></a>";
		orderMap.put("dis", point_cancel);
		System.out.println(orderMap);
		
		
		
		//update
		paymentMain_Service.updateOrderInfo(orderMap);
		
		orderlist = paymentMain_Service.searchOrderInfo(orderMap);
		orderlist.add(orderMap);
		System.out.println("ajax orderinfo : "+orderlist);
		return orderlist;
	}
	
	@Override
	@RequestMapping(value="/discount_cancel", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public List<Map<String, Object>> discount_cancel(@RequestParam(value="no",required = false) String no,
			@RequestParam(value="type",required = false) String dc,HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("discount_cancel진입");
		Map<String, Object> orderMap = new HashMap<String,Object>();

		//order search(price)
		orderMap.put("trade_key", no);			//주문번호(order_id) , 조건
		List<Map<String, Object>> orderlist = paymentMain_Service.searchOrderInfo(orderMap);
		int order_price = ((BigDecimal)orderlist.get(0).get("order_price")).intValue();
		System.out.println("order_price : "+order_price);
		orderMap.put("discount_point", dc);		//할인 금액, 사용 포인트, sale_price_total(discount_point)
		

		
		String point_cancel = "<td colspan=\"2\" id=\"pt${orderlist[0].order_id}\">"
				+ "<input type=\"text\" class=\"dispt\" name=\"dispt\" id=\"dispt${orderlist[0].order_id}\" "
				+ "onkeyPress=\"if ((event.keyCode<48) || (event.keyCode>57)) event.returnValue=false; "
				+ "\"style=\"ime-mode: disabled;\" onkeyup=\"point_check(${orderlist[0].order_id});\" /> "
				+ "href=\"javascript:point_apply(${orderlist[0].order_id});\">적용</a></td>";

		orderMap.put("dis", point_cancel);
		System.out.println(orderMap);
		
		//update
		paymentMain_Service.updateOrderInfo(orderMap);
		
		orderlist = paymentMain_Service.searchOrderInfo(orderMap);
		orderlist.add(orderMap);
		System.out.println("ajax orderinfo : "+orderlist);
		return orderlist;
	}
}
