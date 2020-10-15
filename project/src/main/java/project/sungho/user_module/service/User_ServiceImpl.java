package project.sungho.user_module.service;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.sungho.security.member.CustomUser;


@Service("user_Service")
@Transactional(propagation = Propagation.REQUIRED)
public class User_ServiceImpl implements User_Service {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<Map<String,Object>> selectUserCol() throws DataAccessException {
		Map<String,Object> inputMap = new HashMap<String, Object>();
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		inputMap.put("user_id", user.getUsername());
		List<Map<String,Object>> list = sqlSession.selectList("pr.pro_collection.selectUserColHistory",inputMap);
		return list;
	}
}
