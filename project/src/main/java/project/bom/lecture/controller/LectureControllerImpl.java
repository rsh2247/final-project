package project.bom.lecture.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import project.bom.lecture.service.LectService;
import project.bumsik.payment_main.vo.Lecture_VO;
import project.common.Pagination;

@Controller
public class LectureControllerImpl implements LectureController {
	@Autowired
	private LectService lectService;
	
	@RequestMapping("lecture/main.do")
	public String lectInit(Model model) {
		List<Lecture_VO> resultList = new ArrayList<>();
		Map<String,String> searchParam = new HashMap<>();
		searchParam.put("comparator", "count");
		searchParam.put("startIndex", "1");
		searchParam.put("endIndex", "6");
		resultList = lectService.getLectureList(searchParam);
		for(int i=0; i<resultList.size(); i++) {
			lectService.lectureTumbnailEncoder(resultList.get(i));
		}
		for(int i=0; i<resultList.size(); i++) {
			System.out.println("===========================================");
			System.out.println("========> 강좌 아이디 : " + resultList.get(i).getLecture_id());
			System.out.println("========> 강좌 카테고리 : " + resultList.get(i).getLecture_category());
			System.out.println("========> 강좌 설명 : " + resultList.get(i).getLecture_detail());
			System.out.println("========> 강좌 이름 : " + resultList.get(i).getLecture_name());
			System.out.println("========> 강좌 점수 : " + resultList.get(i).getLecture_score());
			System.out.println("========> 강좌 가격 : " + resultList.get(i).getLecture_tuition());
			System.out.println("========> 강좌 수강생수 : " + resultList.get(i).getStudentCount());
			System.out.println("========> 강좌 강사명 : " + resultList.get(i).getUser_id());
			System.out.println("===========================================");
		}
		model.addAttribute("lectureList",resultList);
		return "lecture/lectInit.tiles";
	}
	
	@RequestMapping("lecture/updateThumbnail.do")
	public String updateThumbnail(MultipartHttpServletRequest mtfRequest, Lecture_VO vo) {
		MultipartFile file = mtfRequest.getFile("image");
		if(file.getSize()!=0) {
			try {
				Map<String,Object> map = new HashMap<>();
				map.put("img", file.getBytes());
				vo.setLecture_thumbnailEncoder(map);
				lectService.updateThumbnail(vo);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return "redirect:main.do";
	}
	
	@RequestMapping("lecture/search.do")
	public String search(@RequestParam(defaultValue="") String searchKeyword, @RequestParam(defaultValue="1")int curPage, Model model) {
		Map<String,String> searchParam = new HashMap<>();
		searchParam.put("searchKeyword", searchKeyword);
		int listCnt = 0;
		listCnt = lectService.getLectureListCnt(searchParam);
		Pagination pagination = new Pagination(listCnt, curPage);
		searchParam.put("startIndex",(pagination.getStartIndex()+1)+"");
		searchParam.put("endIndex",(pagination.getStartIndex()+pagination.getPageSize())+"");
		List<Lecture_VO> resultList = new ArrayList<>();
		resultList = lectService.getLectureList(searchParam);
		for(int i=0; i<resultList.size(); i++) {
			lectService.lectureTumbnailEncoder(resultList.get(i));
		}
		for(int i=0; i<resultList.size(); i++) {
			System.out.println("===========================================");
			System.out.println("========> 강좌 아이디 : " + resultList.get(i).getLecture_id());
			System.out.println("========> 강좌 카테고리 : " + resultList.get(i).getLecture_category());
			System.out.println("========> 강좌 설명 : " + resultList.get(i).getLecture_detail());
			System.out.println("========> 강좌 이름 : " + resultList.get(i).getLecture_name());
			System.out.println("========> 강좌 점수 : " + resultList.get(i).getLecture_score());
			System.out.println("========> 강좌 가격 : " + resultList.get(i).getLecture_tuition());
			System.out.println("========> 강좌 수강생수 : " + resultList.get(i).getStudentCount());
			System.out.println("========> 강좌 강사명 : " + resultList.get(i).getUser_id());
			System.out.println("===========================================");
		}
		model.addAttribute("lectureList",resultList);
		model.addAttribute("pagination",pagination);
		model.addAttribute("searchKeyword",searchKeyword);
		return "lecture/searchList.tiles";
	}
	
	@RequestMapping("lecture/getLecture.do")
	public String getLecture(@RequestParam String lecture_id, Model model) {
		Map<String,String> searchParam = new HashMap<>();
		searchParam.put("lecture_id", lecture_id);
		Lecture_VO vo = lectService.getLecture(searchParam);
		lectService.lectureTumbnailEncoder(vo);
		model.addAttribute("lecture",vo);
		return "lecture/lectureDetail.tiles";
	}
	
	@RequestMapping("lecture/mySubLecture.do")
	public String mySubLecture(HttpServletRequest request, Model model) {
		// 세션에서 아이디 받아오기
//		String resultPath = "";
//		HttpSession session = request.getSession(false);
//		String user_id = (String)session.getAttribute("user_id");
		String user_id = "student1";
		Map<String,String> searchParam = new HashMap<>();
		searchParam.put("student_id", user_id);
		List<Lecture_VO> resultList = new ArrayList<>();
		resultList = lectService.getLectureList(searchParam);
		model.addAttribute("lectureList",resultList);
		return "lecture/mySubLectureList.tiles";
	}
	
	@RequestMapping("lecture/addLecture.do")
	public String addLecture(HttpServletRequest request) {
		// 세션에서 아이디 받아오기
//		String resultPath = "";
//		HttpSession session = request.getSession(false);
//		String user_id = (String)session.getAttribute("user_id");
//		// 로그인 체크
//		if(user_id == null || user_id.equals("")) {
//			resultPath = "로그인페이지";
//		}else {
//			resultPath = "등록 양식 폼 페이지";
//		}
//		return resultPath;
		return "lecture/addLectureForm.tiles";
	}
	
	@RequestMapping("lecture/insertLecture.do")
	public String insertLecture(MultipartHttpServletRequest mtfRequest, HttpServletRequest request, Lecture_VO vo) {
		// 세션에서 아이디 받아오기
//		HttpSession session = request.getSession(false);
//		String user_id = (String)session.getAttribute("user_id");
		String user_id = "test1";
		vo.setUser_id(user_id);
		boolean check = true;
		while(check) {
			String lecture_id = lectService.makeRandomString().toString();
			System.out.println(lecture_id);
			if(lectService.checkOverlapLectureId(lecture_id) == 1) {
				continue;
			}else {
				check = false;
				vo.setLecture_id(lecture_id);
				break;
			}
		}
		lectService.insertLecture(vo);
		MultipartFile file = mtfRequest.getFile("image");
		if(file.getSize()!=0) {
			try {
				Map<String,Object> map = new HashMap<>();
				map.put("img", file.getBytes());
				vo.setLecture_thumbnailEncoder(map);
				lectService.updateThumbnail(vo);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return "redirect:main.do";
}
}