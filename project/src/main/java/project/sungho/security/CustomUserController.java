package project.sungho.security;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.sungho.problem_solve_module.service.Problem_Service;
import project.sungho.security.member.MailSendService;
import project.sungho.security.member.UserAuthenticationService;

@Controller
public class CustomUserController {
	
	@Autowired
	UserAuthenticationService customUser_Service;
	@Autowired
	MailSendService mss;
	
	@RequestMapping(value = "**/loginPage.login", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView search(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/user/signIn.tiles");
		return mav;
	}
	
	@RequestMapping(value = "**/logout.logout", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return null;
	}
	
	@RequestMapping(value = "/access_error.login", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView errorPage(Authentication auth) {
		ModelAndView mav = new ModelAndView("");
		return null;
	}
	
	@RequestMapping(value = "**/user.signUp", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView signUp(@RequestParam HashMap<String, Object> inputMap ,HttpServletRequest request, HttpServletResponse response) throws Exception {
		//customUser_Service.signUp(inputMap);
		String authkey = mss.sendAuthMail((String) inputMap.get("email"));
		System.out.println(authkey);
		ModelAndView mav = new ModelAndView("/user/signIn.tiles");
		return mav;
	}

}
