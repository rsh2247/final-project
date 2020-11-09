package project.bumsik.mainPage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.web.servlet.ModelAndView;

public interface MainPageController {

	public ModelAndView mainGroupRank(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
