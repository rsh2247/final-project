package project.sungho.problem_solve_module.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface PS_Controller {
	public ModelAndView searchCategory(@RequestParam HashMap<String, Object> paramMap,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView searchProblem(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView checkAnswer(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView userColSelectPage(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView collectionPage(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView check_colAnswer(HashMap<String, Object> paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//제작 페이지
	public ModelAndView problemMakePage(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
