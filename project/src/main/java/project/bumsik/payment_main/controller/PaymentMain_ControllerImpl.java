package project.bumsik.payment_main.controller;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

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

	
	
	@Override  /*초기 강의 신청시 호출*/
	@RequestMapping(value="/orderInit.pay", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView order_amount(@RequestParam(value="lecture_id",required = false) String lecture_id,HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("mapping: order / order_amount 진입");
		ModelAndView mav = new ModelAndView("payment/paymentMain.tiles");
		
		/* 주문번호 생성 */
	    String wdate = getDate("date");
		int order_key = paymentMain_Service.seq_order_id();
		String order_id = wdate+order_key;
		
		//강의 정보 조회, 수강료(주문금액)
		Map<String, Object> lectMap = new HashMap<String,Object>();
		lectMap.put("lecture_id", "a01");
		List<Map<String, Object>> lectlist = paymentMain_Service.order_lecture(lectMap); 	//강의 정보 조회 list
		int order_price = ((BigDecimal)lectlist.get(0).get("lecture_tuition")).intValue();	//수강료, order_price
		mav.addObject("lectlist",lectlist);
		
		//주문정보 저장과 조회
		Map<String, Object> orderMap = new HashMap<String,Object>();
		orderMap.put("order_id", order_id);				//주문ID, order_num
		orderMap.put("user_id", getUsername());			//유저ID, user
		orderMap.put("lecture_id", "a01");				//임의 강의번호, lecture
		orderMap.put("order_price", order_price);		//order_price
		orderMap.put("total_price", order_price);
		paymentMain_Service.insertOrderInit(orderMap);	//초기 주문정보 
			
		List<Map<String, Object>> orderlist = paymentMain_Service.searchOrder(orderMap);
		mav.addObject("orderlist",orderlist);
		
		//포인트 정보 조회
		Map<String, Object> pointMap = new HashMap<String,Object>();	
		pointMap.put("user_id", getUsername());
		List<Map<String, Object>> pointlist = paymentPoint_Service.searchList(pointMap);
		
		//포인트 적립/사용 기록 없는 유저
		if(pointlist.size() == 0 ) {
			Map<String, Object> insertMap = new HashMap<String,Object>();
			insertMap.put("point_change", 0);
			insertMap.put("point_rest", 0);
			insertMap.put("user_id", getUsername());
			insertMap.put("point_content", "");
			paymentPoint_Service.insertPoint(insertMap);
			pointlist = paymentPoint_Service.searchList(insertMap);
		}	
		mav.addObject("pointlist",pointlist);
		System.out.println("order_amount : "+mav);
		 
		return mav;
	}
	
	
	@Override /* 할인정보 적용 */
	@RequestMapping(value="/orderinfo", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public List<Map<String, Object>> orderinfo(@RequestParam(value="no",required = false) String no,
			@RequestParam(value="tp",required = false) int tp,HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("orderinfo진입");
		Map<String, Object> orderMap = new HashMap<String,Object>();

		//order search(price)
		String order_id = no;	//주문번호
		int discount_point = tp;
		orderMap.put("order_id", order_id);			//주문번호(order_id) , 조건
		List<Map<String, Object>> orderlist = paymentMain_Service.searchOrder(orderMap);
		int order_price = ((BigDecimal)orderlist.get(0).get("order_price")).intValue();
		orderMap.put("discount_point", discount_point);		//할인 금액, 사용 포인트, sale_price_total(discount_point)
		
		//포인트 적용 최종가격 
		int total_price = order_price-discount_point;
		orderMap.put("total_price", total_price);		//할인 적용한 금액
		
		//강의 가격보다 포인트가 큰지 비교, flag 0,1
		int point_over = total_price >= 0 ? 1 : 0;
		orderMap.put("point_over", point_over);
		
		String point_cancel = "할인 취소 \r\n" + 
				"<a href=\"javascript:discount_cancel("+ order_id +",'cancel');\">\r\n" + 
				"<img src=\"./resources/img/button/close.gif\" alt=\"취소\" /></a>\r\n";
		orderMap.put("dis", point_cancel);
		
		//update
		paymentMain_Service.updateOrder(orderMap);
		
		orderlist = paymentMain_Service.searchOrder(orderMap);
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
		
		String order_id = no;	//주문번호
		String type = dc;		//'cancel'
		
		//주문 가격 추출
		Map<String, Object> updateMap = new HashMap<String,Object>();
		updateMap.put("order_id", order_id);			
		List<Map<String, Object>> orderlist = paymentMain_Service.searchOrder(updateMap);
		int order_price = ((BigDecimal)orderlist.get(0).get("order_price")).intValue();
		
		//order에 할인정보 삭제
		updateMap.put("discount_point", 0);
		updateMap.put("total_price", order_price);	//원래 주문 가격으로~
		updateMap.put("point_over", "0");

		String point_cancel = 
				 "<input type=\"text\" class=\"dispt\" name=\"dispt\" id=\"dispt"+order_id+"\" "
				+ "onkeyPress=\"if ((event.keyCode<48) || (event.keyCode>57)) event.returnValue=false; "
				+ "\"style=\"ime-mode: disabled;\" onkeyup=\"point_check("+order_id+");\" /> "
				+ "<a href=\"javascript:point_apply("+order_id+");\">"
				+ "<img src=\"./resources/img/button/apply.gif\" alt=\"적용\" /></a>";

		updateMap.put("dis", point_cancel);
		//취소 데이터 적용해서 update
		paymentMain_Service.updateOrder(updateMap);
		
		//update된 주문정보 추출
		orderlist = paymentMain_Service.searchOrder(updateMap);
		orderlist.add(updateMap);
		System.out.println("ajax orderinfo 할인 취소 : "+orderlist);
		return orderlist;
	}
	
	@Override
	@RequestMapping(value="/paymentSuccess.pay", method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView paymentSuccess(@RequestParam(value="order_id",required = false) String order_id,@RequestParam(value="type",required = false) String type,HttpServletRequest request, HttpServletResponse response) throws Exception{
		System.out.println("결제 성공 페이지로 이동할 데이터 저장, 주문번호 : "+order_id);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("order_id", order_id);
		resultMap = paymentMain_Service.searchOrderlecName(resultMap); //order join lecture 상품명
		resultMap = changeToLowerMapKey(resultMap);
		System.out.println("resultMap : "+resultMap);
				
		String pay_way = type!="kakao" ? "point": "kakao";		
		String pay_content = "결제시각 : "+ resultMap.get("pay_date")
		+"\t 결제번호 : "+ resultMap.get("pay_id")
		+"\t 상품명  : "+ resultMap.get("lecture_name")
		+"\t 주문금액 : "+ resultMap.get("order_price")
		+"\t 할인금액 : "+ resultMap.get("discount_point")
		+"\t 총 결제금액 : "+ resultMap.get("pay_amount")
		+"\t 결제방식 : "+ pay_way;
		
		resultMap.put("pay_content", pay_content);
		resultMap.put("pay_way", pay_way);
		paymentMain_Service.paymentResult(resultMap);
		
		Map<String, Object> resultMap2 = new HashMap<String, Object>();
		resultMap2.put("order_id", order_id);
		resultMap2 = paymentMain_Service.serarchOrderPay(resultMap2);
		resultMap2 = changeToLowerMapKey(resultMap2);
		
		ModelAndView mav = new ModelAndView("payment/paymentSuccess.tiles");
		
		mav.addObject("info",resultMap2);
		System.out.println("mainctr: "+mav);
		return mav;
	}
	
	//유저 ID 가져오기
	public String getUsername() {
		String userId = null;
		if(SecurityContextHolder.getContext().getAuthentication().getPrincipal().equals("anonymousUser")){
			userId = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		}else {
			userId = ((CustomUser)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
		}
		return userId;
	}
	//현재 날짜 , 시간 가져오기	
	public String getDate(String dt) {
		java.util.Date now = new java.util.Date();
		SimpleDateFormat vans = null;
	    if(dt.equals("date")) {
	    	vans = new SimpleDateFormat("yyMMdd");	    	
	    }else if(dt.equals("time")) {
	    	vans = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");    		    	
	    }	   
		return vans.format(now);
	}
	//소문자로
	public Map<String, Object> changeToLowerMapKey(Map<String, Object> origin){
		   Map<String, Object> temp = new HashMap<String, Object>();  
		   Set<String> set = origin.keySet();
		   Iterator<String> e = set.iterator();

		   while(e.hasNext()){
		     String key = e.next();
		     Object value = (Object) origin.get(key);
		     temp.put(key.toLowerCase(), value);
		   }
		  origin = null;
		  return temp;
	}
}

