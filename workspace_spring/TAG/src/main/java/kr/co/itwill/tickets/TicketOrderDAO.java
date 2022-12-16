package kr.co.itwill.tickets;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itwill.coupon.CouponDTO;
import kr.co.itwill.product.ProductDTO;



@Repository
public class TicketOrderDAO {
	public TicketOrderDAO() {
		System.out.println("-----TicketOrderDAO() 객체 생성 됨");
	}//end
	
	@Autowired
	SqlSession sqlSession;
	
	// 티켓 주문서 mappers
	public int add(TicketOrderDTO dto) {
		return sqlSession.insert("ticketOrder.add", dto);
	}//add() end
	
	/*
	// 티켓 주문 상세내역서 mappers 한 행씩 넣기
	public int addDetail(TicketDetailDTO insertList) {
		return sqlSession.insert("ticketDetail.addDetail", insertList);
	}//addDetail() end
	*/
	
	// 티켓 주문 상세내역서 mappers
	public int addDetail(List<TicketDetailDTO> insertList) {
		return sqlSession.insert("ticketDetail.addDetail2", insertList);
	}//addDetail() end
	
	// 쿠폰내역 mappers
	public int addCoupon(CouponDTO dto) {
		return sqlSession.insert("coupon.add", dto);
	}//add() end
	
	// 상품 리스트 Select문 mappers
	public List<ProductDTO> productList(int c_no) {
		return sqlSession.selectList("product.viewProduct", c_no);
	}//add() end
	
	
	
}//class end
