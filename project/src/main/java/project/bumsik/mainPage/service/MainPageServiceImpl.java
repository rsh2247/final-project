package project.bumsik.mainPage.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import project.bumsik.mainPage.dao.MainPageDAO;

@Service
public class MainPageServiceImpl implements MainPageService{
	
	@Autowired MainPageDAO mainPageDAO;

	@Override
	public List<Map<String, Object>> mainGroupRank() throws DataAccessException {
		List<Map<String, Object>> list = mainPageDAO.mainGroupRank();
		return list;
	}

}
