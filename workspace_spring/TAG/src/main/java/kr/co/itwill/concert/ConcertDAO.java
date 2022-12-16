package kr.co.itwill.concert;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itwill.product.ProductDTO;

@Repository
public class ConcertDAO {

	public ConcertDAO() {
		System.out.println("------- ConcertDAO() 객체 생성됨 ");
	}//ConcertDAO() end
	
	@Autowired
	SqlSession sqlSession;
	
	
//  ---------------------------------------------------- [콘서트 목록 최신순 - 전체]
	public List<ConcertDTO> concertListLatest(int start, int end){
		HashMap<String, Integer> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		
		return sqlSession.selectList("concert.concertListLatest", map);
	}//concertListLatest() end
	
	
//  ---------------------------------------------------- [콘서트 목록 최신순 - 개수]
	public int concertTotal() {
		return sqlSession.selectOne("concert.concertTotal");
	}//concertTotal() end
	
	
//  ---------------------------------------------------- [종료된 콘서트 목록 - 전체]	
	public List<ConcertDTO> pastConcertList(int start, int end) {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		
		return sqlSession.selectList("concert.pastConcertList", map);
	}//pastConcertList end
	
	
//  ---------------------------------------------------- [종료된 콘서트 목록 - 개수]
	public int pastConcertTotal() {
		return sqlSession.selectOne("concert.pastConcertTotal");
	}//concertTotal() end
	
	
//  ---------------------------------------------------- [예정된 콘서트 목록 - 전체]	
	public List<ConcertDTO> yejungConcertList(int start, int end) {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		
		return sqlSession.selectList("concert.yejungConcertList", map);
	}//pastConcertList end
	
	
//  ---------------------------------------------------- [예정된 콘서트 목록 - 개수]
	public int yejungConcertTotal() {
		return sqlSession.selectOne("concert.yejungConcertTotal");
	}//concertTotal() end
	
	
//  ---------------------------------------------------- [콘서트검색]	
	public List<ConcertDTO> searchConcert(String title) {
		return sqlSession.selectList("concert.searchConcert", "%" + title.toUpperCase() + "%");
	}//search() end
	

//  ---------------------------------------------------- [콘서트상세]	
	public Map<String, Object> detailConcert(String c_no){
		return sqlSession.selectOne("concert.detailConcert", c_no);
	}//detail() end
	
	
// ---------------------------------------------------- [오늘이 선결제 예매일인지 ?]	
	public int earlybirdCheck(String c_no) {
		//System.out.println("22222222");
		return sqlSession.selectOne("concert.earlybirdCheck", c_no);
	}//earlybirdCheck() end
}//class end
