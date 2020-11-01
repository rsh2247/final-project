package project.bom.lecture.vo;

import org.springframework.stereotype.Component;


@Component
public class ContentVO {
	private String lecture_id;
	private String lec_content_id;
	private String lec_link;
	
	public String getLec_link() {
		return lec_link;
	}
	public void setLec_link(String lec_link) {
		this.lec_link = lec_link;
	}
	public String getLecture_id() {
		return lecture_id;
	}
	public void setLecture_id(String lecture_id) {
		this.lecture_id = lecture_id;
	}
	public String getLec_content_id() {
		return lec_content_id;
	}
	public void setLec_content_id(String lec_content_id) {
		this.lec_content_id = lec_content_id;
	}
	
}
