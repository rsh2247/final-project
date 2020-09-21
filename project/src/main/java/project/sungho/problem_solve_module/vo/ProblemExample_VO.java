package project.sungho.problem_solve_module.vo;

import org.springframework.stereotype.Component;

@Component("problemExample_VO")
public class ProblemExample_VO {
	private String pro_num,cho_num,cho_content;
	
	public ProblemExample_VO() {
		super();
	}

	public ProblemExample_VO(String pro_num, String cho_num, String cho_content) {
		super();
		this.pro_num = pro_num;
		this.cho_num = cho_num;
		this.cho_content = cho_content;
	}

	public String getPro_num() {
		return pro_num;
	}

	public void setPro_num(String pro_num) {
		this.pro_num = pro_num;
	}

	public String getCho_num() {
		return cho_num;
	}

	public void setCho_num(String cho_num) {
		this.cho_num = cho_num;
	}

	public String getCho_content() {
		return cho_content;
	}

	public void setCho_content(String cho_content) {
		this.cho_content = cho_content;
	}

}
