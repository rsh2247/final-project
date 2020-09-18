package project.sungho.problem_solve_module.vo;

public class ProblemExample_VO {
	private String pro_num,ex_num,ex_content;
	
	public ProblemExample_VO() {
		super();
	}

	public ProblemExample_VO(String pro_num, String ex_num, String ex_content) {
		super();
		this.pro_num = pro_num;
		this.ex_num = ex_num;
		this.ex_content = ex_content;
	}

	public String getPro_num() {
		return pro_num;
	}

	public void setPro_num(String pro_num) {
		this.pro_num = pro_num;
	}

	public String getEx_num() {
		return ex_num;
	}

	public void setEx_num(String ex_num) {
		this.ex_num = ex_num;
	}

	public String getEx_content() {
		return ex_content;
	}

	public void setEx_content(String ex_content) {
		this.ex_content = ex_content;
	}
	

}
