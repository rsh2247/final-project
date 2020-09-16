package project.hm.hmp001_d000.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.hm.hmp001_d000.vo.Hmp001_d000VO;

@Repository
public class Hmp001_d000DAO{
	@Autowired
	private SqlSession sqlSession;

	public List<Hmp001_d000VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<Hmp001_d000VO> list = sqlSession.selectList("hm.hmp001_d000.searchList", searchMap);
		return list;
	}

	public List<Hmp001_d000VO> searchMod(Map<String, Object> searchMap) throws DataAccessException {
		List<Hmp001_d000VO> list = sqlSession.selectList("hm.hmp001_d000.searchMod", searchMap);
		return list;
	}

	public List<Hmp001_d000VO> searchAdd() throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}

	public void updateMember(Map<String, Object> datahMap) throws DataAccessException {
		sqlSession.update("hm.hmp001_d000.updateMember", datahMap);
	}

	public void insertMember(Map<String, Object> datahMap) throws DataAccessException {
		sqlSession.update("hm.hmp001_d000.insertMember", datahMap);
	}

	public void deleteMember(Map<String, Object> datahMap) throws DataAccessException {
		sqlSession.update("hm.hmp001_d000.deleteMember", datahMap);
	}
}
