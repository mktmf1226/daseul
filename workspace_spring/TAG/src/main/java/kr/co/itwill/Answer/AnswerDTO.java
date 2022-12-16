package kr.co.itwill.Answer;

public class AnswerDTO {
	
	private int a_no;
	private int q_no; 
	private String p_id; 
	private String content; 
	private String regdate;
	
	public AnswerDTO() {}

	public int getA_no() {
		return a_no;
	}

	public void setA_no(int a_no) {
		this.a_no = a_no;
	}

	public int getQ_no() {
		return q_no;
	}

	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}

	public String getP_id() {
		return p_id;
	}

	public void setP_id(String p_id) {
		this.p_id = p_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "AnswerDTO [a_no=" + a_no + ", q_no=" + q_no + ", p_id=" + p_id + ", content=" + content + ", regdate="
				+ regdate + "]";
	}
	
	
}//DTO end
