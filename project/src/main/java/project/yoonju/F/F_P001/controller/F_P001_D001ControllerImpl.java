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
import project.yoonju.F.F_P001.vo.F_P001_D001VO2;


@Controller("scoreController")
public class F_P001_D001ControllerImpl implements F_P001_D001Controller {
	@Autowired
	F_P001_D001Service scoreService;
	@Autowired
	F_P001_D001VO f_p001_d001vo;
	
	
	@Override
	@RequestMapping(value = "F/F_P001/listScore.page", method = { RequestMethod.GET, RequestMethod.POST })				//전체랭킹 보기
	public ModelAndView listScore(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = "/F_P001/listScore.tiles";
		System.out.println("뷰네임-------------" + viewName);
		List<F_P001_D001VO> scoreList = scoreService.allScoreList();	//모든 유저의 종합점수
		List<F_P001_D001VO> categoryList1 = scoreService.selectScorelist_categoryScore("1");	//모든 유저의 카테고리 1 종합점수
		List<F_P001_D001VO> categoryList2 = scoreService.selectScorelist_categoryScore("2");	//모든 유저의 카테고리 2 종합점수

		System.out.println("CON===============>>" + scoreList.size());
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("categoryList1",categoryList1);
		mav.addObject("categoryList2",categoryList2);
		mav.addObject("scoreList", scoreList);
		System.out.println(scoreList.toString());
		
		System.out.println("카테고리리스트1에 담긴 것--------->" + categoryList1);
		System.out.println("스코어리스트에 담긴 것--------->" + scoreList);
		return mav;
	}

	@Override
	@RequestMapping(value = "F/F_P001/categoryScore.page", method = { RequestMethod.GET, RequestMethod.POST })				//카테고리별랭킹 보기
	public ModelAndView categoryScore(@RequestParam("score_category") String score_category, HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		String viewName = "/F_P001/categoryScore.tiles";
		System.out.println("뷰네임-------------" + viewName);
		List<F_P001_D001VO> scoreList = scoreService.selectScorelist_categoryScore(score_category);
		List<F_P001_D001VO> categoryList1 = scoreService.selectScorelist_categoryScore("1");	//모든 유저 1 카테고리 접수 합계
		List<F_P001_D001VO> categoryList2 = scoreService.selectScorelist_categoryScore("2");	//모든 유저 2 카테고리 점수 합계
		List<F_P001_D001VO> allScoreList = scoreService.allScoreList();	//모든 유저의 종합점수
		

		System.out.println("CON===============>>" + scoreList.size());
		ModelAndView mav = new ModelAndView(viewName);
		
		mav.addObject("scoreList", scoreList);
		mav.addObject("categoryList1",categoryList1);
		mav.addObject("categoryList2",categoryList2);
		mav.addObject("allScoreList", allScoreList);
		
		System.out.println(scoreList.toString());
		return mav;
	}
	
	
	@Override
	@RequestMapping(value = "F/F_P001/viewUser_score.page", method = {RequestMethod.GET, RequestMethod.POST})	//유저정보 보기
	public ModelAndView viewUser_score(@RequestParam("user_id") String user_id, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String viewName = "/F_P001/viewUser_score.tiles";
		System.out.println("뷰네임-------------" + viewName);
		List<F_P001_D001VO> categoryList1 = scoreService.selectScorelist_categoryScore("1");	//모든 유저 1 카테고리 접수 합계
		List<F_P001_D001VO> categoryList2 = scoreService.selectScorelist_categoryScore("2");	//모든 유저 2 카테고리 점수 합계
		List<F_P001_D001VO> categoryInfo1 = scoreService.categoryInfo1(user_id);	//셀렉 유저 1 카테고리 문제 리스트
		List<F_P001_D001VO> categoryInfo2 = scoreService.categoryInfo2(user_id);	//셀렉 유저 2 카테고리 문제 리스트
		List<F_P001_D001VO> scoreList = scoreService.viewUser_Score(user_id);	//셀렉 유저 스코어 정보(유저 아이디. 유저 이미지, 유저 종합 점수)
		List<F_P001_D001VO> userInfo = scoreService.selectUserInfo(user_id);	// 셀렉 유저 정보(유저 아이디, 유저 이메일, 유저 이미지, 유저 가입날짜)
		
		System.out.println("CON===============>>" + scoreList.size());
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("scoreList", scoreList);
		mav.addObject("categoryList1",categoryList1);
		mav.addObject("categoryList2",categoryList2);
		mav.addObject("categoryInfo1", categoryInfo1);
		mav.addObject("categoryInfo2", categoryInfo2);
		mav.addObject("userInfo", userInfo);

		 for(F_P001_D001VO a : scoreList) {
			 System.out.println("user_image : "+a.getUser_image()); 
		 	}
		System.out.println(scoreList.toString());
		return mav;
	}
	
	
	@Override
	@RequestMapping(value = "F/F_P001/searchUser.page", method = {RequestMethod.GET})		//유져 검색
	public ModelAndView searchUser(@RequestParam("searchUser") String user_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName ="/F_P001/searchUser.tiles";
		List<F_P001_D001VO> scoreList = scoreService.searchUser(user_id);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("scoreList", scoreList);
		System.out.println("CON===============>>" + scoreList.size());
		System.out.println("뷰네임-------------" + viewName);
		return mav;
		
	}
}
