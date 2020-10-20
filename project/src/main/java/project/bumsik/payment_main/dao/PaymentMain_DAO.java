package project.bumsik.payment_main.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.bumsik.payment_main.vo.Lecture_VO;

public interface PaymentMain_DAO {
	
	public List<Map<String, Object>> order_amount(Map<String, Object> lectMap) throws DataAccessException;
	
	public void insertOrderInfo1(Map<String, Object> orderMap) throws DataAccessException;	//orderinit
	public void insertOrderInfo2(Map<String, Object> orderMap) throws DataAccessException;
	public List<Map<String, Object>> searchOrderInfo(Map<String, Object> orderMap) throws DataAccessException;
	public void updateOrderInfo(Map<String, Object> orderMap) throws DataAccessException;
	
	public int seq_order_id() throws DataAccessException;

	//조인&강의명 추가
	public List<Map<String, Object>> searchOrderInfo2(Map<String, Object> orderMap) throws DataAccessException;


}
