package kr.co.itwill.cart;

public class CartDTO {

    private int cart_no;
    private String m_id;                          
    private int pro_no;                        
    private int cnt;
    
    
    public CartDTO() {}


	public int getCart_no() {
		return cart_no;
	}


	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}


	public String getM_id() {
		return m_id;
	}


	public void setM_id(String m_id) {
		this.m_id = m_id;
	}


	public int getPro_no() {
		return pro_no;
	}


	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}


	public int getCnt() {
		return cnt;
	}


	public void setCnt(int cnt) {
		this.cnt = cnt;
	}


	@Override
	public String toString() {
		return "CartDTO [cart_no=" + cart_no + ", m_id=" + m_id + ", pro_no=" + pro_no + ", cnt=" + cnt + "]";
	}
    
    
}//class end
