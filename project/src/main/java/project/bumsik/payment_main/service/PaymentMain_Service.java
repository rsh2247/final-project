package project.bumsik.payment_main.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.bumsik.payment_main.vo.Lecture_VO;

public interface PaymentMain_Service {

	public List<Map<String, Object>> order_lecture(Map<String, Object> lectMap) throws DataAccessException;
	public List<Map<String, Object>> searchList(Map<String, Object> searchMap) throws DataAccessException;

	public void insertOrderInfo1(Map<String, Object> orderMap) throws DataAccessException;
	public void insertOrderInfo2(Map<String, Object> orderMap) throws DataAccessException;
	public List<Map<String, Object>> searchOrderInfo(Map<String, Object> orderMap) throws DataAccessException;
	public void updateOrderInfo(Map<String, Object> orderMap) throws DataAccessException;
	
	public int seq_order_id() throws DataAccessException;
	
	public List<Map<String, Object>> searchOrderInfo2(Map<String, Object> orderMap) throws DataAccessException;
	public List<Map<String, Object>> serarchOrderPoint(Map<String, Object> orderMap) throws DataAccessException;
	public void paymentResult(Map<String, Object> resultMap) throws DataAccessException;

}
