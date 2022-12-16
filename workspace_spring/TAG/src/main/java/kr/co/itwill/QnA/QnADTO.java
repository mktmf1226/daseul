package kr.co.itwill.QnA;

public class QnADTO {

	private int    q_no; 
	private String qname; 
	private String subject; 
	private int    pro_no; 
	private String edit; 
	private int    passwd; 
	private String regdate;
	private String a_stus;
	
	private String nickname;
	private String postername;
	private String pro_name;
	private int    a_no;
	private String answerdate;
	private String content;
	private String p_id; 
	
	public QnADTO() {}

	public int getQ_no() {
		return q_no;
	}

	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}

	public String getQname() {
		return qname;
	}

	public void setQname(String qname) {
		this.qname = qname;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public int getPro_no() {
		return pro_no;
	}

	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}

	public String getEdit() {
		return edit;
	}

	public void setEdit(String edit) {
		this.edit = edit;
	}

	public int getPasswd() {
		return passwd;
	}

	public void setPasswd(int passwd) {
		this.passwd = passwd;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getA_stus() {
		return a_stus;
	}

	public void setA_stus(String a_stus) {
		this.a_stus = a_stus;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPostername() {
		return postername;
	}

	public void setPostername(String postername) {
		this.postername = postername;
	}

	public String getPro_name() {
		return pro_name;
	}

	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}

	public int getA_no() {
		return a_no;
	}

	public void setA_no(int a_no) {
		this.a_no = a_no;
	}

	public String getAnswerdate() {
		return answerdate;
	}

	public void setAnswerdate(String answerdate) {
		this.answerdate = answerdate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getP_id() {
		return p_id;
	}

	public void setP_id(String p_id) {
		this.p_id = p_id;
	}

	@Override
	public String toString() {
		return "QnADTO [q_no=" + q_no + ", qname=" + qname + ", subject=" + subject + ", pro_no=" + pro_no + ", edit="
				+ edit + ", passwd=" + passwd + ", regdate=" + regdate + ", a_stus=" + a_stus + ", nickname=" + nickname
				+ ", postername=" + postername + ", pro_name=" + pro_name + ", a_no=" + a_no + ", answerdate="
				+ answerdate + ", content=" + content + ", p_id=" + p_id + "]";
	}

	


	
 
	
}//DTO
