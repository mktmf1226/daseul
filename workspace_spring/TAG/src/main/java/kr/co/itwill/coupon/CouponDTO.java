package kr.co.itwill.coupon;

public class CouponDTO {
	private int cp_no;
    private String m_id;
    private String coupon;
    private String issue_date;
    private String exp_date;
    private int c_no;
    private char cp_stus;
    
    public CouponDTO() {}

	public int getCp_no() {
		return cp_no;
	}

	public void setCp_no(int cp_no) {
		this.cp_no = cp_no;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getCoupon() {
		return coupon;
	}

	public void setCoupon(String coupon) {
		this.coupon = coupon;
	}

	public String getIssue_date() {
		return issue_date;
	}

	public void setIssue_date(String issue_date) {
		this.issue_date = issue_date;
	}

	public String getExp_date() {
		return exp_date;
	}

	public void setExp_date(String exp_date) {
		this.exp_date = exp_date;
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public char getCp_stus() {
		return cp_stus;
	}

	public void setCp_stus(char cp_stus) {
		this.cp_stus = cp_stus;
	}

	@Override
	public String toString() {
		return "CouponDTO [cp_no=" + cp_no + ", m_id=" + m_id + ", coupon=" + coupon + ", issue_date=" + issue_date
				+ ", exp_date=" + exp_date + ", c_no=" + c_no + ", cp_stus=" + cp_stus + "]";
	}
    
}//class end