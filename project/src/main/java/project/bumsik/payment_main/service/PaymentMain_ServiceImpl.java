package project.bumsik.payment_main.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import project.bumsik.payment_main.dao.PaymentMain_DAO;
import project.bumsik.payment_main.vo.Lecture_VO;
import project.bumsik.payment_point.dao.PaymentPoint_DAO;

@Service("paymentMain_Service")
public class PaymentMain_ServiceImpl implements PaymentMain_Service{
	
	@Autowired
	private PaymentMain_DAO paymentMain_DAO;

	//주문번호 sequence
	public int seq_order_id() throws DataAccessException{
		int order_key =  paymentMain_DAO.seq_order_id();
		return order_key;
	}
	//강의정보
	@Override
	public List<Map<String, Object>> order_lecture(Map<String, Object> lectMap) throws DataAccessException {
		List<Map<String, Object>> list = paymentMain_DAO.order_lecture(lectMap);
		return list;
	}
	//초기 주문 정보 입력
	@Override
	public void insertOrderInit(Map<String, Object> orderMap) throws DataAccessException {
		paymentMain_DAO.insertOrderInit(orderMap);
	}

	//주문 정보 조회
	@Override
	public List<Map<String, Object>> searchOrder(Map<String, Object> orderMap) throws DataAccessException {
		List<Map<String, Object>> list = paymentMain_DAO.searchOrder(orderMap);
		return list;
	}
	//주문 정보 갱신
	@Override
	public void updateOrder(Map<String, Object> orderMap) throws DataAccessException {
		paymentMain_DAO.updateOrder(orderMap);	
	}
	
	//강의명 추가 조회(join)	
	@Override
	public Map<String, Object> searchOrderlecName(Map<String, Object> orderMap) throws DataAccessException {
		orderMap = paymentMain_DAO.searchOrderlecName(orderMap);
		return orderMap;
	}
	
	@Override
	public List<Map<String, Object>> serarchOrderPoint(Map<String, Object> orderMap) throws DataAccessException {
		List<Map<String, Object>> list = paymentMain_DAO.serarchOrderPoint(orderMap);
		return list;
	}

	@Override
	public void paymentResult(Map<String, Object> resultMap) throws DataAccessException {
		paymentMain_DAO.paymentResult(resultMap);
		
	}
	@Override
	public Map<String, Object> serarchOrderPay(Map<String, Object> resultMap2) {
		resultMap2 = paymentMain_DAO.serarchOrderPay(resultMap2);
		return resultMap2;
	}

}
