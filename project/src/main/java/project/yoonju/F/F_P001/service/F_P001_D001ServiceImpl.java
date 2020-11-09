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
	
	public List<F_P001_D001VO> allScoreList() throws Exception{
		List<F_P001_D001VO> scoreList =  scoreDAO.selectAllScoreList();
        return scoreList;
	}

	public List<F_P001_D001VO> selectScorelist_categoryScore(String score_category) throws Exception{
		List<F_P001_D001VO> scoreList =  scoreDAO.selectScorelist_categoryScore(score_category);
        return scoreList;	
	}
	
	public List<F_P001_D001VO> viewUser_Score(String user_id) throws Exception{
		List<F_P001_D001VO> scoreList =  scoreDAO.viewUser_score(user_id);
        return scoreList;
	}
	
	public List<F_P001_D001VO> categoryInfo1(String score_category) throws DataAccessException{
		List<F_P001_D001VO> scoreList =  scoreDAO.categoryInfo1(score_category);
		return scoreList;
	}
	
	public List<F_P001_D001VO> categoryInfo2(String score_category) throws DataAccessException{
		List<F_P001_D001VO> scoreList =  scoreDAO.categoryInfo2(score_category);
		return scoreList;
	}
	
	public List<F_P001_D001VO> searchUser(String user_id) throws Exception{
		List<F_P001_D001VO> scoreList = scoreDAO.searchUser(user_id);
		return scoreList;
	}
	
	public List<F_P001_D001VO> selectUserInfo(String user_id) throws DataAccessException{
		List<F_P001_D001VO> scoreList = scoreDAO.selectUserInfo(user_id);
		return scoreList;
	}
	
}
