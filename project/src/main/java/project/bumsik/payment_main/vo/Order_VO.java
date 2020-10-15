package project.bumsik.payment_main.vo;

import org.springframework.stereotype.Component;

@Component("orderVO")
public class Order_VO {
	private String order_id;
	private String user_id;
	private String lecture_id;
	private String order_date;
	private int order_price;
	
	private int discount_point;
	private int total_price;
	private char point_over;
	
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getLecture_id() {
		return lecture_id;
	}
	public void setLecture_id(String lecture_id) {
		this.lecture_id = lecture_id;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public int getOrder_price() {
		return order_price;
	}
	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}
	public int getDiscount_point() {
		return discount_point;
	}
	public void setDiscount_point(int discount_point) {
		this.discount_point = discount_point;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public char getPoint_over() {
		return point_over;
	}
	public void setPoint_over(char point_over) {
		this.point_over = point_over;
	}
	
	
	
	
}
