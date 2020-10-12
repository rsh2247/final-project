package project.sungho.security.member;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("userDaoService")
public class UserDAOService extends SqlSessionDaoSupport{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Transactional
	public int insertUser(Map<String, String> paramMap) {
		return sqlSession.insert("user.insertUser",paramMap);
	}

	public Map<String, Object> selectUser(String username) {
		return sqlSession.selectOne("user.selectUser",username);
	}
}
