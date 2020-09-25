package project.yoonju.H.H_P001.dao;

import java.util.List;



import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.yoonju.H.H_P001.vo.H_p001_d001VO;


public interface H_p001_d001DAO {

	public List selectAllArticlesList() throws DataAccessException;
	public String insertNewArticle(Map articleMap) throws DataAccessException;
	//public void insertNewImage(Map articleMap) throws DataAccessException;
	
	public H_p001_d001VO selectArticle(String post_num) throws DataAccessException;
	public void updateArticle(Map articleMap) throws DataAccessException;
	public void deleteArticle(String post_num) throws DataAccessException;
	public List selectImageFileList(String post_num) throws DataAccessException;
	
}
