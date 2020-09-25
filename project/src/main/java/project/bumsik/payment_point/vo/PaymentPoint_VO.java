package project.bumsik.payment_point.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("payPointVO")
public class PaymentPoint_VO {
	private Date point_date;		//변동시각
	private int point_change;		//변동금액
	private int point_rest;			//포인트 잔액
	private String user_id;			//아이디
	private String point_content;	//변동내역
	
	public Date getPoint_date() {
		return point_date;
	}
	public void setPoint_date(Date point_date) {
		this.point_date = point_date;
	}
	public int getPoint_change() {
		return point_change;
	}
	public void setPoint_change(int point_change) {
		this.point_change = point_change;
	}
	public int getPoint_rest() {
		return point_rest;
	}
	public void setPoint_rest(int point_rest) {
		this.point_rest = point_rest;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPoint_content() {
		return point_content;
	}
	public void setPoint_content(String point_content) {
		this.point_content = point_content;
	}
	
	
	
	
}
