package project.sungho.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class loginController {
	
	
	@RequestMapping(value = "loginPage.login", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView search(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/loginModule/signIn.tiles");
		return mav;
	}
	
	@RequestMapping(value = "logout.logout", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return null;
	}
	
	@RequestMapping(value = "/access_error.login", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView errorPage(Authentication auth) {
		ModelAndView mav = new ModelAndView("");
		return null;
	}

}
