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

}
