package project.bumsik.payment_main.vo;

import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component("lectureVO")
public class Lecture_VO {
	private String lecture_id;
	private String lecture_category;
	private String lecture_name;
	private String user_id;
	private int lecture_tuition;
	private MultipartFile lecture_thumbnail;
	private Map<String,Object> lecture_thumbnailEncoder;
	private String lecture_encodedThumbnail;
	private String lecture_detail;
	private String studentCount;
	private String lecture_score;
	
	
	
	public String getStudentCount() {
		return studentCount;
	}
	public void setStudentCount(String studentCount) {
		this.studentCount = studentCount;
	}
	public String getLecture_score() {
		return lecture_score;
	}
	public void setLecture_score(String lecture_score) {
		this.lecture_score = lecture_score;
	}
	public String getLecture_detail() {
		return lecture_detail;
	}
	public void setLecture_detail(String lecture_detail) {
		this.lecture_detail = lecture_detail;
	}
	public MultipartFile getLecture_thumbnail() {
		return lecture_thumbnail;
	}
	public void setLecture_thumbnail(MultipartFile lecture_thumbnail) {
		this.lecture_thumbnail = lecture_thumbnail;
	}
	public Map<String, Object> getLecture_thumbnailEncoder() {
		return lecture_thumbnailEncoder;
	}
	public void setLecture_thumbnailEncoder(Map<String, Object> lecture_thumbnailEncoder) {
		this.lecture_thumbnailEncoder = lecture_thumbnailEncoder;
	}
	public String getLecture_encodedThumbnail() {
		return lecture_encodedThumbnail;
	}
	public void setLecture_encodedThumbnail(String lecture_encodedThumbnail) {
		this.lecture_encodedThumbnail = lecture_encodedThumbnail;
	}
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
