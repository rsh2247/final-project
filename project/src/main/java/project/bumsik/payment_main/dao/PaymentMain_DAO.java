package project.bumsik.payment_main.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.bumsik.payment_main.vo.Lecture_VO;

public interface PaymentMain_DAO {
	
	public List<Map<String, Object>> order_amount(Map<String, Object> searchMap) throws DataAccessException;

}
