package project.bumsik.mainPage.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.web.servlet.ModelAndView;

public interface MainPageDAO {

	public List<Map<String, Object>> mainGroupRank() throws DataAccessException;

}
