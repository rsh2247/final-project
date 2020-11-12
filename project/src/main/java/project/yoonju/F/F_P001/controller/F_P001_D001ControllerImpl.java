package project.yoonju.F.F_P001.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
	@RequestMapping(value = "F/F_P001/choiceScore.page", method = { RequestMethod.GET, RequestMethod.POST })				//전체랭킹 보기
	public ModelAndView listSubject(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = "/F_P001/choiceScore.tiles";
				
		List<Map<String, Object>> allUserScore = scoreService.allRoundUserScore();

		List<Map<String, Object>> listSubject = scoreService.listSubject();

		ModelAndView mav = new ModelAndView(viewName);

		mav.addObject("listSubject", listSubject);
		mav.addObject("allUserScore", allUserScore);
		System.out.println("listSubject==============>>" + listSubject);
		System.out.println("allUserScore==============>>" + allUserScore);
		System.out.println(listSubject.toString());

		return mav;
	}

	
	@Override
	@RequestMapping(value = "F/F_P001/listScore.page", method = { RequestMethod.GET, RequestMethod.POST })				//전체랭킹 보기
	public ModelAndView listScore(@RequestParam("category_id") String category_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("카테고리아이디------->" + category_id);
		
		String viewName = "/F_P001/listScore.tiles";		
		ModelAndView mav = new ModelAndView(viewName);
		
		Map<String, Object> map = new HashMap <String, Object>();

		map.put("category_id", category_id);
		List<Map<String, Object>> scoreList = scoreService.allScoreList(map);
		System.out.println("scoreList===============>>" + scoreList);
		
		map.put("score_content", "문제출제");
		List<Map<String, Object>> categoryList1 = scoreService.selectScorelist_categoryScore(map);
		System.out.println("categoryList1===============>>" + categoryList1);
		
		map.put("score_content", "문제집");
		List<Map<String, Object>> categoryList2 = scoreService.selectScorelist_categoryScore(map);
		System.out.println("categoryList2===============>>" + categoryList2);

		mav.addObject("categoryList1",categoryList1);
		mav.addObject("categoryList2",categoryList2);
		mav.addObject("scoreList", scoreList);


		return mav;
	}

	@Override
	@RequestMapping(value = "F/F_P001/categoryScore.page", method = { RequestMethod.GET, RequestMethod.POST })				//카테고리별랭킹 보기
	public ModelAndView categoryScore(@RequestParam("score_content") String score_content, 
									  @RequestParam("category_id") String category_id,
									  HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = "/F_P001/categoryScore.tiles";
		ModelAndView mav = new ModelAndView(viewName);
		System.out.println("score_content : "+score_content);
		System.out.println("category_id : "+category_id);
		
		
		Map<String, Object> map = new HashMap <String, Object>();

		map.put("score_content", "문제출제");
		map.put("category_id", category_id);
		List<Map<String, Object>> categoryList1 = scoreService.selectScorelist_categoryScore(map);
		System.out.println("categoryList1===============>>" + categoryList1);
		map.put("score_content", "문제집");
		List<Map<String, Object>> categoryList2 = scoreService.selectScorelist_categoryScore(map);
		System.out.println("categoryList2===============>>" + categoryList2);
		
		List<Map<String, Object>> allScoreList = scoreService.allScoreList(map);
		System.out.println("allScoreList=============>>" + allScoreList);
		map.put("score_content", score_content);
		List<Map<String, Object>> scoreList = scoreService.selectScorelist_categoryScore(map);
		System.out.println("scoreList=============>" + scoreList);
		
		System.out.println("");
		
		System.out.println("CTRL===============>>" + scoreList.size());
		System.out.println("스코어리스트에 담긴 것--------->>" + scoreList);

		
		
		mav.addObject("categoryList1",categoryList1);
		mav.addObject("categoryList2",categoryList2);
		mav.addObject("allScoreList", allScoreList);
		mav.addObject("scoreList", scoreList);
		
		System.out.println(scoreList.toString());
		return mav;
	}
	
	
	@Override
	@RequestMapping(value = "F/F_P001/viewUser_score.page", method = {RequestMethod.GET, RequestMethod.POST})	//유저정보 보기
	public ModelAndView viewUser_score(@RequestParam("user_id") String user_id, 
									   @RequestParam(value = "category_id", required = false) String category_id, 
									   HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String viewName = "/F_P001/viewUser_score.tiles";
		ModelAndView mav = new ModelAndView(viewName);

		Map<String, Object> map = new HashMap <String, Object>();
		System.out.println("category_id: "+category_id);

		map.put("category_id", category_id);	
		map.put("score_content", "문제출제");
		List<Map<String, Object>> categoryList1 = scoreService.selectScorelist_categoryScore(map);
		
		map.put("score_content", "문제집");
		List<Map<String, Object>> categoryList2 = scoreService.selectScorelist_categoryScore(map);
		
		map.put("user_id", user_id);
		List<Map<String, Object>> userInfo = scoreService.selectUserInfo(map);
		

		map.put("user_id", user_id);
		List<Map<String, Object>> categoryInfo1 = scoreService.categoryInfo1(map);
		
		map.put("user_id", user_id);
		List<Map<String, Object>> categoryInfo2 = scoreService.categoryInfo2(map);
		
		
		
		map.put("category_id", category_id);
		map.put("user_id", user_id);
		List<Map<String, Object>> scoreList = scoreService.viewUser_Score(map); 
		

		
		System.out.println("CTRL===============>>" + scoreList.size());

		
		mav.addObject("scoreList", scoreList);
		mav.addObject("categoryList1",categoryList1);
		mav.addObject("categoryList2",categoryList2);
		mav.addObject("categoryInfo1", categoryInfo1);
		mav.addObject("categoryInfo2", categoryInfo2);
		mav.addObject("userInfo", userInfo);

		System.out.println(categoryInfo1.toString());
		System.out.println(categoryInfo2.toString());
		return mav;
	}
	
	
	@Override
	@RequestMapping(value = "F/F_P001/searchUser.page", method = {RequestMethod.GET})		//유져 검색
	public ModelAndView searchUser(@RequestParam("searchUser") String user_id, 
								   @RequestParam("category_id") String category_id, 
								   HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName ="/F_P001/searchUser.tiles";
		System.out.println("여기는 오느냐");
		ModelAndView mav = new ModelAndView(viewName);	
		Map<String, Object> map = new HashMap <String, Object>();
		
		
		map.put("user_id", user_id);
		map.put("category_id", category_id);
		List<Map<String, Object>> scoreList = scoreService.searchUser(map);
		
		mav.addObject("scoreList", scoreList);

		return mav;
		
	}
	
	//소문자로
		public Map<String, Object> changeToLowerMapKey(Map<String, Object> origin){
			   Map<String, Object> temp = new HashMap<String, Object>();  
			   Set<String> set = origin.keySet();
			   Iterator<String> e = set.iterator();

			   while(e.hasNext()){
			     String key = e.next();
			     Object value = (Object) origin.get(key);
			     temp.put(key.toLowerCase(), value);
			   }
			  origin = null;
			  return temp;
		}
}
