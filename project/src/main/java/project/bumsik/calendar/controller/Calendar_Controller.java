package project.bumsik.calendar.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Calendar_Controller {

	public List<Map<String, Object>> calendar_load(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public void calendar_insertEvent(Map<String, Object> dataMap, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public void calendar_modifyEvent(Map<String, Object> dataMap, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public void calendar_deleteEvent(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
