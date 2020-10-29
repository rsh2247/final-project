package project.sungho.post_module.service;

import java.util.List;
import java.util.Map;

public interface Post_Service {
	List<Map<String, Object>> selectArticleByGroup(Map<String,Object> inputMap);
	public List<Map<String, Object>> selectArticleByBoard(Map<String,Object> inputMap);
	public Map<String, Object> selectOneArticle(Map<String,Object> inputMap);
	public Map<String, Object> selectBoardName(Map<String,Object> inputMap);
	public List<Map<String, Object>> selectReplyList(Map<String,Object> inputMap);
	public List<Map<String, Object>> selectRecentReply(Map<String,Object> inputMap);
	public List<Map<String, Object>> insertReply(Map<String,Object> inputMap);
	public Map<String, Object> insertBoard(Map<String,Object> inputMap);
	public void deleteBoardList(String[] input);
}
