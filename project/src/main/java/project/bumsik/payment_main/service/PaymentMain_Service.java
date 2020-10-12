package project.bumsik.payment_main.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.bumsik.payment_main.vo.Lecture_VO;

public interface PaymentMain_Service {

	public List<Map<String, Object>> order_amount(Map<String, Object> searchMap) throws DataAccessException;

}
