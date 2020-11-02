package project.bumsik.payment_main.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.bumsik.payment_main.vo.Lecture_VO;

public interface PaymentMain_Service {

	public int seq_order_id() throws DataAccessException;
	public List<Map<String, Object>> order_lecture(Map<String, Object> lectMap) throws DataAccessException;
	public void insertOrderInit(Map<String, Object> orderMap) throws DataAccessException;

	
	public List<Map<String, Object>> searchOrder(Map<String, Object> orderMap) throws DataAccessException;
	public void updateOrder(Map<String, Object> orderMap) throws DataAccessException;
	
	
	public List<Map<String, Object>> searchOrderlecName(Map<String, Object> orderMap) throws DataAccessException;
	public List<Map<String, Object>> serarchOrderPoint(Map<String, Object> orderMap) throws DataAccessException;
	public void paymentResult(Map<String, Object> resultMap) throws DataAccessException;

//	public List<Map<String, Object>> searchList(Map<String, Object> searchMap) throws DataAccessException;
}
