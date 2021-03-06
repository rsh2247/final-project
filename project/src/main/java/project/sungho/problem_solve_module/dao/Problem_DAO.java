package project.sungho.problem_solve_module.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.sungho.problem_solve_module.vo.ProblemExample_VO;
import project.sungho.problem_solve_module.vo.Problem_VO;

public interface Problem_DAO {
	
	public List<Map<String, Object>> searchList(Map<String, Object> searchMap) throws DataAccessException;
	
	public List<Map<String, Object>> searchListCategory(Map<String, Object> searchMap) throws DataAccessException;

	public List<Map<String, Object>> searchProblem(Map<String, Object> searchMap) throws DataAccessException;

	public List<Map<String, Object>> searchExample(Map<String, Object> searchMap) throws DataAccessException;

	public List<Map<String, Object>> selectCollection(Map<String, Object> searchMap) throws DataAccessException;
	
	public List<Map<String, Object>> selectProByCol(Map<String, Object> searchMap) throws DataAccessException;
	
	public List<Map<String, String>> selectCategory(Map<String, Object> searchMap) throws DataAccessException;
	
	public List<Map<String, String>> selectTag(Map<String, Object> searchMap) throws DataAccessException;
	
	public void insertProblem(Map<String, Object> inputMap) throws DataAccessException;
	public void insertChoice(Map<String, String> inputMap) throws DataAccessException;
	public String countCollection(Map<String, String> inputMap) throws DataAccessException;
	public void insertCollection(Map<String, Object> inputMap) throws DataAccessException;
	public void insertColList(Map<String, Object> inputMap) throws DataAccessException;
	public void insertUserAnswer(Map<String, Object> inputMap) throws DataAccessException;
	public void insertUserColHistory(Map<String, Object> inputMap) throws DataAccessException;
}
