package kr.co.itwill.cart;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAO {
	
	public CartDAO() {
		System.out.println("------- CartDAO() 객체 생성됨 ");
	}//CartDAO() end
	
	@Autowired
	SqlSession sqlSession;
	
	
//  [장바구니] 시작 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  //
	
	
	

}//class end
