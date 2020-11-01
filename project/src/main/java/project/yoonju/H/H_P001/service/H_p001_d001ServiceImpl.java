package project.yoonju.H.H_P001.service;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.yoonju.H.H_P001.dao.H_p001_d001DAO;
import project.yoonju.H.H_P001.vo.H_p001_d001VO;
import project.yoonju.H.H_P001.vo.ImageVO;
/*import com.myspring.pro30.board.dao.H_p001_d001DAO;
import com.myspring.pro30.board.vo.H_p001_d001VO;
import com.myspring.pro30.board.vo.ImageVO;*/



@Service("boardService")
@Transactional(propagation = Propagation.REQUIRED)
public class H_p001_d001ServiceImpl  implements H_p001_d001Service{
	@Autowired
	H_p001_d001DAO boardDAO;
	
	public List<H_p001_d001VO> listArticles() throws Exception{
		List<H_p001_d001VO> articlesList =  boardDAO.selectAllArticlesList();
        return articlesList;
	}

	
	//단일 이미지 추가하기
	@Override
	public String addNewArticle(Map articleMap) throws Exception{
		return boardDAO.insertNewArticle(articleMap);
	}
	
	@Override
	public String addrplyArticle(Map articleMap) throws Exception {
		return boardDAO.addrplyArticle(articleMap);
	}
	
	 //단일 파일 보이기
	@Override
	public H_p001_d001VO viewArticle(String post_num) throws Exception {
		H_p001_d001VO articleVO = boardDAO.selectArticle(post_num);
		return articleVO;
	}
	
	@Override
	public int count() throws Exception{
		return boardDAO.count();
	}
	
	@Override
	public List listPage(int displayPost, int postnum) throws Exception {
		return boardDAO.listPage(displayPost, postnum);
	}
	
	
	
	@Override
	public void modArticle(Map articleMap) throws Exception {
		boardDAO.updateArticle(articleMap);
	}
	
	@Override
	public void removeArticle(String post_num) throws Exception {
		boardDAO.deleteArticle(post_num);
	}


	

	
}
