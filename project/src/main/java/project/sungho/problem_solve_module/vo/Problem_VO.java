package project.sungho.problem_solve_module.vo;

import org.springframework.stereotype.Component;

@Component("problem_VO")
public class Problem_VO {
	private String pro_num,pro_tag,pro_category,pro_content,pro_name,pro_answer,pro_example;

	public Problem_VO() {
		super();
	}
	public Problem_VO(String pro_num, String pro_tag, String pro_category, String pro_content, String pro_name,
			String pro_answer, String pro_example) {
		super();
		this.pro_num = pro_num;
		this.pro_tag = pro_tag;
		this.pro_category = pro_category;
		this.pro_content = pro_content;
		this.pro_name = pro_name;
		this.pro_answer = pro_answer;
		this.pro_example = pro_example;
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
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public String getPro_answer() {
		return pro_answer;
	}
	public void setPro_answer(String pro_answer) {
		this.pro_answer = pro_answer;
	}
	public String getPro_example() {
		return pro_example;
	}
	public void setPro_example(String pro_example) {
		this.pro_example = pro_example;
	}

}
