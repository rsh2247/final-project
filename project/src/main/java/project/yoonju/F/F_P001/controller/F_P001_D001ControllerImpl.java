package project.yoonju.F.F_P001.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.sungho.security.member.CustomUser;
import project.yoonju.F.F_P001.service.F_P001_D001Service;
import project.yoonju.F.F_P001.vo.F_P001_D001VO;


/*import com.myspring.pro30.board.service.H_p001_d001Service;
import com.myspring.pro30.board.vo.H_p001_d001VO;
import com.myspring.pro30.board.vo.ImageVO;
import com.myspring.pro30.member.vo.MemberVO;*/



@Controller("scoreController")
public class F_P001_D001ControllerImpl implements F_P001_D001Controller {
	@Autowired
	F_P001_D001Service scoreService;
	
	@Override
	@RequestMapping(value = "F/F_P001/listScore.page", method = { RequestMethod.GET, RequestMethod.POST })				//전체 랭킹리스트 보기
	public ModelAndView listScore(HttpServletRequest request, HttpServletResponse response) throws Exception {
	//	String viewName = (String) request.getAttribute("viewName");
		String viewName = "/F_P001/listScore.tiles";
		System.out.println("뷰네임-------------" + viewName);
		List<F_P001_D001VO> scoreList = scoreService.allScoreList();
		System.out.println("CON===============>>" + scoreList.size());
		ModelAndView mav = new ModelAndView(viewName);
		
		//CustomUser cus = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		/* mav.addOject(""); */
		mav.addObject("scoreList", scoreList);
		System.out.println(scoreList.toString());
		return mav;
	}

	@Override
	@RequestMapping(value = "F/F_P001/categoryScore.page", method = { RequestMethod.GET, RequestMethod.POST })				//카테고리별랭킹 보기
	public ModelAndView categoryScore(@RequestParam("score_category") String score_category, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = "/F_P001/categoryScore.tiles";
		System.out.println("뷰네임-------------" + viewName);
		List<F_P001_D001VO> scoreList = scoreService.selectScorelist_categoryScore(score_category);
		System.out.println("CON===============>>" + scoreList.size());
		ModelAndView mav = new ModelAndView(viewName);
		
		mav.addObject("scoreList", scoreList);
		System.out.println(scoreList.toString());
		return mav;
	}
	
	
	@Override
	@RequestMapping(value = "F/F_P001/viewUser_score.page", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView viewUser_score(@RequestParam("user_id") String user_id, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String viewName = "/F_P001/viewUser_score.tiles";
		System.out.println("뷰네임-------------" + viewName);
		List<F_P001_D001VO> scoreList = scoreService.viewUser_Score(user_id);
		System.out.println("CON===============>>" + scoreList.size());
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("scoreList", scoreList);

		System.out.println(scoreList.toString());
		return mav;
	}
	
}
