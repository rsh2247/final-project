package project.yoonju.H.H_P001.service;

import java.util.HashMap;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

//import com.myspring.pro30.board.dao.BoardDAO;
//import com.myspring.pro30.board.vo.ArticleVO;
//import com.myspring.pro30.board.vo.ImageVO;

import project.yoonju.H.H_P001.dao.H_p001_d001DAO;
import project.yoonju.H.H_P001.vo.H_p001_d001VO;
import project.yoonju.H.H_P001.vo.ImageVO;

@Service("H_p001_d001Serice")
@Transactional(propagation = Propagation.REQUIRED)
public class H_p001_d001ServiceImpl implements H_p001_d001Service {

	@Autowired
	H_p001_d001DAO h_p001_d001DAO;
	
	public List<H_p001_d001VO> listArticles() throws Exception{
		List<H_p001_d001VO> articlesList =  h_p001_d001DAO.selectAllArticlesList();
        return articlesList;
	}

	
	//단일 이미지 추가하기
	@Override
	public String addNewArticle(Map articleMap) throws Exception{
		return h_p001_d001DAO.insertNewArticle(articleMap);
	}
	
	 //다중 이미지 추가하기
	/*
	@Override
	public int addNewArticle(Map articleMap) throws Exception{
		int articleNO = boardDAO.insertNewArticle(articleMap);
		articleMap.put("articleNO", articleNO);
		boardDAO.insertNewImage(articleMap);
		return articleNO;
	}
	*/
	/*
	//다중 파일 보이기
	@Override
	public Map viewArticle(int articleNO) throws Exception {
		Map articleMap = new HashMap();
		ArticleVO articleVO = boardDAO.selectArticle(articleNO);
		List<ImageVO> imageFileList = boardDAO.selectImageFileList(articleNO);
		articleMap.put("article", articleVO);
		articleMap.put("imageFileList", imageFileList);
		return articleMap;
	}
   */
	
	
	 //단일 파일 보이기
	@Override
	public H_p001_d001VO viewArticle(String post_num) throws Exception {
		H_p001_d001VO h_p001_d001VO = h_p001_d001DAO.selectArticle(post_num);
		return h_p001_d001VO;
	}
	
	
	@Override
	public void modArticle(Map articleMap) throws Exception {
		h_p001_d001DAO.updateArticle(articleMap);
	}
	
	@Override
	public void removeArticle(String post_num) throws Exception {
		h_p001_d001DAO.deleteArticle(post_num);
	}
	

	
}

