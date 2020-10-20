package project.sungho.group_module.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@RequestMapping(value = "cafe/{key1}", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView groupPage(@PathVariable("key1") String key1,@RequestParam HashMap<String, Object> paramMap,HttpServletRequest request, HttpServletResponse response) throws Exception {
		paramMap.put("num", key1);
		Map<String,Object> resultMap = group_Service.checkMemberState(paramMap);
		resultMap.putAll(group_Service.selectOneGroup(paramMap));
		ModelAndView mav = new ModelAndView("group/groupPage_main.tiles");
		mav.addObject("result", resultMap);
		mav.addObject("boardList", group_Service.selectGroupBoardList(paramMap));
		return mav;
	}
	
	@RequestMapping(value = "cafe/groupPage_managing.user", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView groupManaging(@RequestParam HashMap<String, Object> paramMap,HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String,Object> resultMap = group_Service.checkMemberState(paramMap);
		resultMap.putAll(group_Service.selectOneGroup(paramMap));
		ModelAndView mav = new ModelAndView("group/groupPage_managing.tiles");
		mav.addObject("result", resultMap);
		mav.addObject("memberList", group_Service.selectGroupMemberList(paramMap));
		mav.addObject("boardList", group_Service.selectGroupBoardList(paramMap));
		return mav;
	}
	
	@RequestMapping(value = "cafe/write.user", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView write(@RequestParam HashMap<String, Object> paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String,Object> resultMap = group_Service.checkMemberState(paramMap);
		resultMap.putAll(group_Service.selectOneGroup(paramMap));
		ModelAndView mav = new ModelAndView("group/groupPage_write.tiles");
		mav.addObject("result", resultMap);
		mav.addObject("boardList", group_Service.selectGroupBoardList(paramMap));
		return mav;
	}
	
	@RequestMapping(value = "cafe/board.user", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView viewGroupBoard(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("group/groupMake.tiles");
		return mav;
	}
	
	@RequestMapping(value = "cafe/confirm.user", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView writeconfirm(@RequestParam HashMap<String, Object> paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		group_Service.insertArticle(paramMap);
		return null;
	}
}
