package kr.co.itwill.productOrder;

public class ProdcutOrderDTO {

	private String order_num;               
	private String m_id;           	          
    private int order_price;      
    private int cp_dis;               
    private int cp_no;                       
    private int pt_minus;       
    private int d_fee;          	 
    private int total_price;    	  
    private int pt_plus;           
    private String rec_name;               
    private String rec_addr;                     
    private String rec_tel;                           
    private String msg;                               
		    
    private int total_cnt;
    private String order_date;
    private String p_id;
    
    //
    public ProdcutOrderDTO() {}
    
    //
	public String getOrder_num() {
		return order_num;
	}

	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public int getOrder_price() {
		return order_price;
	}

	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}

	public int getCp_dis() {
		return cp_dis;
	}

	public void setCp_dis(int cp_dis) {
		this.cp_dis = cp_dis;
	}

	public int getCp_no() {
		return cp_no;
	}

	public void setCp_no(int cp_no) {
		this.cp_no = cp_no;
	}

	public int getPt_minus() {
		return pt_minus;
	}

	public void setPt_minus(int pt_minus) {
		this.pt_minus = pt_minus;
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

	public int getPt_plus() {
		return pt_plus;
	}

	public void setPt_plus(int pt_plus) {
		this.pt_plus = pt_plus;
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


	public int getTotal_cnt() {
		return total_cnt;
	}

	public void setTotal_cnt(int total_cnt) {
		this.total_cnt = total_cnt;
	}

	public String getOrder_date() {
		return order_date;
	}

	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}

	public String getP_id() {
		return p_id;
	}

	public void setP_id(String p_id) {
		this.p_id = p_id;
	}
	
	//
	@Override
	public String toString() {
		return "ProdcutOrderDTO [order_num=" + order_num + ", m_id=" + m_id + ", order_price=" + order_price
				+ ", cp_dis=" + cp_dis + ", cp_no=" + cp_no + ", pt_minus=" + pt_minus + ", d_fee=" + d_fee
				+ ", total_price=" + total_price + ", pt_plus=" + pt_plus + ", rec_name=" + rec_name + ", rec_addr="
				+ rec_addr + ", rec_tel=" + rec_tel + ", msg=" + msg + ", total_cnt=" + total_cnt + ", order_date="
				+ order_date + ", p_id=" + p_id + "]";
	}
	
	
	
	
    
    
	
}//DTO end
