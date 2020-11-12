package project.sungho.managerModule.controller;

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
import project.sungho.problem_solve_module.service.Problem_Service;
import project.sungho.security.member.UserAuthenticationService;

@Controller
public class ManagerController {
	
	@Autowired
	UserAuthenticationService customUser_Service;
	
	@Autowired
	Problem_Service problem_Service;
	
	@Autowired
	Group_Service group_Service;
	
	@RequestMapping(value = "manager/mainPage", method = { RequestMethod.GET })
	public ModelAndView colMake_mainPage(@RequestParam Map<String,Object> inputMap ,HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("manager/m001_managerPage.jsp");
		mav.addObject("userlist", customUser_Service.selectWholeUser(inputMap));
		mav.addObject("prolist", problem_Service.searchList(inputMap));
		return mav;
	}
	
	@RequestMapping(value = "manager/problem", method = { RequestMethod.GET })
	public ModelAndView problem(@RequestParam Map<String,Object> inputMap ,HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("manager/m002_problem.jsp");
		mav.addObject("prolist", problem_Service.searchList(inputMap));
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "manager/delete_problem", method = { RequestMethod.POST })
	public void delete_problem(@RequestParam Map<String,Object> inputMap ,HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
	}
	
	@RequestMapping(value = "manager/collection", method = { RequestMethod.GET })
	public ModelAndView collection(@RequestParam Map<String,Object> inputMap ,HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("manager/m003_collection.jsp");
		mav.addObject("collist", problem_Service.selectWholeCollection(inputMap));
		return mav;
	}
	@RequestMapping(value = "manager/group", method = { RequestMethod.GET })
	public ModelAndView group(@RequestParam Map<String,Object> inputMap ,HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("manager/m004_group.jsp");
		mav.addObject("grouplist", group_Service.selectWholeGroup());
		return mav;
	}
	@RequestMapping(value = "manager/post", method = { RequestMethod.GET })
	public ModelAndView post(@RequestParam Map<String,Object> inputMap ,HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("manager/m005_post.jsp");
		return mav;
	}
	@RequestMapping(value = "manager/user", method = { RequestMethod.GET })
	public ModelAndView user(@RequestParam Map<String,Object> inputMap ,HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("manager/m006_userPage.jsp");
		mav.addObject("userlist", customUser_Service.selectWholeUser(inputMap));
		return mav;
	}
	
}
