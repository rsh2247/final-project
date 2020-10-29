package project.yoonju.F.F_P001.service;

import java.util.List;
import java.util.Map;

import project.yoonju.F.F_P001.vo.F_P001_D001VO;

//import com.myspring.pro30.board.vo.H_p001_d001VO;



public interface F_P001_D001Service {
	public List<F_P001_D001VO> allScoreList() throws Exception; //전체랭킹 보기
	public List<F_P001_D001VO> selectScorelist_categoryScore(String score_category) throws Exception; //카테고리랭킹 보기
	public List<F_P001_D001VO> viewUser_Score(String user_id) throws Exception; //유저정보 보기

}

	// 총점수 내역, 카테고리별 점수 내역 // 