package project.sungho.problem_solve_module.service;

import java.util.ArrayList;
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
		for(int i=0; i<list.size()-1; i++) {
			if(list.get(i).get("PRO_NUM").equals(list.get(i+1).get("PRO_NUM"))) {
				if(!list.get(i).containsKey("ordList")) {
					List<Map<String,Object>> ordList = new ArrayList<Map<String,Object>>();
					Map<String,Object> map = new HashMap<String, Object>();
					Map<String,Object> map2 = new HashMap<String, Object>();
					map.put("cho_num",list.get(i).get("CHO_NUM"));
					map.put("cho_content",list.get(i).get("CHO_CONTENT"));
					map2.put("cho_num",list.get(i+1).get("CHO_NUM"));
					map2.put("cho_content",list.get(i+1).get("CHO_CONTENT"));
					ordList.add(map);
					ordList.add(map2);
					list.get(i).put("ordList", ordList);
				}else {
					Map<String,Object> map = new HashMap<String, Object>();
					map.put("cho_num",list.get(i+1).get("CHO_NUM"));
					map.put("cho_content",list.get(i+1).get("CHO_CONTENT"));
					((List<Map<String,Object>>)list.get(i).get("ordList")).add(map);
				}
				list.remove(i+1);
				i--;
			}
		}
		return list;
	}
	
	
	@Override
	public List<Map<String, Object>> checkColAnswer(List<Map<String, Object>> list, Map<String,Object> answerMap) throws DataAccessException {
		System.out.println(">>>>>>>>>>>>list<<<<<<<<<<");
		System.out.println(list);
		System.out.println(">>>>>>>>>>>>answerMap<<<<<<<<<<");
		System.out.println(answerMap);
		for(String key:answerMap.keySet()) {
			if(key.contains("answer")) {
				String num = key.split("answer")[1];
				System.out.println(num);
				String answer = ((String) answerMap.get(key));
				
			}
		}
		
		return null;
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
		problem_DAO.insertCollection(inputMap);
		int i = 1;
		while (inputMap.containsKey("pro_num" + i)) {
			Map<String, Object> listMap = new HashMap<String, Object>();
			listMap.put("pro_num", inputMap.get("pro_num" + i));
			listMap.put("col_list_num", i);
			listMap.put("col_list_point", Integer.parseInt(inputMap.get("score" + i)));
			problem_DAO.insertColList(listMap);
			i++;
		}
	}

	

}
