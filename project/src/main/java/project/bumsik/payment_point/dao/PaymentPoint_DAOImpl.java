package project.bumsik.payment_point.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.bumsik.payment_point.vo.PaymentPoint_VO;


@Repository("payPointDAO")
public class PaymentPoint_DAOImpl implements PaymentPoint_DAO{
	@Autowired
	private SqlSession sqlSession;
	
	private static String namespace = "payment.point";
	
	@Override
	public List<Map<String, Object>> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<Map<String, Object>> list = sqlSession.selectList(namespace+".searchList",searchMap);
		return list;
	}
	
	

}
