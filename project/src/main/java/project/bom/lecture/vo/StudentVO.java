package project.bom.lecture.vo;

import org.springframework.stereotype.Component;

@Component
public class StudentVO {
	private String lecture_id;
	private String user_id;
	private int stu_evalscore;
	private String stu_evalcontent;
	
	public String getLecture_id() {
		return lecture_id;
	}
	public void setLecture_id(String lecture_id) {
		this.lecture_id = lecture_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getStu_evalscore() {
		return stu_evalscore;
	}
	public void setStu_evalscore(int stu_evalscore) {
		this.stu_evalscore = stu_evalscore;
	}
	public String getStu_evalcontent() {
		return stu_evalcontent;
	}
	public void setStu_evalcontent(String stu_evalcontent) {
		this.stu_evalcontent = stu_evalcontent;
	}

}
