package project.sungho.mainController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainControllerImpl implements MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainControllerImpl.class);


	@Override
	@RequestMapping(value = "**/*.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView search(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = request.getRequestURI().substring(7).split("\\.")[0];
		String category = request.getParameter("category");
		ModelAndView mav = new ModelAndView(url+".tiles");
		mav.addObject("category", category);
		return mav;
	}
	
	
	


}
