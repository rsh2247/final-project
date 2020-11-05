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
	private static String namespace = "payment.order";
	
	public int seq_order_id() throws DataAccessException{
		int order_key =  sqlSession.selectOne(namespace+".seq_order");
		return order_key;
	}
	//강의정보 조회, 수강료
	@Override
	public List<Map<String, Object>> order_lecture(Map<String, Object> lectMap) throws DataAccessException {
		List<Map<String, Object>> list = sqlSession.selectList(namespace+".order_lecture",lectMap);
		return list;
	}
	//강의 최초 선택시 
	@Override
	public void insertOrderInit(Map<String, Object> orderMap) throws DataAccessException {
		sqlSession.selectList(namespace+".insertOrderInit",orderMap);
	}
	
	
	@Override
	public List<Map<String, Object>> searchOrder(Map<String, Object> orderMap) throws DataAccessException {
		List<Map<String, Object>> list = sqlSession.selectList(namespace+".searchOrder",orderMap);
		return list;
	}
	@Override
	public void updateOrder(Map<String, Object> orderMap) throws DataAccessException {
		sqlSession.selectList(namespace+".updateOrder",orderMap);
		
	}
	
	//order join lecture 강의명 추가
	@Override
	public Map<String, Object> searchOrderlecName(Map<String, Object> orderMap) throws DataAccessException {
		return sqlSession.selectOne(namespace+".searchOrderlecName",orderMap);
	}
	//order join point
	@Override
	public List<Map<String, Object>> serarchOrderPoint(Map<String, Object> orderMap) throws DataAccessException {
		List<Map<String, Object>> list = sqlSession.selectList(namespace+".serarchOrderPoint",orderMap);
		return list;
	}
	
	//pay insert
	@Override
	public void paymentResult(Map<String, Object> resultMap) throws DataAccessException {
		sqlSession.selectList(namespace+".paymentResult",resultMap);	
	}
	@Override
	public Map<String, Object> serarchOrderPay(Map<String, Object> resultMap2) {
		return sqlSession.selectOne(namespace+".serarchOrderPay",resultMap2);
	}
}
