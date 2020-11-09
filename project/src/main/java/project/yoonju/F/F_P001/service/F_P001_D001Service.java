package project.yoonju.F.F_P001.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.yoonju.F.F_P001.vo.F_P001_D001VO;
import project.yoonju.F.F_P001.vo.F_P001_D001VO2;

public interface F_P001_D001Service {
	public List<F_P001_D001VO> allScoreList() throws Exception;
	public List<F_P001_D001VO> selectScorelist_categoryScore(String score_category) throws Exception;
	public List<F_P001_D001VO> viewUser_Score(String user_id) throws Exception;
	public List<F_P001_D001VO> categoryInfo1(String score_category) throws DataAccessException;
	public List<F_P001_D001VO> categoryInfo2(String score_category) throws DataAccessException;
	public List<F_P001_D001VO> searchUser(String user_id) throws Exception;
	public List<F_P001_D001VO> selectUserInfo(String user_id) throws DataAccessException;
}

