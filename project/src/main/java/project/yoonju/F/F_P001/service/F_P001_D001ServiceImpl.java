package project.yoonju.F.F_P001.service;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.yoonju.F.F_P001.dao.F_P001_D001DAO;
import project.yoonju.F.F_P001.vo.F_P001_D001VO;
import project.yoonju.F.F_P001.vo.F_P001_D001VO2;

@Service("scoreService")
@Transactional(propagation = Propagation.REQUIRED)
public class F_P001_D001ServiceImpl  implements F_P001_D001Service{
	
	@Autowired
	F_P001_D001DAO scoreDAO;
	
	public List<Map<String, Object>> allRoundUserScore() throws DataAccessException{
		List<Map<String, Object>> allUserScore = scoreDAO.allRoundUserScore();
		return allUserScore;
	}
	
	public List<Map<String, Object>> allScoreList(Map<String, Object> map) throws Exception{
		List<Map<String, Object>> allScoreList =  scoreDAO.selectAllScoreList(map);
        return allScoreList;
	}

	public List<Map<String, Object>> selectScorelist_categoryScore(Map<String, Object> map) throws Exception{
		List<Map<String, Object>> scoreList =  scoreDAO.selectScorelist_categoryScore(map);
        return scoreList;	
	}
	
	public List<Map<String, Object>> viewUser_Score(Map<String, Object> map) throws Exception{
		List<Map<String, Object>> scoreList =  scoreDAO.viewUser_score(map);
        return scoreList;
	}
	
	public List<Map<String, Object>> categoryInfo1(Map<String, Object> map) throws DataAccessException{
		List<Map<String, Object>> scoreList =  scoreDAO.categoryInfo1(map);
		return scoreList;
	}
	
	public List<Map<String, Object>> categoryInfo2(Map<String, Object> map) throws DataAccessException{
		List<Map<String, Object>> scoreList =  scoreDAO.categoryInfo2(map);
		return scoreList;
	}
	
	public List<Map<String, Object>> searchUser(Map<String, Object> map) throws Exception{
		List<Map<String, Object>> scoreList = scoreDAO.searchUser(map);
		return scoreList;
	}
	
	public List<Map<String, Object>> selectUserInfo(Map<String, Object> map) throws DataAccessException{
		List<Map<String, Object>> scoreList = scoreDAO.selectUserInfo(map);
		return scoreList;
	}
	
	public List<Map<String, Object>> listSubject() throws DataAccessException{
		List<Map<String, Object>> listSubject = scoreDAO.listSubject();
		return listSubject;
	}
	
}
