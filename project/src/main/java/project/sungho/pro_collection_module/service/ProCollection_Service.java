package project.sungho.pro_collection_module.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.sungho.pro_collection_module.vo.ProCollection_VO;

public interface ProCollection_Service {
	 public List<ProCollection_VO> searchWholeCollection(Map<String, Object> searchMap) throws DataAccessException;
	 public List<ProCollection_VO> searchCategoryCollection(Map<String, Object> searchMap) throws DataAccessException;
}
