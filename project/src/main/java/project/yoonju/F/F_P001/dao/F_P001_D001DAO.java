package project.yoonju.F.F_P001.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.yoonju.F.F_P001.vo.F_P001_D001VO;
import project.yoonju.F.F_P001.vo.F_P001_D001VO2;
import project.yoonju.H.H_P001.vo.H_p001_d001VO;





public interface F_P001_D001DAO {
	
	public List<F_P001_D001VO> selectAllScoreList() throws DataAccessException;
	public List<F_P001_D001VO> selectScorelist_categoryScore(String score_category) throws DataAccessException;
	public List<F_P001_D001VO> viewUser_score(String user_id) throws DataAccessException;
	public List<F_P001_D001VO> categoryInfo1(String score_category) throws DataAccessException;
	public List<F_P001_D001VO> categoryInfo2(String score_category) throws DataAccessException;
	public List<F_P001_D001VO> searchUser(String user_id) throws DataAccessException;
	public List<F_P001_D001VO> selectUserInfo(String user_id) throws DataAccessException;

}
