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
	@RequestMapping(value="/paymentSuccess.pay", method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView paymentSuccess(@RequestParam(value="order_id",required = false) String order_id,@RequestParam(value="type",required = false) String type,HttpServletRequest request, HttpServletResponse response) throws Exception{
		System.out.println("결제 성공 페이지로 이동할 데이터 저장");
		System.out.println(order_id);
		
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("order_id", order_id);
		List<Map<String, Object>> resultList = paymentMain_Service.searchOrderInfo2(resultMap); //order join lecture 상품명
		//pay table insert
		String pay_id = (String)resultList.get(0).get("order_id");
    	
		String pay_way = "";
		if(type != "kakao") {
			pay_way="point";			
		}else {
			pay_way="kakao";
		}
    	
		String user_id = user.getUsername();
		
    	java.util.Date now = new java.util.Date();
	    SimpleDateFormat vans = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");    	
    	String pay_date=vans.format(now);
    	
    	String pay_amount = (String)resultList.get(0).get("total_price");			//총 결제금액
    	
    	//완료 페이지 필요한 데이터
    	String discount_point = (String) resultList.get(0).get("discount_point");	//할인포인트
    	String lecture_name = (String) resultList.get(0).get("LECTURE_NAME");		//강의명, 상풍명
		String order_price = (String) resultList.get(0).get("order_price");			//주문금액
    	
    	String pay_content = "결제시각 : "+ pay_date
    					+"\n 결제번호 : "+ pay_id
    					+"\n 상품명  : "+ lecture_name
    					+"\n 주문금액 : "+order_price
    					+"\n 할인금액 : "+discount_point
    					+"\n 총 결제금액 : "+pay_amount;
    	
    	resultMap.put("pay_id", pay_id);
    	resultMap.put("pay_content", pay_content);
    	resultMap.put("pay_way", pay_way);
    	resultMap.put("user_id", user_id);
    	resultMap.put("pay_date", pay_date);
    	resultMap.put("pay_amount", pay_amount);	//총 결제 금액
    	paymentMain_Service.paymentResult(resultMap);
    	
		/* view에서 꺼내쓸때 카카오와 맞추기 위해.. */
    	resultMap.put("payment_method_type", pay_way); //결제방식
    	resultMap.put("partner_order_id", pay_id);	//결제번호
    	resultMap.put("approved_at", pay_date);		//결제시각
    	resultMap.put("discount", discount_point);	//할인(포인트)
    	resultMap.put("item_name", lecture_name);	//상품명, 강의명
    	resultMap.put("order_price", order_price);	//주문금액
    	
    	ModelAndView mav = new ModelAndView("payment/paymentSuccess.tiles");
    	
    	mav.addObject("info",resultMap);
    	System.out.println("mainctr: "+mav);
    	return mav;
	}
	  
	
	@Override  /*초기 강의 신청시 호출*/
	@RequestMapping(value="/order", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView order_amount(@RequestParam(value="l_id",required = false) String l_id,HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("mapping: order / order_amount 진입");
		ModelAndView mav = new ModelAndView("payment/paymentMain.tiles");
		
		/* 주문번호 생성 */
		java.util.Date now = new java.util.Date();
	    SimpleDateFormat vans = new SimpleDateFormat("yyMMdd");
	    String wdate = vans.format(now);
		int order_key = paymentMain_Service.seq_order_id();
		String order_id = wdate+order_key;
		System.out.println("order_id :"+order_id);
		
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
		
		orderMap.put("order_id", order_id);		//주문번호, order_num
		orderMap.put("p_id", userId);				//유저ID, user
		orderMap.put("l_id", l_id);					//강의번호, lecture
		
		List<Map<String, Object>> lectlist = paymentMain_Service.order_lecture(lectMap); 	//강의 정보 조회 list
		int order_price = ((BigDecimal)lectlist.get(0).get("lecture_tuition")).intValue();	//수강료
		orderMap.put("order_price", order_price);	//order_price
		orderMap.put("discount_point", 0);
		orderMap.put("total_price", order_price);
		orderMap.put("point_over", "0");
			
		paymentMain_Service.insertOrderInfo2(orderMap);	//초기 주문정보 
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
		List<Map<String, Object>> orderlist = paymentMain_Service.searchOrderInfo(orderMap);
		int order_price = ((BigDecimal)orderlist.get(0).get("order_price")).intValue();
		System.out.println("order_price : "+order_price);
		orderMap.put("discount_point", discount_point);		//할인 금액, 사용 포인트, sale_price_total(discount_point)
		
		//포인트 적용 최종가격 
		int total_price = order_price-discount_point;
		orderMap.put("total_price", total_price);		//할인 적용한 금액
		System.out.println("total_price : "+total_price);
		
		//강의 가격보다 포인트가 큰지 비교, flag 0,1
		int point_over = total_price >= 0 ? 1 : 0;
		orderMap.put("point_over", point_over);
		System.out.println("point over : "+point_over);
		
		String point_cancel = "할인 취소 \r\n" + 
				"<a href=\"javascript:discount_cancel("+ order_id +",'cancel');\">\r\n" + 
				"<img src=\"./resources/img/button/close.gif\" alt=\"취소\" /></a>\r\n";
		orderMap.put("dis", point_cancel);
		
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
		
		String order_id = no;	//주문번호
		String type = dc;		//'cancel'
		
		//주문 가격 추출
		Map<String, Object> updateMap = new HashMap<String,Object>();
		updateMap.put("order_id", order_id);			
		List<Map<String, Object>> orderlist = paymentMain_Service.searchOrderInfo(updateMap);
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
		paymentMain_Service.updateOrderInfo(updateMap);
		System.out.println("2 : "+updateMap);
		
		//update된 주문정보 추출
		orderlist = paymentMain_Service.searchOrderInfo(updateMap);
		orderlist.add(updateMap);
		System.out.println("ajax orderinfo 할인 취소 : "+orderlist);
		return orderlist;
	}
}
