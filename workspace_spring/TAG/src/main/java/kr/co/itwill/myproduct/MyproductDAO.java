package kr.co.itwill.myproduct;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyproductDAO {

	public MyproductDAO() {
		System.out.println("-----MyproductDAO() 객체생성됨");
	}//end
	
	@Autowired
	SqlSession sqlSession;
	
	public List<MyproductDTO> list(){
		return sqlSession.selectList("myproduct.list");
	}//list() end
	
}//class end
