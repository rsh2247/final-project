package project.bumsik.payment_main.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.bumsik.payment_main.vo.Lecture_VO;

@Repository("paymentMain_DAO")
public class PaymentMain_DAOImpl implements PaymentMain_DAO{
	@Autowired
	private SqlSession sqlSession;
	
	private static String namespace = "payment.lect";
	
	@Override
	public List<Map<String, Object>> order_amount(Map<String, Object> searchMap) throws DataAccessException {
		System.out.println(searchMap);
		List<Map<String, Object>> list = sqlSession.selectList(namespace+".order_amount",searchMap);
		System.out.println(list);
		return list;
	}
}
