package project.bumsik.mainPage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public class MainPageDAOImpl implements MainPageDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Map<String, Object>> mainGroupRank() throws DataAccessException {
		List<Map<String, Object>> list = sqlSession.selectList("groupRank.board_num");
		return list;
	}	
}
