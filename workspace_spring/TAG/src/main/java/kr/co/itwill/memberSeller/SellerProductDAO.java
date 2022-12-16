package kr.co.itwill.memberSeller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itwill.concert.ConcertDTO;
import kr.co.itwill.productOrder.ProdcutOrderDTO;


@Repository
public class SellerProductDAO {
	
	public SellerProductDAO() {
		System.out.println("----------------SellerProductDAO()");
	}//end
	
	@Autowired
	SqlSession sqlSession;

	
	public int productInsert(SellerProductDTO dto) {
		return sqlSession.insert("sellerProduct.insert", dto);
	}//product Insert() end
	
	public List<ConcertDTO> concertlist() {
		return sqlSession.selectList("sellerProduct.concertlist");
	}//concert list() end

	public List<SellerProductDTO> productlist(int start, int end, String p_id) {
		
		HashMap<String, Object> map  = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("p_id", p_id);
		
		return sqlSession.selectList("sellerProduct.productlist",map); 
	}
	
	public int chkdelete(SellerProductDTO dto) throws Exception {
		return sqlSession.delete("sellerProduct.chkdelete", dto);
	}
	
	public int productstatusup(SellerProductDTO dto) {
		return sqlSession.update("sellerProduct.productstatusup",dto);
	}
	
	public SellerProductDTO productread(int pro_no) {
		return sqlSession.selectOne("sellerProduct.productread", pro_no);
	}
	
	public int productupdate (SellerProductDTO dto) {
		return sqlSession.update("sellerProduct.productupdate", dto);
	}
	
	public int productdelete (int pro_no) {
		return sqlSession.delete("sellerProduct.productdelete",pro_no);
	}
	
	public String posternameread (int pro_no) {
		return sqlSession.selectOne("sellerProduct.posternameread",pro_no);
	}

	public List<ProdcutOrderDTO> orderlist(int start, int end, String p_id) {
		
		HashMap<String, Object> map  = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("p_id", p_id);
		
		return sqlSession.selectList("sellerProduct.orderlist",map); 
	}
	
	public List<Map<String, Object>> orderdetailList(String order_num, String p_id) {
		
		HashMap<String, Object> map  = new HashMap<>();
		map.put("order_num",order_num);
		map.put("p_id", p_id);
		
		return sqlSession.selectList("sellerProduct.orderdetailList",map);
	}
	
	public Map<String, Object> orderdetail (String order_num, String p_id) {
		
		HashMap<String, Object> map  = new HashMap<>();
		map.put("order_num",order_num);
		map.put("p_id", p_id);
		
		return sqlSession.selectOne("sellerProduct.orderdetail",map);
	}
	
	public void orderstusupdate (Map<String, Object> map) {
		sqlSession.update("sellerProduct.orderstusupdate",map);
	}
	
	public void orderdetailupdate (ProdcutOrderDTO dto) {
		sqlSession.update("sellerProduct.orderdetailupdate",dto);
	}
	
	public int totpro_cnt(String p_id) {
		return sqlSession.selectOne("sellerProduct.totpro_cnt",p_id);
	}
	
	public int totord_cnt(String p_id) {
		return sqlSession.selectOne("sellerProduct.totord_cnt",p_id);
	}
	
	public List<SellerProductDTO> S_proSearch(int start, int end, String p_id, String pro_name) {
		
		HashMap<String, Object> map  = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("p_id", p_id);
		map.put("pro_name", "%" + pro_name.toUpperCase() + "%");
		
		return sqlSession.selectList("sellerProduct.S_proSearch",map);
	}
	
	public List<ProdcutOrderDTO> S_ordSearch(int start, int end, String p_id, String order_num) {
		
		HashMap<String, Object> map  = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("p_id", p_id);
		map.put("order_num", "%" + order_num.toUpperCase() + "%");
		
		return sqlSession.selectList("sellerProduct.S_ordSearch",map); 
	}
	
}//DAO end
