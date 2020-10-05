package project.sungho.problem_solve_module.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.sungho.problem_solve_module.vo.Problem_VO;

public interface Problem_Service {
	 public List<Map<String, Object>> searchList(Map<String, Object> searchMap) throws DataAccessException;
	 public List<Map<String, Object>> searchListCategory(Map<String, Object> searchMap) throws DataAccessException;
	 public List<Map<String, Object>> searchProblem(Map<String, Object> searchMap) throws DataAccessException;
	 public List searchExample(Map<String, Object> searchMap) throws DataAccessException;
	 public List<Map<String, Object>> selectCollection(Map<String, Object> searchMap) throws DataAccessException;
	 public List<Map<String, String>> selectProByCol(Map<String, Object> searchMap) throws DataAccessException;
	 public List<Map<String, String>> selectCategory(Map<String, Object> searchMap) throws DataAccessException;
	 public List<Map<String, String>> selectTag(Map<String, Object> searchMap) throws DataAccessException;
	 
	 public void insertProblem(Map<String, String> paramMap) throws DataAccessException;

	 public void insertCollection(Map<String, String> inputMap) throws DataAccessException;
}
