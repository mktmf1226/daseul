package kr.co.itwill.notice;

public class NoticeDTO {

	private int n_no; 
	private String subject; 	
	private String edit; 	
    private String regdate;
    
    public NoticeDTO() {}

	public int getN_no() {
		return n_no;
	}

	public void setN_no(int n_no) {
		this.n_no = n_no;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getEdit() {
		return edit;
	}

	public void setEdit(String edit) {
		this.edit = edit;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "NoticeDTO [n_no=" + n_no + ", subject=" + subject + ", edit=" + edit + ", regdate=" + regdate + "]";
	}
        
}//class end
