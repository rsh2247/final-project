package project.sungho.problem_solve_module.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.sungho.problem_solve_module.vo.Problem_VO;

public interface Problem_Service {
	 public List<Problem_VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	 public List<Problem_VO> searchListCategory(Map<String, Object> searchMap) throws DataAccessException;
	 public List<Problem_VO> searchProblem(Map<String, Object> searchMap) throws DataAccessException;
	 public List searchExample(Map<String, Object> searchMap) throws DataAccessException;
	 public List<Map<String, String>> selectProByCol(Map<String, Object> searchMap) throws DataAccessException;
	 public List<Map<String, String>> selectCategory(Map<String, Object> searchMap) throws DataAccessException;
	 public List<Map<String, String>> selectTag(Map<String, Object> searchMap) throws DataAccessException;
	 
	 public void insertProblem(Map<String, String> paramMap) throws DataAccessException;

}
