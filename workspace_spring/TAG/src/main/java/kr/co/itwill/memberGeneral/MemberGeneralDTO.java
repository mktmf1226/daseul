package kr.co.itwill.memberGeneral;

public class MemberGeneralDTO {
	
	private String m_id ;
	private String m_pw;
	private String m_name;
	private String nickname;
	private String birth;
	private String gender;
	private String m_zipcode;
	private String m_addr1;
	private String m_addr2;
	private String m_tel;
	private String m_email;
	private String mem_grade;
	private String point;
	private String regdate;
	
	public MemberGeneralDTO() {}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getM_zipcode() {
		return m_zipcode;
	}

	public void setM_zipcode(String m_zipcode) {
		this.m_zipcode = m_zipcode;
	}

	public String getM_addr1() {
		return m_addr1;
	}

	public void setM_addr1(String m_addr1) {
		this.m_addr1 = m_addr1;
	}

	public String getM_addr2() {
		return m_addr2;
	}

	public void setM_addr2(String m_addr2) {
		this.m_addr2 = m_addr2;
	}

	public String getM_tel() {
		return m_tel;
	}

	public void setM_tel(String m_tel) {
		this.m_tel = m_tel;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getMem_grade() {
		return mem_grade;
	}

	public void setMem_grade(String mem_grade) {
		this.mem_grade = mem_grade;
	}

	public String getPoint() {
		return point;
	}

	public void setPoint(String point) {
		this.point = point;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "MemberGeneralDTO [m_id=" + m_id + ", m_pw=" + m_pw + ", m_name=" + m_name + ", nickname=" + nickname
				+ ", birth=" + birth + ", gender=" + gender + ", m_zipcode=" + m_zipcode + ", m_addr1=" + m_addr1
				+ ", m_addr2=" + m_addr2 + ", m_tel=" + m_tel + ", m_email=" + m_email + ", mem_grade=" + mem_grade
				+ ", point=" + point + ", regdate=" + regdate + "]";
	}
	
	

	
}//class end

