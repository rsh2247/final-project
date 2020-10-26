package project.yoonju.H.H_P001.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


public interface H_p001_d001Controller {
	
	public ModelAndView listArticles(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ResponseEntity addNewArticle(MultipartHttpServletRequest multipartRequest,HttpServletResponse response) throws Exception;
	
	public ModelAndView viewArticle(@RequestParam("psot_num") String post_num,
			                        HttpServletRequest request, HttpServletResponse response) throws Exception;
	//public ResponseEntity modArticle(MultipartHttpServletRequest multipartRequest,  HttpServletResponse response) throws Exception;
	public ResponseEntity  removeArticle(@RequestParam("post_num") String post_num,
                              HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView listPage(@RequestParam("num") int num, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ResponseEntity addrplyArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
}
