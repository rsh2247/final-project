package project.bumsik.mainPage.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.web.servlet.ModelAndView;

public interface MainPageService {

	public List<Map<String, Object>> mainGroupRank() throws DataAccessException;

}
