package kr.co.itwill.mylike;

public class MylikeDTO {

	private int lno;
    private String m_id;
    private char like_cd;
    private String like_li;
    
    public MylikeDTO() {}

	public int getLno() {
		return lno;
	}

	public void setLno(int lno) {
		this.lno = lno;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public char getLike_cd() {
		return like_cd;
	}

	public void setLike_cd(char like_cd) {
		this.like_cd = like_cd;
	}

	public String getLike_li() {
		return like_li;
	}

	public void setLike_li(String like_li) {
		this.like_li = like_li;
	}

	@Override
	public String toString() {
		return "MylikeDTO [lno=" + lno + ", m_id=" + m_id + ", like_cd=" + like_cd + ", like_li=" + like_li + "]";
	}
    
}//class end
