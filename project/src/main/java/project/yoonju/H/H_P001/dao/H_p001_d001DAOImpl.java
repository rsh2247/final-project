package project.yoonju.H.H_P001.dao;

import java.util.ArrayList;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

//import com.myspring.pro30.board.vo.ArticleVO;
//import com.myspring.pro30.board.vo.ImageVO;

import project.yoonju.H.H_P001.vo.H_p001_d001VO;
import project.yoonju.H.H_P001.vo.ImageVO;


@Repository("h_p001_d001DAOImpl")
public class H_p001_d001DAOImpl implements H_p001_d001DAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List selectAllArticlesList() throws DataAccessException {
		List<H_p001_d001VO> articlesList = articlesList = sqlSession.selectList("mapper.H.H_P001.selectAllArticlesList");
		return articlesList;
	}

	
	@Override
	public String insertNewArticle(Map articleMap) throws DataAccessException {
		String post_num = selectNewArticleNO();
		articleMap.put("post_num", post_num);
		sqlSession.insert("mapper.H.H_P001.insertNewArticle",articleMap);
		return post_num;
	}
    
	//다중 파일 업로드
	/*
	@Override
	public void insertNewImage(Map articleMap) throws DataAccessException {
		List<ImageVO> imageFileList = (ArrayList)articleMap.get("imageFileList");
		int articleNO = (Integer)articleMap.get("articleNO");
		int imageFileNO = selectNewImageFileNO();
		for(ImageVO imageVO : imageFileList){
			imageVO.setImageFileNO(++imageFileNO);
			imageVO.setArticleNO(articleNO);
		}
		sqlSession.insert("mapper.board.insertNewImage",imageFileList);
	}
	
   */
	
	@Override
	public H_p001_d001VO selectArticle(String post_num) throws DataAccessException {
		return sqlSession.selectOne("mapper.H.H_P001.selectArticle", post_num);
	}

	@Override
	public void updateArticle(Map articleMap) throws DataAccessException {
		sqlSession.update("mapper.H.H_P001.updateArticle", articleMap);
	}

	@Override
	public void deleteArticle(String post_num) throws DataAccessException {
		sqlSession.delete("mapper.H.H_P001.deleteArticle", post_num);
		
	}
	
	@Override
	public List selectImageFileList(String post_num) throws DataAccessException {
		List<ImageVO> imageFileList = null;
		imageFileList = sqlSession.selectList("mapper.H.H_P001.selectImageFileList",post_num);
		return imageFileList;
	}
	
	private String selectNewArticleNO() throws DataAccessException {
		return sqlSession.selectOne("mapper.H.H_P001.selectNewArticleNO");
	}
	
	private String selectNewImageFileNO() throws DataAccessException {
		return sqlSession.selectOne("mapper.H.H_P001.selectNewImageFileNO");
	}
	
}
