package kr.co.itwill.memberSeller;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class SellerProductDTO {

	//field
    private int	   pro_no;    	
    private String category;     
    private int	   c_no;   
    private String p_id;       	
    private String pro_name;   	
    private int	   stock;      	
    private String color;      
    private String size;     
    private int	   price;    
    private String regdate;   
    private String edit;
    private String status; 			// 판매상태(칼럼o)
    private String postername;		// 대표이미지 이름저장용
    private int    likecnt;			// 좋아요카운트   
    
    private int afstock;			// 현재 재고수량(칼럼x)
    private int sales;				// 판매수량
    private List chkList; 			// 선택 삭제 배열 
    private MultipartFile fileimg; 	// 실제 이미지파일 저장용

    //Default Constructor	
    public SellerProductDTO() {}

    
    //getter·setter	
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

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getEdit() {
		return edit;
	}

	public void setEdit(String edit) {
		this.edit = edit;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPostername() {
		return postername;
	}

	public void setPostername(String postername) {
		this.postername = postername;
	}

	public int getLikecnt() {
		return likecnt;
	}

	public void setLikecnt(int likecnt) {
		this.likecnt = likecnt;
	}

	public int getAfstock() {
		return afstock;
	}

	public void setAfstock(int afstock) {
		this.afstock = afstock;
	}

	public int getSales() {
		return sales;
	}

	public void setSales(int sales) {
		this.sales = sales;
	}

	public List getChkList() {
		return chkList;
	}

	public void setChkList(List chkList) {
		this.chkList = chkList;
	}

	public MultipartFile getFileimg() {
		return fileimg;
	}

	public void setFileimg(MultipartFile fileimg) {
		this.fileimg = fileimg;
	}


	//toString()
	@Override
	public String toString() {
		return "SellerProductDTO [pro_no=" + pro_no + ", category=" + category + ", c_no=" + c_no + ", p_id=" + p_id
				+ ", pro_name=" + pro_name + ", stock=" + stock + ", color=" + color + ", size=" + size + ", price="
				+ price + ", regdate=" + regdate + ", edit=" + edit + ", status=" + status + ", postername="
				+ postername + ", likecnt=" + likecnt + ", afstock=" + afstock + ", sales=" + sales + ", chkList="
				+ chkList + ", fileimg=" + fileimg + "]";
	}





	
   
   
	
}//DTO end
