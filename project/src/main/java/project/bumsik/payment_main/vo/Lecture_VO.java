package project.bumsik.payment_main.vo;

import org.springframework.stereotype.Component;

@Component("lectureVO")
public class Lecture_VO {
	private String lecture_id;
	private String lecture_category;
	private String lecture_name;
	private String user_id;
	private int lecture_tuition;
	
	public String getLecture_id() {
		return lecture_id;
	}
	public void setLecture_id(String lecture_id) {
		this.lecture_id = lecture_id;
	}
	public String getLecture_category() {
		return lecture_category;
	}
	public void setLecture_category(String lecture_category) {
		this.lecture_category = lecture_category;
	}
	public String getLecture_name() {
		return lecture_name;
	}
	public void setLecture_name(String lecture_name) {
		this.lecture_name = lecture_name;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getLecture_tuition() {
		return lecture_tuition;
	}
	public void setLecture_tuition(int lecture_tuition) {
		this.lecture_tuition = lecture_tuition;
	}
	
	
}
