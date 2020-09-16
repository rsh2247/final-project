package project.txtest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

@Controller
public class AccountController {
	@Autowired
	private AccountService accService;
	
	@RequestMapping(value = "/account/sendMoney.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView sendMoney(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		accService.sendMoney();
		mav.setViewName("result");
		return mav;
	}
}
