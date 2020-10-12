package project.bumsik.payment_main.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import project.bumsik.payment_main.dao.PaymentMain_DAO;
import project.bumsik.payment_main.vo.Lecture_VO;

@Service("paymentMain_Service")
public class PaymentMain_ServiceImpl implements PaymentMain_Service{
	
	@Autowired
	private PaymentMain_DAO paymentMain_DAO;
	
	@Override
	public List<Map<String, Object>> order_amount(Map<String, Object> searchMap) throws DataAccessException {
		List<Map<String, Object>> list = paymentMain_DAO.order_amount(searchMap);
		return list;
	}
	
}
