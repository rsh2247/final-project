package project.sungho.security;

import java.awt.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.fasterxml.jackson.databind.JsonNode;

import project.sungho.problem_solve_module.service.Problem_Service;
import project.sungho.security.kakao.Kakao_RestAPI;
import project.sungho.security.member.CustomUser;
import project.sungho.security.member.MailSendService;
import project.sungho.security.member.UserAuthenticationService;

@Controller
public class CustomUserController {

	@Autowired
	UserAuthenticationService customUser_Service;
	@Autowired
	MailSendService mss;
	@Autowired
	Kakao_RestAPI kakao_API;

	@RequestMapping(value = "**/loginPage.login", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView search(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String kakaoURL = kakao_API.getAuthorizationUrl(request.getSession());
		ModelAndView mav = new ModelAndView("/user/signIn.tiles");
		mav.addObject("kakao_url", kakaoURL);
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
	public ModelAndView signUp(@RequestParam HashMap<String, Object> inputMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("user/signIn.tiles");
		if(customUser_Service.checkUserId(inputMap)) {
			mav.setViewName("user/signUp.tiles");
			return mav;
		}
		String authkey = mss.sendAuthMail((String) inputMap.get("email"), request.getContextPath());
		inputMap.put("authkey", authkey);
		customUser_Service.signUp(inputMap);
		return mav;
	}
	
	@RequestMapping(value = "signUpConfirm", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView signUpConfirm(@RequestParam HashMap<String, Object> inputMap) {
		System.out.println(inputMap);
		customUser_Service.userConfirm(inputMap);
		ModelAndView mav = new ModelAndView("/user/signIn.tiles");
		return null;
	}

	@RequestMapping(value = "/kakaoLogin", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView getKakaoSignIn(ModelMap model, @RequestParam("code") String code, HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println(code);
		JsonNode userInfo = kakao_API.getKakaoUserInfo(code);
		Map<String, Object> inputMap = new HashMap<String, Object>(); 
		inputMap.put("id", "kakao-"+userInfo.get("id").toString());
		kakao_API.checkUser(inputMap);
		CustomUser user = (CustomUser) customUser_Service.loadUserByUsername(inputMap.get("id").toString());
		Authentication auth = new UsernamePasswordAuthenticationToken(user, null, user.getAuthorities());
		SecurityContextHolder.getContext().setAuthentication(auth);
		return new ModelAndView("redirect:mainPage/mainPage001.do");
	}
	
	@ResponseBody
	@RequestMapping(value = "user/ajaxIdCheck", method = { RequestMethod.GET, RequestMethod.POST })
	public String groupAjax(@RequestParam HashMap<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		if(customUser_Service.checkUserId(paramMap)) return "1";
		else return "0";
	}
	
	
}






