package kr.co.itwill.product;

public class ProductDTO {

	private int pro_no;
	private String category;
	private int c_no;
	private String p_id;
	private String pro_name;
	private int stock;
	private String color;
	private String size;
	private int price;
	private int likecnt;
	private String edit;
	private String postername;
    private String status;
    private String regdate;
    
    
    public ProductDTO() {}


	public int getPro_no() {
		return pro_no;
	}


	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public int getC_no() {
		return c_no;
	}


	public void setC_no(int c_no) {
		this.c_no = c_no;
	}


	public String getP_id() {
		return p_id;
	}


	public void setP_id(String p_id) {
		this.p_id = p_id;
	}


	public String getPro_name() {
		return pro_name;
	}


	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}


	public int getStock() {
		return stock;
	}


	public void setStock(int stock) {
		this.stock = stock;
	}


	public String getColor() {
		return color;
	}


	public void setColor(String color) {
		this.color = color;
	}


	public String getSize() {
		return size;
	}


	public void setSize(String size) {
		this.size = size;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public int getLikecnt() {
		return likecnt;
	}


	public void setLikecnt(int likecnt) {
		this.likecnt = likecnt;
	}


	public String getEdit() {
		return edit;
	}


	public void setEdit(String edit) {
		this.edit = edit;
	}


	public String getPostername() {
		return postername;
	}


	public void setPostername(String postername) {
		this.postername = postername;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getRegdate() {
		return regdate;
	}


	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}


	@Override
	public String toString() {
		return "ProductDTO [pro_no=" + pro_no + ", category=" + category + ", c_no=" + c_no + ", p_id=" + p_id
				+ ", pro_name=" + pro_name + ", stock=" + stock + ", color=" + color + ", size=" + size + ", price="
				+ price + ", likecnt=" + likecnt + ", edit=" + edit + ", postername=" + postername + ", status="
				+ status + ", regdate=" + regdate + "]";
	}
    
    
    
	
	
}//class end
