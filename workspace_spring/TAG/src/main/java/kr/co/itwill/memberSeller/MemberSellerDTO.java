package kr.co.itwill.memberSeller;

public class MemberSellerDTO {
	
	private String p_id;    
	private String p_pw;   
	private String company;
	private String director;
	private String licence;
	private String com_zipcode;
	private String com_addr1;
	private String com_addr2;
	private String com_tel;
	private String com_email;
	private String bank;
	private String bank_num; 
	private String mem_grade;
	private String regdate;
	
	

	public MemberSellerDTO() {}



	public String getP_id() {
		return p_id;
	}



	public void setP_id(String p_id) {
		this.p_id = p_id;
	}



	public String getP_pw() {
		return p_pw;
	}



	public void setP_pw(String p_pw) {
		this.p_pw = p_pw;
	}



	public String getCompany() {
		return company;
	}



	public void setCompany(String company) {
		this.company = company;
	}



	public String getDirector() {
		return director;
	}



	public void setDirector(String director) {
		this.director = director;
	}



	public String getLicence() {
		return licence;
	}



	public void setLicence(String licence) {
		this.licence = licence;
	}



	public String getCom_zipcode() {
		return com_zipcode;
	}



	public void setCom_zipcode(String com_zipcode) {
		this.com_zipcode = com_zipcode;
	}



	public String getCom_addr1() {
		return com_addr1;
	}



	public void setCom_addr1(String com_addr1) {
		this.com_addr1 = com_addr1;
	}



	public String getCom_addr2() {
		return com_addr2;
	}



	public void setCom_addr2(String com_addr2) {
		this.com_addr2 = com_addr2;
	}



	public String getCom_tel() {
		return com_tel;
	}



	public void setCom_tel(String com_tel) {
		this.com_tel = com_tel;
	}



	public String getCom_email() {
		return com_email;
	}



	public void setCom_email(String com_email) {
		this.com_email = com_email;
	}



	public String getBank() {
		return bank;
	}



	public void setBank(String bank) {
		this.bank = bank;
	}



	public String getBank_num() {
		return bank_num;
	}



	public void setBank_num(String bank_num) {
		this.bank_num = bank_num;
	}



	public String getMem_grade() {
		return mem_grade;
	}



	public void setMem_grade(String mem_grade) {
		this.mem_grade = mem_grade;
	}



	public String getRegdate() {
		return regdate;
	}



	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}



	@Override
	public String toString() {
		return "MemberSellerDTO [p_id=" + p_id + ", p_pw=" + p_pw + ", company=" + company + ", director=" + director
				+ ", licence=" + licence + ", com_zipcode=" + com_zipcode + ", com_addr1=" + com_addr1 + ", com_addr2="
				+ com_addr2 + ", com_tel=" + com_tel + ", com_email=" + com_email + ", bank=" + bank + ", bank_num="
				+ bank_num + ", mem_grade=" + mem_grade + ", regdate=" + regdate + "]";
	}

	
	

	
}//class end
