package project.sungho.pro_collection_module.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.sungho.pro_collection_module.vo.ProCollection_VO;


@Repository("proCollection_DAO")
public class ProCollection_DAOImpl implements ProCollection_DAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ProCollection_VO> searchWholeList(Map<String, Object> searchMap) throws DataAccessException {
		List<ProCollection_VO> list = sqlSession.selectList("pr.pro_collection.searchWholeList", searchMap);
		return list;
	}

	@Override
	public List<ProCollection_VO> searchCategoryList(Map<String, Object> searchMap) throws DataAccessException {
		List<ProCollection_VO> list = sqlSession.selectList("pr.pro_collection.searchCategoryList", searchMap);
		return list;
	}

	@Override
	public ProCollection_VO searchColByNum(Map<String, Object> searchMap) throws DataAccessException {
		ProCollection_VO Col = (ProCollection_VO) sqlSession.selectList("", searchMap);
		return null;
	}

}
