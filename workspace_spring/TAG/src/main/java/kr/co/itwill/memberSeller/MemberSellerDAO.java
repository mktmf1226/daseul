package kr.co.itwill.memberSeller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itwill.Answer.AnswerDTO;
import kr.co.itwill.QnA.QnADTO;

@Repository
public class MemberSellerDAO {
	
	public MemberSellerDAO() {
		System.out.println("------- MemberSellerDAO() 객체 생성됨 ");
	}//MemberSellerDAO() end
	
	@Autowired
	SqlSession sqlSession;
	
	
	// 로그인 등급 가져오는 sql문
	public String select(MemberSellerDTO mem_grade) {
		return sqlSession.selectOne("memberSeller.select", mem_grade);
	}//memberGeneralInsert() end
	
	
	// 아이디 중복확인 mappers
	public int idCheckS(String p_id) {
		return sqlSession.selectOne("memberSeller.idCheckS", p_id);
	}//idCheck() end
	
	
	// 이메일 중복확인 mappers
	public int emailScheck(String com_email) {
		return sqlSession.selectOne("memberSeller.emailScheck", com_email);
	}//idCheck() end
	
	
	// 회원가입 mappers
	public int joinS(MemberSellerDTO dto) {
		return sqlSession.insert("memberSeller.joinS", dto);
	}//joinG end
	
	public List<QnADTO> qnalist (int start, int end, String p_id) {
		HashMap<String, Object> map  = new HashMap<>();
		
		map.put("start", start);
		map.put("end", end);
		map.put("p_id", p_id);
		
		return sqlSession.selectList("memberSeller.qnalist",map);
	}
	
	public int answerInsert(AnswerDTO dto) {
		return sqlSession.insert("memberSeller.answerInsert",dto);
	}	
	
	public String answerOne(int a_no) {
		return sqlSession.selectOne("memberSeller.answerOne",a_no);
	}
	
	public void a_stusUpdate(int q_no) {
		sqlSession.update("memberSeller.a_stusUpdate",q_no);
	}
	/*
	public List<QnADTO> answerlist (String p_id) {
		return sqlSession.selectList("memberSeller.answerlist",p_id);
	}
	*/
	public List<QnADTO> answerlist (int start, int end, String p_id) {
HashMap<String, Object> map  = new HashMap<>();
		
		map.put("start", start);
		map.put("end", end);
		map.put("p_id", p_id);
		
		return sqlSession.selectList("memberSeller.answerlist",map);
	}
	
	public int answerupdate (AnswerDTO dto) {
		return sqlSession.update("memberSeller.answerupdate",dto);
	}
	
	public int totorder_cnt (String p_id) {
		return sqlSession.selectOne("memberSeller.totorder_cnt",p_id);
	}
	
	public int delCom_cnt (String p_id) {
		return sqlSession.selectOne("memberSeller.delCom_cnt",p_id);
	}
	
	public int qnaN_cnt (String p_id) {
		return sqlSession.selectOne("memberSeller.qnaN_cnt",p_id);
	}
	
	public List<Map<String, Object>> recently_order (String p_id) {
		return sqlSession.selectList("memberSeller.recently_order", p_id);
	}
	
	public List<Map<String, Object>> recently_qna (String p_id){
		return sqlSession.selectList("memberSeller.recently_qna",p_id);
	}
	
	public int qnaY_cnt (String p_id) {
		return sqlSession.selectOne("memberSeller.qnaY_cnt",p_id);
	}
	
}//class end

