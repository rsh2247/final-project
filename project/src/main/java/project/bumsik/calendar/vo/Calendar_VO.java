package project.bumsik.calendar.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("calendarVO")
public class Calendar_VO {
	private String cal_id;
	private Date cal_date;
	private String cal_content;
	private Date cal_startdate;
	private Date cal_enddate;
	private String cal_category;
	private String user_id;
	
	private String backgroundColor;
	private String textColor;
	private boolean allDay;
		
	public String getCal_id() {
		return cal_id;
	}
	public void setCal_id(String cal_id) {
		this.cal_id = cal_id;
	}
	public Date getCal_date() {
		return cal_date;
	}
	public void setCal_date(Date cal_date) {
		this.cal_date = cal_date;
	}
	public String getCal_content() {
		return cal_content;
	}
	public void setCal_content(String cal_content) {
		this.cal_content = cal_content;
	}
	public Date getCal_startdate() {
		return cal_startdate;
	}
	public void setCal_startdate(Date cal_startdate) {
		this.cal_startdate = cal_startdate;
	}
	public Date getCal_enddate() {
		return cal_enddate;
	}
	public void setCal_enddate(Date cal_enddate) {
		this.cal_enddate = cal_enddate;
	}
	public String getCal_category() {
		return cal_category;
	}
	public void setCal_category(String cal_category) {
		this.cal_category = cal_category;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	public String getBackgroundColor() {
		return backgroundColor;
	}
	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}
	public String getTextColor() {
		return textColor;
	}
	public void setTextColor(String textColor) {
		this.textColor = textColor;
	}
	public boolean isAllDay() {
		return allDay;
	}
	public void setAllDay(boolean allDay) {
		this.allDay = allDay;
	}
	
}
