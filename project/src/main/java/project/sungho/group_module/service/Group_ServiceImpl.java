package project.sungho.group_module.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import project.sungho.security.member.CustomUser;

@Service("group_Service")
public class Group_ServiceImpl implements Group_Service {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertGroup(Map<String, Object> inputMap) {
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		inputMap.put("user_id", user.getUsername());
		sqlSession.update("group.insertGroup", inputMap);
		sqlSession.update("group.insertMember", inputMap);
	}
	
	public void selectUserGroup(Map<String, Object> inputMap) {
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		inputMap.put("user_id", user.getUsername());
		sqlSession.update("group.insertGroup", inputMap);
	}
	
	public List<Map<String, Object>> selectWholeGroup() {
		List<Map<String, Object>> list = sqlSession.selectList("group.selectWholeGroup");
		return list;
	}
	public List<Map<String, Object>> selectMyGroup(){
		String userId = "anonymousUser";
		if(!SecurityContextHolder.getContext().getAuthentication().getPrincipal().equals("anonymousUser")) {
			userId = ((CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
		}
		Map<String,Object> inputMap = new HashMap<String, Object>();
		inputMap.put("user_id", userId);
		List<Map<String, Object>> list = sqlSession.selectList("group.selectMyGroup",inputMap);
		return list;
	}
	public Map<String, Object> selectOneGroup(Map<String, Object> inputMap) {
		Map<String, Object> map = sqlSession.selectOne("group.selectOneGroup", inputMap);
		return map;
	}
	
	public void insertGroupMember(Map<String, Object> inputMap) {
		String userId = "anonymousUser";
		if(!SecurityContextHolder.getContext().getAuthentication().getPrincipal().equals("anonymousUser")) {
			userId = ((CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
		}
		inputMap.put("user_id", userId);
		sqlSession.update("group.insertMember", inputMap);
	}
	
	public Map<String,Object> checkMemberState(Map<String,Object> inputMap) {
		String userId = "anonymousUser";
		if(!SecurityContextHolder.getContext().getAuthentication().getPrincipal().equals("anonymousUser")) {
			userId = ((CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
		}
		inputMap.put("user_id", userId);
		return (sqlSession.selectOne("group.checkMemberState", inputMap)==null) ? inputMap : sqlSession.selectOne("group.checkMemberState", inputMap);
	}
	
	public List<Map<String,Object>> selectGroupBoardList(Map<String,Object> inputMap){
		return sqlSession.selectList("group.selectGroupBoard", inputMap);
	}
	
	public List<Map<String,Object>> selectGroupMemberList(Map<String,Object> inputMap){
		return sqlSession.selectList("group.selectGroupMember", inputMap);
	}
	
	//article
	
	public void insertArticle(Map<String,Object> inputMap) {
		inputMap.put("user_id", ((CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername());
		sqlSession.update("article.insertArticle", inputMap);
	}
	
}
