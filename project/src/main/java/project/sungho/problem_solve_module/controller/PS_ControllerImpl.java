package project.sungho.problem_solve_module.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import project.sungho.problem_solve_module.service.Problem_Service;
import project.sungho.problem_solve_module.vo.Problem_VO;

@Controller
public class PS_ControllerImpl implements PS_Controller {
	
	@Autowired
	Problem_Service problem_Service;
	
	@Autowired
	Problem_VO problem_VO;

	@Override
	@RequestMapping(value = "", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView search(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = request.getRequestURI().substring(7).split("\\.")[0];
		Map<String, Object> searchMap = new HashMap<String, Object>();
		List<Problem_VO> list = problem_Service.searchList(searchMap);
		
		ModelAndView mav = new ModelAndView("problem_solve/c001_003.tiles");
		mav.addObject("list", list);
		
		return mav;
	}

	@Override
	@RequestMapping(value = "**/c001_003.pro", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchCategory(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String category = request.getParameter("category");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("category", category);
		List<Problem_VO> list = problem_Service.searchListCategory(searchMap);
		
		ModelAndView mav = new ModelAndView("problem_solve/c001_003.tiles");
		mav.addObject("list", list);
		
		return mav;
	}

	@Override
	@RequestMapping(value = "**/problem_page.pro", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchProblem(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String pro_num = request.getParameter("pro_num");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("pro_num", pro_num);
		List<Problem_VO> list = problem_Service.searchProblem(searchMap);
		
		ModelAndView mav = new ModelAndView("problem_solve/pro_page.tiles");
		mav.addObject("list", list);
		
		return mav;
	}

	
	@Override
	@RequestMapping(value = "**/check_answer.pro", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView checkAnswer(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
