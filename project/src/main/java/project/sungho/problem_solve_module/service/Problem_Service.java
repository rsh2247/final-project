package project.sungho.problem_solve_module.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.hm.hmp001_d003.vo.Hmp001_d003VO;
import project.sungho.problem_solve_module.vo.Problem_VO;

public interface Problem_Service {
	 public List<Problem_VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	 public List<Problem_VO> searchListCategory(Map<String, Object> searchMap) throws DataAccessException;
	 public List<Problem_VO> searchProblem(Map<String, Object> searchMap) throws DataAccessException;
}
