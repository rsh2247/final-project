package project.sungho.mainController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

public interface MainController {
	public ModelAndView search(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
