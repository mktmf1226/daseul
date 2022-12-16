package kr.co.itwill.point;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PointDAO {

	public PointDAO() {
		System.out.println("-----PointDAO() 객체생성됨");
	}//end
	
	@Autowired
	SqlSession sqlSession;
	
	public List<PointDTO> list(){
		return sqlSession.selectList("point.list");
	}//list() end
	
}//class end
