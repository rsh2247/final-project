package project.bumsik.calendar.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.JsonParser;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import project.bumsik.calendar.service.Calendar_Service;
import project.sungho.security.member.CustomUser;

@Controller("calendar_Controller")
public class Calendar_ControllerImpl implements Calendar_Controller{
	@Autowired Calendar_Service calendar_Service;
	
	/* 캘린더 오픈시 일정 불러오기 */
	@Override
	@RequestMapping(value="/calendar_load.cal", method = { RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public List<Map<String, Object>> calendar_load(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//일정 조회, 해당 user_id
		String userId = null;
		if(SecurityContextHolder.getContext().getAuthentication().getPrincipal().equals("anonymousUser")){
			userId = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		}else {
			userId = ((CustomUser)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
		}
		
		Map<String, Object> calMap = new HashMap<String,Object>();
		calMap.put("user_id", userId);
		System.out.println("user_id : "+userId);
		List<Map<String, Object>> calList = calendar_Service.calendar_load(calMap);
		System.out.println("calList : "+calList);
		
		/* allDay db에서 가져와서 0,1을 false,true로 치환 */		
		for(Map<String, Object> row : calList) {
			String getAllDay = (String) row.get("allDay");
			if(getAllDay.equals("1")) {
				row.put("allDay", true);
			}else {
				row.put("allDay", false);				
			}
		}
	    return calList;
	}
	
	/* 일정 추가 */
	@Override
	@RequestMapping(value="/calendar_insertEvent.cal", method = { RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public void calendar_insertEvent(@RequestParam Map<String, Object> dataMap,HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("calendar_insertEvent");
		
		//일정 조회, 해당 user_id
		String userId = null;
		if(SecurityContextHolder.getContext().getAuthentication().getPrincipal().equals("anonymousUser")){
			userId = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		}else {
			userId = ((CustomUser)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
		}

		dataMap.put("user_id", userId);

		/* ajax에서 받아와서 false,true를 0,1로 치환하연 db에 저장 */
		String getAllDay = (String) dataMap.get("allDay");
		if(getAllDay.equals("false")) {
			dataMap.put("allDay", "0");
		}else {
			dataMap.put("allDay", "1");
		}
		calendar_Service.calendar_insertEvent(dataMap);
	}
	
	/* 일정수정 */
	@Override
	@RequestMapping(value="/calendar_modifyEvent.cal", method = { RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public void calendar_modifyEvent(@RequestParam Map<String, Object> dataMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("calendar_modifyEvent");

		/* ajax에서 받아와서 false,true를 0,1로 치환하연 db에 저장 */
		String getAllDay = (String) dataMap.get("allDay");
		if(getAllDay.equals("false")) {
			dataMap.put("allDay", "0");
		}else {
			dataMap.put("allDay", "1");
		}
		calendar_Service.calendar_modifyEvent(dataMap);
		System.out.println("---modify ----dataMap : "+dataMap);	
	}

	/* 일정삭제 */
	@Override
	@RequestMapping(value="/calendar_deleteEvent.cal", method = { RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public void calendar_deleteEvent(@RequestParam(value="_id",required = false) String _id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("calendar_deleteEvent"+_id);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("_id", _id);
		calendar_Service.calendar_deleteEvent(dataMap);	
	}
	
	/* resize 일정*/
	@Override
	@RequestMapping(value="/calendar_resizeEvent.cal", method = { RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public void calendar_resizeEvent(@RequestParam Map<String, Object> dataMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("calendar_resizeEvent");
		calendar_Service.calendar_resizeDragEvent(dataMap);	
	}
	
	
	/* drag 일정 */
	@Override
	@RequestMapping(value="/calendar_dragEvent.cal", method = { RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public void calendar_dragEvent(@RequestParam Map<String, Object> dataMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("calendar_dragEvent");
		calendar_Service.calendar_resizeDragEvent(dataMap);	
	}
	
	
}
