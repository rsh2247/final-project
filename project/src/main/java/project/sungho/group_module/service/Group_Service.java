package project.sungho.group_module.service;

import java.util.List;
import java.util.Map;

public interface Group_Service {
	
	public void insertGroup(Map<String, Object> inputMap);
	
	public List<Map<String, Object>> selectWholeGroup();
	
}
