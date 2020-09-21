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

import project.sungho.pro_collection_module.service.ProCollection_Service;
import project.sungho.pro_collection_module.vo.ProCollection_VO;
import project.sungho.problem_solve_module.service.Problem_Service;
import project.sungho.problem_solve_module.vo.ProblemExample_VO;
import project.sungho.problem_solve_module.vo.Problem_VO;

@Controller
public class PS_ControllerImpl implements PS_Controller {
	
	@Autowired
	Problem_Service problem_Service;
	@Autowired
	ProCollection_Service proCollection_Service;
	
	@Autowired
	Problem_VO problem_VO;
	@Autowired
	ProblemExample_VO problemExample_VO;
	@Autowired
	ProCollection_VO proCollection_VO;


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
		List<Problem_VO> list1 = problem_Service.searchProblem(searchMap);
		List<ProblemExample_VO> list2 = problem_Service.searchExample(searchMap);
		ModelAndView mav = new ModelAndView("problem_solve/problem_page.tiles");
		mav.addObject("list1", list1);
		mav.addObject("list2", list2);
		
		return mav;
	}

	
	@Override
	@RequestMapping(value = "**/check_answer.pro", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView checkAnswer(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String answer = (String)request.getParameter("answer");
		String correct = "";
		Map<String, Object> searchMap = new HashMap<String, Object>();
		List<Problem_VO> list = problem_Service.searchProblem(searchMap);
		String proanswer = ((Problem_VO) list.get(0)).getPro_answer();
		if(answer.equals(proanswer)) correct = "정답입니다.";
		else correct = "틀렸습니다 다시한번 확인하세요.";
		
		ModelAndView mav = new ModelAndView("problem_solve/answer_page.tiles");
		mav.addObject("correct", correct);
		mav.addObject("list", list);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "**/colselect_page.pro", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView colSelectPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String category = request.getParameter("category");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("category", category);
		List<ProCollection_VO> list = proCollection_Service.searchCategoryCollection(searchMap);
		
		ModelAndView mav = new ModelAndView("problem_solve/col_select_page.tiles");
		mav.addObject("list", list);
		return mav;
	}

	@Override
	@RequestMapping(value = "**/userColselect_page.pro", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView userColSelectPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String category = request.getParameter("category");
		return null;
	}

	@Override
	@RequestMapping(value = "**/collection_page.pro", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView collectionPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String col_num = request.getParameter("number");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("col_num", col_num);
		
		List<Problem_VO> list = problem_Service.selectProByCol(searchMap);
		ModelAndView mav = new ModelAndView("problem_solve/pro_collection_page.tiles");
		mav.addObject("list", list);
		return mav;
	}
	
	

}
