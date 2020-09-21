package project.sungho.pro_collection_module.vo;

import org.springframework.stereotype.Component;

@Component("proCollection_VO")
public class ProCollection_VO {
	private String pro_num,col_num,col_list_num,col_name;
	private int col_list_point;
	
	public ProCollection_VO() {
		super();
	}
	public ProCollection_VO(String pro_num, String col_num, String col_list_num, String col_name, int col_list_point) {
		super();
		this.pro_num = pro_num;
		this.col_num = col_num;
		this.col_list_num = col_list_num;
		this.col_name = col_name;
		this.col_list_point = col_list_point;
	}
	public String getPro_num() {
		return pro_num;
	}
	public void setPro_num(String pro_num) {
		this.pro_num = pro_num;
	}
	public String getCol_num() {
		return col_num;
	}
	public void setCol_num(String col_num) {
		this.col_num = col_num;
	}
	public String getCol_list_num() {
		return col_list_num;
	}
	public void setCol_list_num(String col_list_num) {
		this.col_list_num = col_list_num;
	}
	public int getCol_list_point() {
		return col_list_point;
	}
	public void setCol_list_point(int col_list_point) {
		this.col_list_point = col_list_point;
	}
	public String getCol_name() {
		return col_name;
	}
	public void setCol_name(String col_name) {
		this.col_name = col_name;
	}
	
}
