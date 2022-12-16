package kr.co.itwill.point;

public class PointDTO {
	private int pt_no;
    private String m_id;
    private String detail;
    private int pt_plus;
    private int pt_minus;
    private int pt_total;
    private String order_num;
    private String cng_date;
    
    public PointDTO() {}

	public int getPt_no() {
		return pt_no;
	}

	public void setPt_no(int pt_no) {
		this.pt_no = pt_no;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public int getPt_plus() {
		return pt_plus;
	}

	public void setPt_plus(int pt_plus) {
		this.pt_plus = pt_plus;
	}

	public int getPt_minus() {
		return pt_minus;
	}

	public void setPt_minus(int pt_minus) {
		this.pt_minus = pt_minus;
	}

	public int getPt_total() {
		return pt_total;
	}

	public void setPt_total(int pt_total) {
		this.pt_total = pt_total;
	}

	public String getOrder_num() {
		return order_num;
	}

	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}

	public String getCng_date() {
		return cng_date;
	}

	public void setCng_date(String cng_date) {
		this.cng_date = cng_date;
	}

	@Override
	public String toString() {
		return "PointDTO [pt_no=" + pt_no + ", m_id=" + m_id + ", detail=" + detail + ", pt_plus=" + pt_plus
				+ ", pt_minus=" + pt_minus + ", pt_total=" + pt_total + ", order_num=" + order_num + ", cng_date="
				+ cng_date + "]";
	}
    
}//class end
