package project.sungho.problem_solve_module.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface PS_Controller {
	public ModelAndView searchCategory(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView searchProblem(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView checkAnswer(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView colSelectPage(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView userColSelectPage(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView collectionPage(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
