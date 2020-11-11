package project.bumsik.mainPage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import project.bom.lecture.service.LectService;
import project.bumsik.mainPage.service.MainPageService;
import project.bumsik.payment_main.vo.Lecture_VO;
import project.yoonju.F.F_P001.service.F_P001_D001Service;
import project.yoonju.F.F_P001.vo.F_P001_D001VO;

@Controller
public class MainPageControllerImpl implements MainPageController{
	private static final Logger logger = LoggerFactory.getLogger(MainPageController.class);

	
	@Autowired MainPageService mainPageService;
	@Autowired F_P001_D001Service scoreService;
	@Autowired Lecture_VO lecture_VO;
	@Autowired LectService lectService;
	
	/* 다국어 처리를 위해 */ 
	@Autowired SessionLocaleResolver localeResolver; 
	@Autowired MessageSource messageSource;

	@Override
	@RequestMapping(value="/mainPage.main", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView mainGroupRank(Locale locale, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("mainPage/mainPage001.tiles"); 
		List<Map<String, Object>> groupList = mainPageService.mainGroupRank(); 
		mav.addObject("groupList",groupList);
		
		List<Map<String, Object>> allUserScore = scoreService.allRoundUserScore();
		mav.addObject("scoreList",allUserScore);
		
		Map<String,String> searchParam = new HashMap<>();
		List<Lecture_VO> lectureList = lectService.getLectureList(searchParam);
		System.out.println("resultList : "+lectureList);
		mav.addObject("lectureList",lectureList);
		

		return mav;
	}
	
	@RequestMapping(value = "/multilingual.main", method = RequestMethod.GET) 
	public String multilingual(Locale locale, HttpServletRequest request, Model model) throws Exception{ 
		// RequestMapingHandler로 부터 받은 Locale 객체를 출력해 봅니다. 
//		logger.info("Welcome i18n! The client locale is {}.", locale); 
		// localeResolver 로부터 Locale 을 출력해 봅니다. 
//		logger.info("Session locale is {}.", localeResolver.resolveLocale(request)); 
//		logger.info("site.title : {}", messageSource.getMessage("site.title", null, "default text", locale)); 
//		logger.info("site.count : {}", messageSource.getMessage("site.count", new String[] {"첫번째"}, "default text", locale)); 
//		logger.info("not.exist : {}", messageSource.getMessage("not.exist", null, "default text", locale)); 
		//logger.info("not.exist 기본값 없음 : {}", messageSource.getMessage("not.exist", null, locale)); 
		//JSP 페이지에서 EL 을 사용해서 arguments 를 넣을 수 있도록 값을 보낸다. 
//		model.addAttribute("siteCount", messageSource.getMessage("msg.first", null, locale)); 
		return "/multilingual.tiles"; 
	}
}