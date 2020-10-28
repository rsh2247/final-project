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
		System.out.println("-------calMap : "+calMap);
		System.out.println("-------calList : "+calList); 
	    return calList;
	}
	
	/* 일정 추가 */
	@Override
	@RequestMapping(value="/calendar_insertEvent.cal", method = { RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public void calendar_insertEvent(@RequestParam Map<String, Object> dataMap,HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("calendar_insertEvent----");
		System.out.println("dataMap : "+dataMap);
		//일정 조회, 해당 user_id
		String userId = null;
		if(SecurityContextHolder.getContext().getAuthentication().getPrincipal().equals("anonymousUser")){
			userId = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		}else {
			userId = ((CustomUser)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
		}
		
		//dataMap에서 꺼내와서 쿼리 작성중..에러가 많이나서 임시로 하드코딩..
		String _id = (String) dataMap.get("eventData[_id]");
		String title = (String) dataMap.get("eventData[title]");
		String description = (String) dataMap.get("eventData[description]");
		String type = (String) dataMap.get("eventData[type]");
		String backgroundColor = (String) dataMap.get("eventData[backgroundColor]");
		String start = (String) dataMap.get("eventData[start]");
		String end = (String) dataMap.get("eventData[end]");
		
		Map<String, Object> dataMap2 = new HashMap<String, Object>();
		
		dataMap2.put("_id", _id);
		dataMap2.put("title", title);
		dataMap2.put("description", description);
		dataMap2.put("start", start);
		dataMap2.put("end", end);
		dataMap2.put("type", type);
		dataMap2.put("user_id", userId);
		dataMap2.put("backgroundColor", backgroundColor);
		
		/* ajax에서 받아와서 false,true를 0,1로 치환하연 db에 저장 */
		String getAllDay = (String) dataMap.get("eventData[allDay]");
		if(getAllDay.equals("false")) {
			dataMap2.put("allDay", "0");
		}else {
			dataMap2.put("allDay", "1");
		}
		calendar_Service.calendar_insertEvent(dataMap2);
		System.out.println("---input ----dataMap : "+dataMap2);		
	}
	
	/* 일정수정  미완성..*/
	@Override
	@RequestMapping(value="/calendar_modifyEvent.cal", method = { RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public void calendar_modifyEvent(@RequestParam Map<String, Object> dataMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("calendar_modifyEvent----");
		System.out.println("-----------------dataMap : "+dataMap);
		
		String userId = ((CustomUser)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
		
//	
//		String _id = (String) dataMap.get("eventData[_id]");
//		String title = (String) dataMap.get("eventData[title]");
//		String description = (String) dataMap.get("eventData[description]");
//		String type = (String) dataMap.get("eventData[type]");
//		String backgroundColor = (String) dataMap.get("eventData[backgroundColor]");
//		String start = (String) dataMap.get("eventData[start]");
//		String end = (String) dataMap.get("eventData[end]");
//		
//		Map<String, Object> dataMap2 = new HashMap<String, Object>();
//		
//		dataMap2.put("_id", _id);
//		dataMap2.put("title", title);
//		dataMap2.put("description", description);
//		dataMap2.put("start", start);
//		dataMap2.put("end", end);
//		dataMap2.put("type", type);
//		dataMap2.put("user_id", userId);
//		dataMap2.put("backgroundColor", backgroundColor);
//		
//		/* ajax에서 받아와서 false,true를 0,1로 치환하연 db에 저장 */
//		String getAllDay = (String) dataMap.get("eventData[allDay]");
//		if(getAllDay.equals("false")) {
//			dataMap2.put("allDay", "0");
//		}else {
//			dataMap2.put("allDay", "1");
//		}
//		calendar_Service.calendar_insertEvent(dataMap2);
//		System.out.println("---input ----dataMap : "+dataMap2);	
//		
	}
		
	/* 일정삭제 */
	@Override
	@RequestMapping(value="/calendar_deleteEvent.cal", method = { RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public void calendar_deleteEvent(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
	}
	
	
}
