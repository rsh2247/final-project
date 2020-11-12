package project.yoonju.F.F_P001.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import project.yoonju.F.F_P001.vo.F_P001_D001VO;


public interface F_P001_D001Controller {
	public ModelAndView listScore(@RequestParam("category_id") String category_id, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView categoryScore(@RequestParam("score_content") String score_content, 
									  @RequestParam("category_id") String category_id, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView viewUser_score(@RequestParam("user_id") String user_id, 
			   						   @RequestParam("category_id") String category_id, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView searchUser(@RequestParam("user_id") String user_id, 
								   @RequestParam("category_id") String category_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView listSubject(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
