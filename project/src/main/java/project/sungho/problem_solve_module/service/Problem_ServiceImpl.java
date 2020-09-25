package project.sungho.problem_solve_module.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.sungho.problem_solve_module.dao.Problem_DAO;
import project.sungho.problem_solve_module.vo.ProblemExample_VO;
import project.sungho.problem_solve_module.vo.Problem_VO;

@Service("problem_Service")
@Transactional(propagation = Propagation.REQUIRED)
public class Problem_ServiceImpl implements Problem_Service {
	
	@Autowired
	private Problem_DAO probem_DAO;

	@Override
	public List<Map<String, Object>> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<Map<String, Object>> list = probem_DAO.searchList(searchMap);
		return list;
	}

	@Override
	public List<Map<String, Object>> searchListCategory(Map<String, Object> searchMap) throws DataAccessException {
		List<Map<String, Object>> list = probem_DAO.searchListCategory(searchMap);
		return list;
	}

	@Override
	public List<Map<String, Object>> searchProblem(Map<String, Object> searchMap) throws DataAccessException {
		List<Map<String, Object>> list = probem_DAO.searchProblem(searchMap);
		return list;
	}

	@Override
	public List searchExample(Map<String, Object> searchMap) throws DataAccessException {
		List<Map<String, Object>> list = probem_DAO.searchExample(searchMap);
		return list;
	}

	@Override
	public List<Map<String, String>> selectProByCol(Map<String, Object> searchMap) throws DataAccessException {
		List<Map<String, String>> list = probem_DAO.selectProByCol(searchMap);
		return list;
	}
	
	@Override
	public List<Map<String, String>> selectCategory(Map<String, Object> searchMap) throws DataAccessException {
		List<Map<String, String>> list = probem_DAO.selectCategory(searchMap);
		return list;
	}
	
	@Override
	public List<Map<String, String>> selectTag(Map<String, Object> searchMap) throws DataAccessException {
		List<Map<String, String>> list = probem_DAO.selectTag(searchMap);
		return list;
	}
	
	@Override
	public void insertProblem(Map<String, String> inputMap) throws DataAccessException {
		probem_DAO.insertProblem(inputMap);
		
		Map<String,String> choiceMap = new HashMap<String, String>();
		choiceMap.put("pro_num", inputMap.get("pro_num"));
		for(int i=1; i<10; i++) {
			if(inputMap.get("choice"+i) != null) {
				choiceMap.put("cho_content", inputMap.get("choice"+i));
				choiceMap.put("cho_num", i+"");
				probem_DAO.insertChoice(choiceMap);
			}
		}
	}
}
