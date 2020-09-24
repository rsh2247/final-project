package project.bumsik.payment_kakao.vo;

import java.util.Date;

import org.springframework.stereotype.Component; 

@Component
public class KakaoPayReadyVO {
    
    //response
    private String tid; 
    private String next_redirect_pc_url;
	private Date created_at;
	 
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getNext_redirect_pc_url() {
		return next_redirect_pc_url;
	}
	public void setNext_redirect_pc_url(String next_redirect_pc_url) {
		this.next_redirect_pc_url = next_redirect_pc_url;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
    
}