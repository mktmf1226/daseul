package kr.co.itwill.product;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itwill.concert.ConcertDTO;


@Repository
public class ProductDAO {
	
	public ProductDAO() {
		System.out.println("------- ProductDAO() 객체 생성됨 ");
	}//ProductDAO() end
	
	@Autowired
	SqlSession sqlSession;
	
	
//  ---------------------------------------------------- [상품목록 - 전체]
	public List<ProductDTO> list(int start, int end) {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		
		return sqlSession.selectList("product.list", map);
	}//list() end	
	
//  ---------------------------------------------------- [상품목록 - 페이징 전체 글개수]	
	public int total() {
		return sqlSession.selectOne("product.total");
	}// list2() end

	
	
	
//  ---------------------------------------------------- [상품목록 - 페이징 카테고리별 글개수]	
	public int categoryTotal(String category) {
		return sqlSession.selectOne("product.categoryTotal", category);
	}// categoryTotal() end
	
//  ---------------------------------------------------- [상품목록 - 페이징 리스트]	
	public List<ProductDTO> list2(Integer start, Integer end, String category) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("start", start.toString());
		map.put("end", end.toString());
		map.put("category", category);
		
		return sqlSession.selectList("product.list2", map);
	}// list2() end
	

	
//  ---------------------------------------------------- [상품목록 - 콘서트 리스트]	
	public List<ConcertDTO> concert() {
		return sqlSession.selectList("product.concert");
	}// concert() end	
	
//  ---------------------------------------------------- [상품목록 - 콘서트 개수]	
	public int concertTotal(String c_no) {
		return sqlSession.selectOne("product.concertTotal", c_no);
	}// categoryTotal() end

//  ---------------------------------------------------- [상품목록 - 콘서트 리스트 + 페이징]
	public List<ProductDTO> concertList(Integer start, Integer end, String c_no) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("start", start.toString());
		map.put("end", end.toString());
		map.put("c_no", c_no.toString());
		
		return sqlSession.selectList("product.concertList", map);
	}// list2() end

	

	
//  ---------------------------------------------------- [상품검색]	
	public List<ProductDTO> search(String pro_name) {
		return sqlSession.selectList("product.search", "%" + pro_name.toUpperCase() + "%");
	}//search() end
	

	
//  ---------------------------------------------------- [상품목록 - 카테고리 전체]	
	public List<ProductDTO> categoryAll() {
		return sqlSession.selectList("product.categoryAll");
	}//search() end
	
	
	
	
	
}//class end
