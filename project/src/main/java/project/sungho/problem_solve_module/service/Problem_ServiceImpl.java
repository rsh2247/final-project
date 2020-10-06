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
	private Problem_DAO problem_DAO;

	@Override
	public List<Map<String, Object>> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<Map<String, Object>> list = problem_DAO.searchList(searchMap);
		return list;
	}

	@Override
	public List<Map<String, Object>> searchListCategory(Map<String, Object> searchMap) throws DataAccessException {
		List<Map<String, Object>> list = problem_DAO.searchListCategory(searchMap);
		return list;
	}

	@Override
	public List<Map<String, Object>> searchProblem(Map<String, Object> searchMap) throws DataAccessException {
		List<Map<String, Object>> list = problem_DAO.searchProblem(searchMap);
		return list;
	}

	@Override
	public List searchExample(Map<String, Object> searchMap) throws DataAccessException {
		List<Map<String, Object>> list = problem_DAO.searchExample(searchMap);
		return list;
	}
	
	@Override
	public List<Map<String, Object>> selectCollection(Map<String, Object> searchMap) throws DataAccessException {
		List<Map<String, Object>> list = problem_DAO.selectCollection(searchMap);
		return list;
	}

	@Override
	public List<Map<String, Object>> selectProByCol(Map<String, Object> searchMap) throws DataAccessException {
		List<Map<String, Object>> list = problem_DAO.selectProByCol(searchMap);
		return list;
	}

	@Override
	public List<Map<String, String>> selectCategory(Map<String, Object> searchMap) throws DataAccessException {
		List<Map<String, String>> list = problem_DAO.selectCategory(searchMap);
		return list;
	}

	@Override
	public List<Map<String, String>> selectTag(Map<String, Object> searchMap) throws DataAccessException {
		List<Map<String, String>> list = problem_DAO.selectTag(searchMap);
		return list;
	}

	@Override
	public void insertProblem(Map<String, String> inputMap) throws DataAccessException {
		problem_DAO.insertProblem(inputMap);

		Map<String, String> choiceMap = new HashMap<String, String>();
		choiceMap.put("pro_num", inputMap.get("pro_num"));
		for (int i = 1; i < 10; i++) {
			if (inputMap.get("choice" + i) != null) {
				choiceMap.put("cho_content", inputMap.get("choice" + i));
				choiceMap.put("cho_num", i + "");
				problem_DAO.insertChoice(choiceMap);
			}
		}
	}

	@Override
	public void insertCollection(Map<String, String> inputMap) throws DataAccessException {
		inputMap.put("col_tag", "창작");
		System.out.println(inputMap);
		problem_DAO.insertCollection(inputMap);
		int i = 1;
		while (inputMap.containsKey("pro_num" + i)) {
			Map<String, Object> listMap = new HashMap<String, Object>();
			listMap.put("pro_num", inputMap.get("pro_num" + i));
			listMap.put("col_list_num", i);
			listMap.put("col_list_point", Integer.parseInt(inputMap.get("score" + i)));
			System.out.println(i + "번째 >>>" + listMap);
			problem_DAO.insertColList(listMap);
			i++;
		}
	}

	

}
