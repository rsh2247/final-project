package project.bumsik.calendar.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository("calendar_DAO")
public class Calendar_DAOImpl implements Calendar_DAO{
	@Autowired
	private SqlSession sqlSession;
	private static String namespace = "calendar";
	
	@Override
	public List<Map<String, Object>> calendar_load(Map<String, Object> calMap) throws DataAccessException{
		List<Map<String, Object>> list = sqlSession.selectList(namespace+".load",calMap);
		return list;
	}

	@Override
	public void calendar_insertEvent(Map<String, Object> dataMap) throws DataAccessException {
		sqlSession.selectList(namespace+".insertEvent",dataMap);
		
	}

	@Override
	public void calendar_modifyEvent(Map<String, Object> dataMap) throws DataAccessException {
		sqlSession.selectList(namespace+".modifyEvent",dataMap);
		
	}

	@Override
	public void calendar_deleteEvent(Map<String, Object> dataMap) throws DataAccessException {
		sqlSession.selectList(namespace+".deleteEvent",dataMap);
		
	}
}
