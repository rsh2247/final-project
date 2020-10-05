package project.sungho.problem_solve_module.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.sungho.problem_solve_module.vo.ProblemExample_VO;
import project.sungho.problem_solve_module.vo.Problem_VO;

@Repository("problem_DAO") 
public class Problem_DAOImpl implements Problem_DAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Map<String, Object>> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<Map<String, Object>> list = sqlSession.selectList("problem_solve.searchList", searchMap);
		return list;
	}

	@Override
	public List<Map<String, Object>> searchListCategory(Map<String, Object> searchMap) throws DataAccessException {
		List<Map<String, Object>> list = sqlSession.selectList("problem_solve.searchListCategory", searchMap);
		return list;
	}

	@Override
	public List<Map<String, Object>> searchProblem(Map<String, Object> searchMap) throws DataAccessException {
		List<Map<String, Object>> list = sqlSession.selectList("problem_solve.searchProblem", searchMap);
		return list;
	}

	@Override
	public List<Map<String, Object>> searchExample(Map<String, Object> searchMap) throws DataAccessException {
		List<Map<String, Object>> list = sqlSession.selectList("problem_solve.searchExample", searchMap);
		return list;
	}
	
	@Override
	public List<Map<String, Object>> selectCollection(Map<String, Object> searchMap) throws DataAccessException {
		List<Map<String, Object>> list = sqlSession.selectList("problem_solve.selectCollection", searchMap);
		return list;
	}

	@Override
	public List<Map<String, String>> selectProByCol(Map<String, Object> searchMap) throws DataAccessException {
		List<Map<String, String>> list = sqlSession.selectList("problem_solve.selectCollection", searchMap);
		return list;
	}
	
	public List<Map<String, String>> selectCategory(Map<String, Object> searchMap) throws DataAccessException {
		List<Map<String, String>> list = sqlSession.selectList("problem_make.selectCategory", searchMap);
		return list;
	}
	
	public List<Map<String, String>> selectTag(Map<String, Object> searchMap) throws DataAccessException {
		List<Map<String, String>> list = sqlSession.selectList("problem_make.selectTag", searchMap);
		return list;
	}
	
	@Override
	public void insertProblem(Map<String, String> inputMap) throws DataAccessException {
		sqlSession.update("problem_make.insertProblem", inputMap);
	}

	@Override
	public void insertChoice(Map<String, String> inputMap) throws DataAccessException {
		sqlSession.update("problem_make.insertChoice", inputMap);
	}
	@Override
	public String countCollection(Map<String, String> inputMap) throws DataAccessException {
		String answer = sqlSession.selectOne("problem_make.countCollection", inputMap);
		return answer;
	}
	
	@Override
	public void insertCollection(Map<String, String> inputMap) throws DataAccessException {
		sqlSession.update("collection_make.insertCollection", inputMap);
	}
	@Override
	public void insertColList(Map<String, Object> inputMap) throws DataAccessException {
		sqlSession.update("collection_make.insertColList", inputMap);
	}

	
}
