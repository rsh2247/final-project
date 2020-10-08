package project.yoonju.H.H_P001.vo;

import java.io.UnsupportedEncodingException;


import java.net.URLEncoder;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("h_p001_d001VO")
public class H_p001_d001VO {
	
//	private String  level;
	private String psot_num;
	private String board_num;
	private String post_parent;
	private String post_title;
	private String post_content;
	private String post_category;
	private Date   post_Date;
	private String user_id;
	private String imageFileName;
	

	
	
	public String getPsot_num() {
		return psot_num;
	}

	public void setPsot_num(String psot_num) {
		this.psot_num = psot_num;
	}

	public String getBoard_num() {
		return board_num;
	}

	public void setBoard_num(String board_num) {
		this.board_num = board_num;
	}

	public String getPost_parent() {
		return post_parent;
	}

	public void setPost_parent(String post_parent) {
		this.post_parent = post_parent;
	}

	public String getPost_title() {
		return post_title;
	}

	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}

	public String getPost_content() {
		return post_content;
	}

	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}

	public String getPost_category() {
		return post_category;
	}

	public void setPost_category(String post_category) {
		this.post_category = post_category;
	}

	public Date getPost_Date() {
		return post_Date;
	}

	public void setPost_Date(Date post_Date) {
		this.post_Date = post_Date;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	
	
	public H_p001_d001VO() {
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		try {
			if(imageFileName!= null && imageFileName.length()!=0) {
				this.imageFileName = URLEncoder.encode(imageFileName,"UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	
	

}
