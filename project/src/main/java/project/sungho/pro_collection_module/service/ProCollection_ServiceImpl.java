package project.sungho.pro_collection_module.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.sungho.pro_collection_module.dao.ProCollection_DAO;
import project.sungho.pro_collection_module.vo.ProCollection_VO;


@Service("proCollection_Service")
@Transactional(propagation = Propagation.REQUIRED)
public class ProCollection_ServiceImpl implements ProCollection_Service {
	
	@Autowired
	ProCollection_DAO proCollection_DAO;

	@Override
	public List<ProCollection_VO> searchWholeCollection(Map<String, Object> searchMap) throws DataAccessException {
		List<ProCollection_VO> list = proCollection_DAO.searchWholeList(searchMap);
		return list;
	}

	@Override
	public List<ProCollection_VO> searchCategoryCollection(Map<String, Object> searchMap) throws DataAccessException {
		List<ProCollection_VO> list = proCollection_DAO.searchCategoryList(searchMap);
		return list;
	}
	
	
	
}
