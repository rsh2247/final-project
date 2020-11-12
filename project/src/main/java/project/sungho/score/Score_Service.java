package project.sungho.score;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import project.sungho.security.member.CustomUser;

@Service("score_Service")
public class Score_Service {
	
	@Autowired
	private SqlSession sqlSession;
	
	public void makeProScore(Map<String, Object> inputMap) throws DataAccessException {
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		inputMap.put("user_id", user.getUsername());
		inputMap.put("category_id", inputMap.get("categoryId"));
		inputMap.put("score_point", 5);
		inputMap.put("score_content", "문제제작");
		sqlSession.update("insertScore",inputMap);
	}
	
	public void makeColScore(Map<String, Object> inputMap) throws DataAccessException {
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		inputMap.put("user_id", user.getUsername());
		inputMap.put("category_id", inputMap.get("categoryId"));
		inputMap.put("score_point", 5);
		inputMap.put("score_content", "문제집제작");
		sqlSession.update("insertScore",inputMap);
	}
	
	public void evalProScore(Map<String, Object> inputMap) throws DataAccessException {
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		inputMap.put("score_eval_user_id", user.getUsername());
		int score = 0;
		switch ((String)inputMap.get("pro_eval_score")) {
		case "1":score = -5;break;
		case "2":score = -3;break;
		case "3":score = -1;break;
		case "4":score = 1;break;
		case "5":score = 2;break;
		case "6":score = 3;break;
		case "7":score = 4;break;
		case "8":score = 5;break;
		case "9":score = 6;break;
		case "10":score = 7;break;
		}
		inputMap.put("score_point", score);
		inputMap.put("score_content", "평가");
		if(((Map<String,Object>)sqlSession.selectOne("checkProScore",inputMap))!=null) {
			sqlSession.update("updateProScore", inputMap);
		}else {
			sqlSession.update("insertScore",inputMap);
		}
	}
	
	public void evalColScore(Map<String, Object> inputMap) throws DataAccessException {
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		inputMap.put("score_eval_user_id", user.getUsername());
		int score = 0;
		switch ((String)inputMap.get("col_eval_score")) {
		case "1":score = -5;break;
		case "2":score = -3;break;
		case "3":score = -1;break;
		case "4":score = 1;break;
		case "5":score = 2;break;
		case "6":score = 3;break;
		case "7":score = 4;break;
		case "8":score = 5;break;
		case "9":score = 6;break;
		case "10":score = 7;break;
		}
		inputMap.put("score_point", score);
		inputMap.put("score_content", "평가");
		if(((Map<String,Object>)sqlSession.selectOne("checkColScore",inputMap))!=null) {
			sqlSession.update("score.updateColScore", inputMap);
		}else {
			sqlSession.update("insertScore",inputMap);
		}
	}
	
}
