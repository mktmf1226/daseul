package kr.co.itwill.myticket;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;


@Repository
public class MyticketDAO {

	public MyticketDAO() {
		System.out.println("-----MyticketDAO() 객체생성됨");
	}//end
	
	@Autowired
	SqlSession sqlSession;
	
	public List<Map<String, Object>> list(int start, int end){
		HashMap<String, Integer> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		
		return sqlSession.selectList("myticket.list", map);
	}//list() end
	
	public int total(){
		return sqlSession.selectOne("myticket.total");
	}//total() end
	
	public List<Map<String, Object>> detail(){
		return sqlSession.selectList("myticket.detail");
	}//Detail() end
	
}//class end
