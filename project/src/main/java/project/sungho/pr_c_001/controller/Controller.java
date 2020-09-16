package project.sungho.pr_c_001.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface Controller {
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
