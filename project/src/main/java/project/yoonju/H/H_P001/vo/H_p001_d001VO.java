package project.yoonju.H.H_P001.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class H_p001_d001VO {
	//private int  level;		//일단 고정으로 두고 갑시다
	
	private String post_num;
	private String post_parent;
	private String post_title;
	private String post_content;
	private String imageFileName;
	private String user_id;
	private Date  post_date;
	private String board_num;
	
	public String getPost_num() {
		return post_num;
	}


	public void setPost_num(String post_num) {
		this.post_num = post_num;
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


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public Date getPost_date() {
		return post_date;
	}


	public void setPost_date(Date post_date) {
		this.post_date = post_date;
	}


	public String getBoard_num() {
		return board_num;
	}


	public void setBoard_num(String board_num) {
		this.board_num = board_num;
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
