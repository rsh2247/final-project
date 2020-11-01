package project.sungho.security.member;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("userDao")
public class CustomUserDAO extends SqlSessionDaoSupport{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Transactional
	public int insertUser(Map<String, Object> paramMap) throws DataAccessException {
		return sqlSession.update("user.insertUser",paramMap);
	}

	public Map<String, Object> selectUser(Map<String, Object> paramMap) throws DataAccessException {
		System.out.println(paramMap);
		return sqlSession.selectOne("user.selectUser", paramMap);
	}
	
	public Map<String, Object> selectUserByEmail(Map<String, Object> inputMap) {
		return sqlSession.selectOne("selectUserByEmail",inputMap);
	}
	public void updateUserEnable(Map<String,Object> user) {
		sqlSession.update("updateUserEnable",user);
	}
	
	
}
