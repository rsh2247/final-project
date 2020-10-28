package project.bumsik.calendar.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import project.bumsik.calendar.dao.Calendar_DAO;

@Service("calendar_Service")
public class Calendar_ServiceImpl implements Calendar_Service{
	@Autowired
	Calendar_DAO calendar_DAO;
	
	@Override
	public List<Map<String, Object>> calendar_load(Map<String, Object> calMap) {
		List<Map<String, Object>> list = calendar_DAO.calendar_load(calMap);
		return list;
	}

	@Override
	public void calendar_insertEvent(Map<String, Object> dataMap) throws DataAccessException {
		calendar_DAO.calendar_insertEvent(dataMap);
		
	}

}
