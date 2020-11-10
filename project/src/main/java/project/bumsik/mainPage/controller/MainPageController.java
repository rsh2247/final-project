package project.bumsik.mainPage.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.web.servlet.ModelAndView;

public interface MainPageController {

	public ModelAndView mainGroupRank(Locale locale, HttpServletRequest request, HttpServletResponse response) throws Exception;

}
