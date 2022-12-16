package kr.co.itwill.mylike;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MylikeDAO {

	public MylikeDAO() {
		System.out.println("-----MylikeDAO() 객체생성됨");
	}//end
	
	@Autowired
	SqlSession sqlSession;
	
	public List<MylikeDTO> list(String s_m_id){
		return sqlSession.selectList("mylike.list", s_m_id);
	}//list() end
	
	
	public List<Map<String, String>> list_c(String s_m_id){
		return sqlSession.selectList("mylike.list_c", s_m_id);
	}

	public List<Map<String, String>> list_p(String s_m_id){
		return sqlSession.selectList("mylike.list_p", s_m_id);
	}
	
}//class end
