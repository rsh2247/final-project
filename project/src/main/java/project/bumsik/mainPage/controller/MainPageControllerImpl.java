package project.bumsik.mainPage.controller;

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

import project.bom.lecture.service.LectService;
import project.bumsik.mainPage.service.MainPageService;
import project.bumsik.payment_main.vo.Lecture_VO;
import project.yoonju.F.F_P001.service.F_P001_D001Service;
import project.yoonju.F.F_P001.vo.F_P001_D001VO;

@Controller
public class MainPageControllerImpl implements MainPageController{
	
	@Autowired MainPageService mainPageService;
	@Autowired F_P001_D001Service scoreService;
	@Autowired Lecture_VO lecture_VO;
	@Autowired LectService lectService;
	@Override
	@RequestMapping(value="/mainPage.main", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView mainGroupRank(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("mainPage/mainPage001.tiles"); 
		List<Map<String, Object>> groupList = mainPageService.mainGroupRank(); 
		mav.addObject("groupList",groupList);
		
		List<F_P001_D001VO> scoreList = scoreService.allScoreList();
		mav.addObject("scoreList",scoreList);
		
		Map<String,String> searchParam = new HashMap<>();
		List<Lecture_VO> lectureList = lectService.getLectureList(searchParam);
		System.out.println("resultList : "+lectureList);
		mav.addObject("lectureList",lectureList);
		
		/*
		 * List<F_P001_D001VO> userInfo = null; for(F_P001_D001VO vo : scoreList) {
		 * userInfo = scoreService.selectUserInfo(vo.getUser_id()); }
		 * mav.addObject("userInfo", userInfo);
		 * System.out.println("userInfo : "+userInfo);
		 */
		return mav;
	}
}