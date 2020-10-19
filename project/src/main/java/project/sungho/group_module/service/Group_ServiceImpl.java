package project.sungho.group_module.service;

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
		inputMap.putAll(sqlSession.selectOne("selectMaxGroupNum"));
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
	
	public Map<String, Object> selectOneGroup(Map<String, Object> inputMap) {
		Map<String, Object> map = sqlSession.selectOne("group.selectOneGroup", inputMap);
		return map;
	}
	
	public void insertGroupMember(Map<String, Object> inputMap) {
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		inputMap.put("user_id", user.getUsername());
		sqlSession.update("group.insertMember", inputMap);
	}
	
	public List<Map<String, Object>> selectGroupMember(Map<String, Object> inputMap) {
		return sqlSession.selectList("group.selectGroupMember", inputMap);
	}
	
	public Map<String,Object> checkMemberState(Map<String,Object> inputMap) {
		try {
			CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			inputMap.put("user_id", user.getUsername());
		}catch (Exception e) {}
		return sqlSession.selectOne("group.checkMemberState", inputMap);
	}

}
