package kr.co.itwill.myticket;

public class MyticketDTO {

	private String tck_num;
	private String m_id;
	private int c_no;
	private int cnt;
	private int order_price;
	private int dis_price;
	private int d_fee;
	private int total_price;
	private String rec_name;
	private String rec_addr;
	private String rec_tel;
	private String msg;
	private String stus;
	private String dis_descrip;
	
    public MyticketDTO() {}

	public String getTck_num() {
		return tck_num;
	}

	public void setTck_num(String tck_num) {
		this.tck_num = tck_num;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getOrder_price() {
		return order_price;
	}

	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}

	public int getDis_price() {
		return dis_price;
	}

	public void setDis_price(int dis_price) {
		this.dis_price = dis_price;
	}

	public int getD_fee() {
		return d_fee;
	}

	public void setD_fee(int d_fee) {
		this.d_fee = d_fee;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	public String getRec_name() {
		return rec_name;
	}

	public void setRec_name(String rec_name) {
		this.rec_name = rec_name;
	}

	public String getRec_addr() {
		return rec_addr;
	}

	public void setRec_addr(String rec_addr) {
		this.rec_addr = rec_addr;
	}

	public String getRec_tel() {
		return rec_tel;
	}

	public void setRec_tel(String rec_tel) {
		this.rec_tel = rec_tel;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getStus() {
		return stus;
	}

	public void setStus(String stus) {
		this.stus = stus;
	}

	public String getDis_descrip() {
		return dis_descrip;
	}

	public void setDis_descrip(String dis_descrip) {
		this.dis_descrip = dis_descrip;
	}

	@Override
	public String toString() {
		return "MyticketDTO [tck_num=" + tck_num + ", m_id=" + m_id + ", c_no=" + c_no + ", cnt=" + cnt
				+ ", order_price=" + order_price + ", dis_price=" + dis_price + ", d_fee=" + d_fee + ", total_price="
				+ total_price + ", rec_name=" + rec_name + ", rec_addr=" + rec_addr + ", rec_tel=" + rec_tel + ", msg="
				+ msg + ", stus=" + stus + ", dis_descrip=" + dis_descrip + "]";
	}

	
    
}//class end
