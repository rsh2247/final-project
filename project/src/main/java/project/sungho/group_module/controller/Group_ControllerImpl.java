package project.sungho.group_module.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.sungho.group_module.service.Group_Service;
import project.sungho.group_module.service.Group_ServiceImpl;

@Controller
public class Group_ControllerImpl {

	@Autowired
	Group_Service group_Service;

	@RequestMapping(value = "group/groupmain", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView groupmain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("group/groupWholeList.tiles");
		mav.addObject("list", group_Service.selectWholeGroup());
		return mav;
	}
	
	@RequestMapping(value = "group/groupmaking.user", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView groupmaking(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("group/groupMake.tiles");
		return mav;
	}

	@RequestMapping(value = "group/make_newGroup.user", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView make_newGroup(@RequestParam HashMap<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		group_Service.insertGroup(paramMap);
		ModelAndView mav = new ModelAndView("group/groupWholeList.tiles");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "**/ajaxGroupSelect.pro", method = { RequestMethod.GET, RequestMethod.POST })
	public Map<String, Object> groupAjax(@RequestParam HashMap<String, Object> paramMap,HttpServletRequest request, HttpServletResponse response) throws Exception {
		return group_Service.selectOneGroup(paramMap);
	}
	
	@RequestMapping(value = "**/groupPage_main.group", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView groupPage(@RequestParam HashMap<String, Object> paramMap,HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String,Object> resultMap = group_Service.checkMemberState(paramMap);
		ModelAndView mav = new ModelAndView("group/groupPage_main.tiles");
		System.out.println("그룹메인 - "+resultMap);
		mav.addObject("result", resultMap);
		return mav;
	}
	
	@RequestMapping(value = "group/groupPage_managing.user", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView groupManaging(@RequestParam HashMap<String, Object> paramMap,HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("group/groupPage_managing.tiles");
		System.out.println("그룹관리 - "+paramMap);
		return mav;
	}
}
