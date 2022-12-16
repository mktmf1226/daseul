package kr.co.itwill.tickets;

public class TicketDetailDTO {
	private int tdno;
	private String tck_num;
	private String cseat;
	private int price;
	
	public TicketDetailDTO() {}

	public int getTdno() {
		return tdno;
	}

	public void setTdno(int tdno) {
		this.tdno = tdno;
	}

	public String getTck_num() {
		return tck_num;
	}

	public void setTck_num(String tck_num) {
		this.tck_num = tck_num;
	}

	public String getCseat() {
		return cseat;
	}

	public void setCseat(String cseat) {
		this.cseat = cseat;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "TicketDetailDTO [tdno=" + tdno + ", tck_num=" + tck_num + ", cseat=" + cseat + ", price=" + price + "]";
	}
	

}//class end
