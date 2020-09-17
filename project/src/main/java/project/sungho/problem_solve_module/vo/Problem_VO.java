package project.sungho.problem_solve_module.vo;

import org.springframework.stereotype.Component;

@Component("problem_VO")
public class Problem_VO {
	private String pro_num,pro_tag,pro_category,pro_content;

	public Problem_VO() {
		super();
	}
	public Problem_VO(String pro_num, String pro_tag, String pro_category, String pro_content) {
		super();
		this.pro_num = pro_num;
		this.pro_tag = pro_tag;
		this.pro_category = pro_category;
		this.pro_content = pro_content;
	}
	public String getPro_num() {
		return pro_num;
	}

	public void setPro_num(String pro_num) {
		this.pro_num = pro_num;
	}

	public String getPro_tag() {
		return pro_tag;
	}

	public void setPro_tag(String pro_tag) {
		this.pro_tag = pro_tag;
	}

	public String getPro_category() {
		return pro_category;
	}

	public void setPro_category(String pro_category) {
		this.pro_category = pro_category;
	}

	public String getPro_content() {
		return pro_content;
	}

	public void setPro_content(String pro_content) {
		this.pro_content = pro_content;
	}

}
