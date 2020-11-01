package project.bumsik.calendar.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface Calendar_Controller {

	public List<Map<String, Object>> calendar_load(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public void calendar_insertEvent(Map<String, Object> dataMap, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public void calendar_modifyEvent(Map<String, Object> dataMap, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public void calendar_deleteEvent(@RequestParam(value="cal_id",required = false) String cal_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public void calendar_resizeEvent(Map<String, Object> dataMap, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public void calendar_dragEvent(Map<String, Object> dataMap, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView calendar_main(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
