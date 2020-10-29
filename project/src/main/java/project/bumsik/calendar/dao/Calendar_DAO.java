package project.bumsik.calendar.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

public interface Calendar_DAO {

	public List<Map<String, Object>> calendar_load(Map<String, Object> calMap) throws DataAccessException;
	public void calendar_insertEvent(Map<String, Object> dataMap) throws DataAccessException;
	public void calendar_modifyEvent(Map<String, Object> dataMap) throws DataAccessException;
	public void calendar_deleteEvent(Map<String, Object> dataMap) throws DataAccessException;
	public void calendar_resizeDragEvent(Map<String, Object> dataMap) throws DataAccessException;
}
