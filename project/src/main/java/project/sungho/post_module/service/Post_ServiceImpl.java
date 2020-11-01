package project.sungho.post_module.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import project.sungho.security.member.CustomUser;

@Service("post_Service")
public class Post_ServiceImpl implements Post_Service {

	@Autowired
	private SqlSession sqlSession;

	public List<Map<String, Object>> selectArticleByGroup(Map<String,Object> inputMap) {
		return sqlSession.selectList("article.selectArticleByGroup", inputMap);
	}
	public List<Map<String, Object>> selectArticleByBoard(Map<String,Object> inputMap) {
		return sqlSession.selectList("article.selectArticleByBoard", inputMap);
	}
	public Map<String, Object> selectOneArticle(Map<String,Object> inputMap) {
		return sqlSession.selectOne("article.selectArticle", inputMap);
	}
	public Map<String, Object> selectBoardName(Map<String,Object> inputMap) {
		return sqlSession.selectOne("article.selectBoardName", inputMap);
	}
	public List<Map<String, Object>> selectReplyList(Map<String,Object> inputMap) {
		return sqlSession.selectList("article.selectReply", inputMap);
	}
	public List<Map<String, Object>> selectRecentReply(Map<String,Object> inputMap) {
		return sqlSession.selectList("selectRecentReply", inputMap);
	}
	public List<Map<String, Object>> insertReply(Map<String,Object> inputMap) {
		String userId = "anonymousUser";
		if(!SecurityContextHolder.getContext().getAuthentication().getPrincipal().equals("anonymousUser")) {
			userId = ((CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
		}
		inputMap.put("user_id", userId);
		System.out.println(inputMap);
		sqlSession.update("article.insertReply", inputMap);
		inputMap.put("post_num", inputMap.get("post_parent"));
		return sqlSession.selectList("article.selectReply", inputMap);
	}
	public Map<String, Object> insertBoard(Map<String,Object> inputMap) {
		sqlSession.update("article.insertBoard", inputMap);
		return inputMap;
	}
	public void deleteBoardList(String[] input) {
		Map<String,Object> inputMap = new HashMap<String, Object>();
		for(String data : input) {
			inputMap.put("board_num", data);
			sqlSession.update("article.deleteBoard",inputMap);
			sqlSession.update("article.deleteBoardArticle", inputMap);
			inputMap.remove("board_num");
		}
	}
}
