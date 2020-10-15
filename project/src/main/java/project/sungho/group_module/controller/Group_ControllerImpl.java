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
import org.springframework.web.servlet.ModelAndView;

import project.sungho.group_module.service.Group_Service;
import project.sungho.group_module.service.Group_ServiceImpl;

@Controller
public class Group_ControllerImpl {

	@Autowired
	Group_Service group_Service;

	@RequestMapping(value = "**/groupmain.group", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView groupmain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("group/groupMain.tiles");
		mav.addObject("list", group_Service.selectWholeGroup());
		return mav;
	}
	
	@RequestMapping(value = "**/groupmaking.pro", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView groupmaking(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("group/groupMake.tiles");
		return mav;
	}

	@RequestMapping(value = "**/make_newGroup.pro", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView make_newGroup(@RequestParam HashMap<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		group_Service.insertGroup(paramMap);
		ModelAndView mav = new ModelAndView("group/groupMain.tiles");
		return mav;
	}

}
