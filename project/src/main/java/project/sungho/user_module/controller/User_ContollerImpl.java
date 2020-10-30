package project.sungho.user_module.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import project.sungho.group_module.service.Group_Service;
import project.sungho.problem_solve_module.service.Problem_Service;
import project.sungho.user_module.service.User_Service;

@Controller
public class User_ContollerImpl implements User_Contoller {
	private static final Logger logger = LoggerFactory.getLogger(User_ContollerImpl.class);

	@Autowired
	User_Service user_Service;
	
	@Autowired
	Problem_Service problem_Service;
	
	@Autowired
	Group_Service group_Service;
	
	@RequestMapping(value = "**/userPage_pro.user", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView userPage_pro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return null;
	}

	@RequestMapping(value = "userPage_col.user", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView userPage_col(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Map<String,Object>> list = user_Service.selectUserCol();
		ModelAndView mav = new ModelAndView("user/userPage_col.tiles");
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping(value = "**/userPage_col_correctsheet.user", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView userPage_col_correctsheet(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String col_num = request.getParameter("number");
		String time = request.getParameter("time");
		Map<String, Object> searchMap = new HashMap<String,Object>(); searchMap.put("col_num", col_num); searchMap.put("col_solvedate", time);
		List<Map<String, Object>> proList = problem_Service.selectProByCol(searchMap);
		List<Map<String, Object>> answerlist = user_Service.selectselectUserAnwser(searchMap);
		ModelAndView mav = new ModelAndView("user/userPage_col_correctsheet.tiles");
		mav.addObject("proList",proList);
		mav.addObject("answerList", answerlist);
		return mav;	
	}
	
	@RequestMapping(value = "userGroup.user", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView mygroup(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("user/userGroup.tiles");
		mav.addObject("list", group_Service.selectMyGroup());
		return mav;
	}
	@RequestMapping(value = "userPage_modify.user", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView userPage_modify(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("user/userPage_modify.tiles");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "uploadImage", method = { RequestMethod.POST })
	public String requestupload1(MultipartHttpServletRequest mtfRequest, HttpServletRequest request) {
		MultipartFile mf = mtfRequest.getFile("formData");
		String root_path = request.getSession().getServletContext().getRealPath("/");
		String attach_path = "resources/image/";
		String path = root_path+attach_path;
		System.out.println(path);

		String originFileName = mf.getOriginalFilename(); // 원본 파일 명
		long fileSize = mf.getSize(); // 파일 사이즈

		System.out.println("originFileName : " + originFileName);
		System.out.println("fileSize : " + fileSize);

		String safeFile = path + System.currentTimeMillis() + originFileName;

		try {
			mf.transferTo(new File(safeFile));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "redirect:upload1";
	}

}
