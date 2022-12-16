package kr.co.itwill.coupon;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class CouponDAO {

	public CouponDAO() {
		System.out.println("-----CouponDAO() 객체생성됨");
	}//end
	
	@Autowired
	SqlSession sqlSession;
	
	public List<CouponDTO> list() {
		//System.out.println("-----why!!");
		return sqlSession.selectList("coupon.list");
	}//list() end
	
}//class end
