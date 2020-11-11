package project.yoonju.F.F_P001.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.yoonju.F.F_P001.vo.F_P001_D001VO;
import project.yoonju.F.F_P001.vo.F_P001_D001VO2;

public interface F_P001_D001Service {
	public List<Map<String, Object>> allRoundUserScore() throws DataAccessException;
	public List<Map<String, Object>> allScoreList(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> selectScorelist_categoryScore(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> viewUser_Score(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> categoryInfo1(Map<String, Object> map) throws DataAccessException;
	public List<Map<String, Object>> categoryInfo2(Map<String, Object> map) throws DataAccessException;
	public List<Map<String, Object>> searchUser(Map<String, Object> map) throws Exception;
	public List<Map<String, Object>> selectUserInfo(Map<String, Object> map) throws DataAccessException;
	public List<Map<String, Object>> listSubject() throws DataAccessException;
}

