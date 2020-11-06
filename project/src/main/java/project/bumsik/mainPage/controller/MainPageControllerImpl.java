package project.bumsik.mainPage.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import project.bumsik.mainPage.service.MainPageService;

@Controller
public class MainPageControllerImpl implements MainPageController{
	
	@Autowired MainPageService mainPageService;
	
	@Override
	@RequestMapping(value="/groupRank.main", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView mainGroupRank(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("mainPage/mainPage001.tiles"); 
		List<Map<String, Object>> groupList = mainPageService.mainGroupRank(); 
		mav.addObject("groupList",groupList);
		return mav;
	}
}