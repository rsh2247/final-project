package project.yoonju.F.F_P001.service;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.yoonju.F.F_P001.dao.F_P001_D001DAO;
import project.yoonju.F.F_P001.vo.F_P001_D001VO;

/*import project.yoonju.H.H_P001.dao.H_p001_d001DAO;
import project.yoonju.H.H_P001.vo.H_p001_d001VO;
import project.yoonju.H.H_P001.vo.ImageVO;*/

/*import com.myspring.pro30.board.dao.H_p001_d001DAO;
import com.myspring.pro30.board.vo.H_p001_d001VO;
import com.myspring.pro30.board.vo.ImageVO;*/



@Service("scoreService")
@Transactional(propagation = Propagation.REQUIRED)
public class F_P001_D001ServiceImpl  implements F_P001_D001Service{
	
	@Autowired
	F_P001_D001DAO scoreDAO;
	
	public List<F_P001_D001VO> allScoreList() throws Exception{
		List<F_P001_D001VO> scoreList =  scoreDAO.selectAllScoreList();
		System.out.println("서비스임플에 있는 scoreList에 담긴 것---->" + scoreList);
        return scoreList;
	}

	
	public List<F_P001_D001VO> selectScorelist_categoryScore(String score_category) throws Exception{
		List<F_P001_D001VO> scoreList =  scoreDAO.selectScorelist_categoryScore(score_category);
		System.out.println("서비스임플에 있는 scoreList에 담긴 것---->" + scoreList);
        return scoreList;
		
	}
	

	public List<F_P001_D001VO> viewUser_Score(String user_id) throws Exception{
		List<F_P001_D001VO> scoreList =  scoreDAO.viewUser_score(user_id);
		System.out.println("서비스임플에 있는 scoreList에 담긴 것---->" + scoreList);
        return scoreList;
	}
	
}
