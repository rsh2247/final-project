package project.sungho.mainController;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.sungho.problem_solve_module.service.Problem_Service;
import project.yoonju.F.F_P001.service.F_P001_D001Service;
import project.yoonju.member.Service.MemberService;

@Controller
public class MainControllerImpl implements MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainControllerImpl.class);
	
	@Autowired
	Problem_Service problem_Service;
	
	@Autowired
	F_P001_D001Service scoreService;
	@Override
	@RequestMapping(value = "**/*.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView search(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = request.getRequestURI().substring(7).split("\\.")[0];
		String category = request.getParameter("category");
		ModelAndView mav = new ModelAndView(url+".tiles");
		mav.addObject("category", category);
		return mav;
	}
	
	@RequestMapping(value = "main", method = { RequestMethod.GET})
	public ModelAndView mainPage(@RequestParam HashMap<String, Object> inputMap ,HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("mainPage/mainPage001.tiles");
		mav.addObject("problem", problem_Service.searchList(inputMap));
		mav.addObject("collection", problem_Service.selectWholeCollection(inputMap));
		mav.addObject("userlist", scoreService.allRoundUserScore());
		return mav;
	}
	
	@RequestMapping(value = "problem_make/colMake_mainPage", method = { RequestMethod.GET })
	public ModelAndView colMake_mainPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return new ModelAndView("problem_make/colMake_mainPage.tiles");
	}

}
