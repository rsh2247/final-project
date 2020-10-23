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
	@Autowired
	private PaymentPoint_DAO paymentPoint_DAO;
	
	//강의정보
	@Override
	public List<Map<String, Object>> order_lecture(Map<String, Object> lectMap) throws DataAccessException {
		List<Map<String, Object>> list = paymentMain_DAO.order_lecture(lectMap);
		return list;
	}
	
	//포인트 정보
	@Override
	public List<Map<String, Object>> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<Map<String, Object>> list = paymentPoint_DAO.searchList(searchMap);
		return list;
	}
	
	//주문정보	insert
	@Override
	public void insertOrderInfo1(Map<String, Object> orderMap) throws DataAccessException {
		paymentMain_DAO.insertOrderInfo1(orderMap);
	}
	@Override
	public void insertOrderInfo2(Map<String, Object> orderMap) throws DataAccessException {
		paymentMain_DAO.insertOrderInfo2(orderMap);
	}
	//주문정보 search
	@Override
	public List<Map<String, Object>> searchOrderInfo(Map<String, Object> orderMap) throws DataAccessException {
		List<Map<String, Object>> list = paymentMain_DAO.searchOrderInfo(orderMap);
		return list;
	}
	
	@Override
	public void updateOrderInfo(Map<String, Object> orderMap) throws DataAccessException {
		paymentMain_DAO.updateOrderInfo(orderMap);	
	}
	
	//교육명 추가	
	@Override
	public List<Map<String, Object>> searchOrderInfo2(Map<String, Object> orderMap) throws DataAccessException {
		List<Map<String, Object>> list = paymentMain_DAO.searchOrderInfo2(orderMap);
		return list;
	}
	
	
	public int seq_order_id() throws DataAccessException{
		int order_key =  paymentMain_DAO.seq_order_id();
		return order_key;
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

}
