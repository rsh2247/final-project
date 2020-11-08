package project.yoonju.F.F_P001.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class F_P001_D001VO {
	//score 테이블
	String score_content;	// 내역
	Date score_date;		// 시각
	String score_point;		// 점수
	String user_id;			// 아이디
	String score_category;	// 분류
	String score_rank;		//아직 안써용
	String score_totalPoint;// 합계 점수
	
	// user_table 테이블
	String user_email;		//이메일
	String user_image;		//유저 사진
	Date user_signdate;		//유저 가입일
	

	
	
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_image() {
		return user_image;
	}
	public void setUser_image(String user_image) {
		this.user_image = user_image;
	}
	public Date getUser_signdate() {
		return user_signdate;
	}
	public void setUser_signdate(Date user_signdate) {
		this.user_signdate = user_signdate;
	}
	

	
	public String getScore_totalPoint() {
		return score_totalPoint;
	}
	public void setScore_totalPoint(String score_totalPoint) {
		this.score_totalPoint = score_totalPoint;
	}
	public String getScore_rank() {
		return score_rank;
	}
	public void setScore_rank(String score_rank) {
		this.score_rank = score_rank;
	}
	public String getScore_content() {
		return score_content;
	}
	public void setScore_content(String score_content) {
		this.score_content = score_content;
	}
	public Date getScore_date() {
		return score_date;
	}
	public void setScore_date(Date score_date) {
		this.score_date = score_date;
	}
	public String getScore_point() {
		return score_point;
	}
	public void setScore_point(String score_point) {
		this.score_point = score_point;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getScore_category() {
		return score_category;
	}
	public void setScore_category(String score_category) {
		this.score_category = score_category;
	}
	
	
	
}
