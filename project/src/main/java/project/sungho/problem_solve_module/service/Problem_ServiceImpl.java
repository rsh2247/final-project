package project.sungho.problem_solve_module.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.hm.hmp001_d003.vo.Hmp001_d003VO;
import project.sungho.problem_solve_module.dao.Problem_DAO;
import project.sungho.problem_solve_module.vo.Problem_VO;

@Service("problem_Service")
@Transactional(propagation = Propagation.REQUIRED)
public class Problem_ServiceImpl implements Problem_Service {
	
	@Autowired
	private Problem_DAO probem_DAO;

	@Override
	public List<Problem_VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<Problem_VO> list = probem_DAO.searchList(searchMap);
		return list;
	}
}
