package project.bumsik.payment_point.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import project.bumsik.payment_point.vo.PaymentPoint_VO;



public interface PaymentPoint_Service {
	
	public List<PaymentPoint_VO> searchList(Map<String, Object> searchMap) throws DataAccessException;

}
