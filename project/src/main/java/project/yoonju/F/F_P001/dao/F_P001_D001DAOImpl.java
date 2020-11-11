package project.yoonju.F.F_P001.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.yoonju.F.F_P001.vo.F_P001_D001VO;
import project.yoonju.F.F_P001.vo.F_P001_D001VO2;

@Repository("scoreDAO")
public class F_P001_D001DAOImpl implements F_P001_D001DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Map<String, Object>> allRoundUserScore() throws DataAccessException{
		List<Map<String, Object>> allUserScore = sqlSession.selectList("yoonju.F.F_P001.F_P001_D001DAO.allRoundUserScore");
		return allUserScore;
	}
	
	
	@Override
	public List<Map<String, Object>> selectAllScoreList(Map<String, Object> map) throws DataAccessException {
		List<Map<String, Object>> allScoreList = sqlSession.selectList("yoonju.F.F_P001.F_P001_D001DAO.selectAllScoreList", map);
		return allScoreList;
	}

	@Override
	public List<Map<String, Object>> selectScorelist_categoryScore(Map<String, Object> map) throws DataAccessException{
		List<Map<String, Object>> scoreList = sqlSession.selectList("yoonju.F.F_P001.F_P001_D001DAO.selectScorelist_categoryScore", map);
		return scoreList;
	}
	

	@Override
	public List<Map<String, Object>> viewUser_score(Map<String, Object> map) throws DataAccessException{
		List<Map<String, Object>> scoreList = sqlSession.selectList("yoonju.F.F_P001.F_P001_D001DAO.viewUser_score", map);
		return scoreList;
	}
	
	
	@Override
	public List<Map<String, Object>> categoryInfo1(Map<String, Object> map) throws DataAccessException{
		List<Map<String, Object>> scoreList = sqlSession.selectList("yoonju.F.F_P001.F_P001_D001DAO.categoryInfo1", map);
		return scoreList;
	}
	
	@Override
	public List<Map<String, Object>> categoryInfo2(Map<String, Object> map) throws DataAccessException{
		List<Map<String, Object>> scoreList = sqlSession.selectList("yoonju.F.F_P001.F_P001_D001DAO.categoryInfo2", map);
		return scoreList;
	}
	
	
	@Override
	public List<Map<String, Object>> searchUser(Map<String, Object> map) throws DataAccessException{
		List<Map<String, Object>> scoreList = sqlSession.selectList("yoonju.F.F_P001.F_P001_D001DAO.searchUser", map);
		return scoreList;
	}
	
	
	@Override
	public List<Map<String, Object>> selectUserInfo(Map<String, Object> map) throws DataAccessException{
		List<Map<String, Object>> scoreList = sqlSession.selectList("yoonju.F.F_P001.F_P001_D001DAO.selectUserInfo", map);
		return scoreList;
	}
	
	@Override
	public List<Map<String, Object>> listSubject() throws DataAccessException{
		List<Map<String, Object>> listSubject = sqlSession.selectList("yoonju.F.F_P001.F_P001_D001DAO.listSubject");
		return listSubject;
	}
}
