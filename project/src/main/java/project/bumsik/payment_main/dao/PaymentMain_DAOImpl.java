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
	private static String namespace2 = "payment.order";
	
	@Override
	public List<Map<String, Object>> order_amount(Map<String, Object> lectMap) throws DataAccessException {
		List<Map<String, Object>> list = sqlSession.selectList(namespace+".order_amount",lectMap);
		return list;
	}
	

	@Override
	public void insertOrderInfo1(Map<String, Object> orderMap) throws DataAccessException {
		sqlSession.selectList(namespace2+".insertOrder1",orderMap);
	}
	@Override
	public void insertOrderInfo2(Map<String, Object> orderMap) throws DataAccessException {
		sqlSession.selectList(namespace2+".insertOrder2",orderMap);
	}
	@Override
	public List<Map<String, Object>> searchOrderInfo(Map<String, Object> orderMap) throws DataAccessException {
		List<Map<String, Object>> list = sqlSession.selectList(namespace2+".searchOrder",orderMap);
		return list;
	}
	@Override
	public void updateOrderInfo(Map<String, Object> orderMap) throws DataAccessException {
		sqlSession.selectList(namespace2+".updateOrder",orderMap);
		
	}
	
	
	public int seq_order_id() throws DataAccessException{
		int order_key =  sqlSession.selectOne(namespace2+".seq_order");
		return order_key;
	}


}
