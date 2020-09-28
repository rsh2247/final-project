package project.bumsik.payment_point.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.bumsik.payment_point.dao.PaymentPoint_DAO;
import project.bumsik.payment_point.vo.PaymentPoint_VO;

@Service("payPointService")
@Transactional(propagation = Propagation.REQUIRED)
public class PaymentPoint_ServiceImpl implements PaymentPoint_Service{
	@Autowired
	private PaymentPoint_DAO paymentPoint_DAO;

	@Override
	public List<Map<String, Object>> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<Map<String, Object>> list = paymentPoint_DAO.searchList(searchMap);
		return list;
	}

}
