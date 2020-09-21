package project.sungho.pro_collection_module.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.sungho.pro_collection_module.vo.ProCollection_VO;


public interface ProCollection_DAO {
	
	public List<ProCollection_VO> searchWholeList(Map<String, Object> searchMap) throws DataAccessException;
	public List<ProCollection_VO> searchCategoryList(Map<String, Object> searchMap) throws DataAccessException;
	public ProCollection_VO searchColByNum(Map<String, Object> searchMap) throws DataAccessException;

}
