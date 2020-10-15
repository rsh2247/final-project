package project.sungho.user_module.service;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


public interface User_Service {
	
	public List<Map<String,Object>> selectUserCol() throws DataAccessException;
	public List<Map<String,Object>> selectselectUserAnwser(Map<String,Object> inputMap) throws DataAccessException;
}
