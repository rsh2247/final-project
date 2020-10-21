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
	public void insertBoard(Map<String,Object> inputMap) {
		Iterator<String> keys = inputMap.keySet().iterator();
		while(keys.hasNext()) {
			String key = keys.next();
			System.out.println(key);
		}
	}
}
