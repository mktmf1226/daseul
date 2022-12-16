package kr.co.itwill.memberSeller;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.itwill.Answer.AnswerDTO;

@Controller
public class MemberSellerCont {
	
	public MemberSellerCont() {
		System.out.println("------- MemberSellerCont() 객체 생성됨 ");
	}//MemberSellerCont() end
	

	@Autowired
	MemberSellerDAO memberSellerDao;
	
	
//  [로그인 / 로그아웃] 시작  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  //
	
	// [로그인] - 일반 or 판매자 로그인 선택 페이지 연결
	@RequestMapping(value = "/loginS.do", method = RequestMethod.GET)
	public String loginSeller() {
		return "memberSeller/loginFormSeller";
	}//loginSeller() end

	
	// [로그인] - 로그인 페이지 연결
	@RequestMapping(value = "/loginS.do", method = RequestMethod.POST)
	public ModelAndView loginSellerProc(@ModelAttribute MemberSellerDTO dto, 
														 HttpServletRequest req, 
														 HttpServletResponse resp, 
														 HttpSession session) throws Exception{
		
		// 사용자가 loginForm에 입력한 아이디(m_id) 와 비밀번호(m_pw) 가져오기.
		String id=dto.getP_id();
		String pw=dto.getP_pw();	
		
		// 아이디 저장 가져오기 <input type="checkbox" ${empty cookie.id.value ? "":"checked" } name="saveId" value="SAVE">아이디 저장</label>
		String saveId = req.getParameter("saveId");
		//System.out.println(saveId); 
		// -> 아이디저장 체크를 하면 "SAVE" 값이 들어오고, 체크하지않으면 null값이 들어온다.
		
		
		
		// DB에 저장돼있는 아이디와 비밀번호 비교해야함.
		dto.setP_id(id);
		dto.setP_pw(pw);
		
		// mapper에서 담아온 select문을 DAO에 담아준 후 그 값을 변수에 담아준다. --> B등급 나옴.
		String mem_grade = memberSellerDao.select(dto);
		
		
		// mapper -> DAO 에 담아온 sql문 값이 있는지? 없는지? 
		ModelAndView mav = new ModelAndView();
		if(!(mem_grade == null)) {
			// 로그인 성공
			// 로그인 되면 세션값 저장
			session.setAttribute("mem_grade", mem_grade);
			session.setAttribute("s_p_id", id);
			
			Cookie cookie=null;
			if(saveId!=null) {
				cookie = new Cookie("id", id);
				cookie.setMaxAge(24 * 30 * 60 * 60 * 1000); //30일간 저장
				resp.addCookie(cookie);
				
			}else {
				cookie = new Cookie("id", "");
				cookie.setMaxAge(0);
				resp.addCookie(cookie);
			}//if end
			
			// 홈으로 이동
			mav.setViewName("redirect:/home");
			
		}else {
			// 로그인 실패
			// 결과값을 0으로 지정.
			int result=0;
			// 0 값을 "result"라는 이름으로 사용할 수 있도록 만들어준다.
			session.setAttribute("result", result);
			
			// 실패하면 그대로 로그인 페이지에 남아있도록 링크를 걸어준다.
			mav.setViewName( "redirect:/loginS.do");
		}//if end
		
		mav.addObject("dto", dto);
		return mav;
		
	}//loginGeneralProc() end

	
	
    // [회원가입] 시작  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - //
	
	
	// [회원가입] - 약관동의 페이지 연결
	@RequestMapping(value = "/agreementS.do", method = RequestMethod.GET)
	public String agreementG() {
		return "memberSeller/agreementS";
	}//loginGeneral() end
	
	
	// [회원가입] - 회원가입 페이지 연결
	@RequestMapping(value = "/joinS.do", method = RequestMethod.GET)
	public String joinG() {		
		return "memberSeller/joinS";
	}//loginGeneral() end
	
	
	// [회원가입] - 아이디 중복체크
	@PostMapping("/idCheckS")
	@ResponseBody
	public int idCheckS(@RequestParam("p_id") String p_id) {
		int cnt = memberSellerDao.idCheckS(p_id);
		//System.out.println(cnt); -> 1이 들어오면 아이디가 있는 것! (중복)
		return cnt;
	}//idCheck() end
	
	
	// [회원가입] - 이메일 중복체크
	@PostMapping("/emailScheck")
	@ResponseBody
	public int emailScheck(@RequestParam("com_email") String com_email) {
		int cnt = memberSellerDao.emailScheck(com_email);
		//System.out.println(cnt); -> 1이 들어오면 아이디가 있는 것! (중복)
		return cnt;
	}//idCheck() end
	
	
	// // [회원가입] - 성공
	@RequestMapping(value = "/joinSproc.do", method = RequestMethod.POST)
	public String joinSproc( MemberSellerDTO dto, 
							 HttpServletRequest req, 
							 HttpServletResponse resp)throws Exception{
		//System.out.println(dto);
		
		int cnt = memberSellerDao.joinS(dto);
		
		try {
			if(cnt == 1) { //로그인 성공
			   req.setAttribute("msg", "회원가입을 축하합니다.");
			   req.setAttribute("url", "/home");
			}//if end
			
		} catch(Exception e) {
			e.printStackTrace();
		}//try end
		
		return "memberGeneral/alert";
		
	}//joinSellerProc() end
	
	
	@RequestMapping("/mypageS")
	public ModelAndView mypageSeller(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/memberSeller/mypageS");
		
		String p_id=(String)session.getAttribute("s_p_id");	
		
		mav.addObject("totorder_cnt", memberSellerDao.totorder_cnt(p_id));
		mav.addObject("delCom_cnt", memberSellerDao.delCom_cnt(p_id));
		mav.addObject("qnaN_cnt", memberSellerDao.qnaN_cnt(p_id));
		
		mav.addObject("recently_order", memberSellerDao.recently_order(p_id));
		mav.addObject("recently_qna", memberSellerDao.recently_qna(p_id));
		
		return mav;
	}//end
	
	@RequestMapping("/mypageS/qna")
	public ModelAndView mypageQnA(HttpSession session, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/memberSeller/qna_n");
		
		String p_id=(String)session.getAttribute("s_p_id");
		
		//페이징
		int totalRowCount = memberSellerDao.qnaN_cnt(p_id); // 총 개수
		
		//페이징설정 
		int numPerPage = 5;
		int pagePerBlock = 10;
		
		String pageNum = req.getParameter("pageNum");	// 현재 페이지값 받아오기
		if (pageNum == null) {
			pageNum = "1";
		}//if end
		
		int currentPage = Integer.parseInt(pageNum);			// 현재 페이지
		int startRow 	= (currentPage-1) * numPerPage + 1;		// 한 페이지 글 목록에서 시작하는 행
		int endRow		= currentPage * numPerPage; 			// 한 페이지 글 목록에서 끝나는 행
		
		// 페이지 수 
		double totcnt = (double)totalRowCount/numPerPage;		// 전체 페이지 수 (전체글개수 / 5개)
		int totalPage = (int)Math.ceil(totcnt);					// Math.ceil : 소수점 올림
		
		double d_page = (double)currentPage/pagePerBlock;		// 현재 페이지 넘버 / 전체 페이지 수
		int Pages = (int)Math.ceil(d_page) -1;					// 페이지 목록을 하나로 묶음? (1-10 목록은 1, 11-20 목록은 2)
		int startPage = Pages*pagePerBlock +1;					// 페이지 목록(ex 1~10번페이지 / 11~20번 페이지)에서 시작하는 페이지 넘버 (10개씩이면 1,11,21···.)
		int endPage = startPage + pagePerBlock -1;			    // 페이지 목록에서 마지막 페이지 넘버 (10개씩이면 10,20,30···.)
		
		List list = null;
        if (totalRowCount > 0) {
        	list = memberSellerDao.qnalist(startRow, endRow, p_id);
        } else {
            list = Collections.emptyList(); // 안 넣어도 상관 없음
        } // if end
        
        mav.addObject("total", totalRowCount);
        mav.addObject("qnalist",list);
        mav.addObject("pageNum", currentPage);

        mav.addObject("count", totalRowCount);
        mav.addObject("totalPage", totalPage);
        mav.addObject("startPage", startPage);
        mav.addObject("endPage", endPage);
		
		//mav.addObject("qnalist", memberSellerDao.qnalist(p_id));
		return mav;
	}//end
	
	@ResponseBody
	@RequestMapping(value = "/mypageS/answerIns", method = RequestMethod.POST)
	public int answerIns(@ModelAttribute AnswerDTO dto, HttpSession session) {
	
		String p_id=(String)session.getAttribute("s_p_id");	
		dto.setP_id(p_id);
		
		memberSellerDao.a_stusUpdate(dto.getQ_no());
		
		
		return memberSellerDao.answerInsert(dto);
	}//end
	
	@ResponseBody
	@RequestMapping(value = "/mypageS/answerOne", method = RequestMethod.GET)
	public String answerOne(@RequestParam int a_no) {
		return memberSellerDao.answerOne(a_no);
	}//end
	
	@RequestMapping("/mypageS/answer")
	public ModelAndView mypageANSWER(HttpSession session,HttpServletRequest req) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/memberSeller/qna_y");
		
		String p_id=(String)session.getAttribute("s_p_id");	
		//String p_id = "privatecurve"; 
		
		//페이징
		int totalRowCount = memberSellerDao.qnaY_cnt(p_id); // 총 개수
		
		//페이징설정 
		int numPerPage = 5;
		int pagePerBlock = 10;
		
		String pageNum = req.getParameter("pageNum");	// 현재 페이지값 받아오기
		if (pageNum == null) {
			pageNum = "1";
		}//if end
		
		int currentPage = Integer.parseInt(pageNum);			// 현재 페이지
		int startRow 	= (currentPage-1) * numPerPage + 1;		// 한 페이지 글 목록에서 시작하는 행
		int endRow		= currentPage * numPerPage; 			// 한 페이지 글 목록에서 끝나는 행
		
		// 페이지 수 
		double totcnt = (double)totalRowCount/numPerPage;		// 전체 페이지 수 (전체글개수 / 5개)
		int totalPage = (int)Math.ceil(totcnt);					// Math.ceil : 소수점 올림
		
		double d_page = (double)currentPage/pagePerBlock;		// 현재 페이지 넘버 / 전체 페이지 수
		int Pages = (int)Math.ceil(d_page) -1;					// 페이지 목록을 하나로 묶음? (1-10 목록은 1, 11-20 목록은 2)
		int startPage = Pages*pagePerBlock +1;					// 페이지 목록(ex 1~10번페이지 / 11~20번 페이지)에서 시작하는 페이지 넘버 (10개씩이면 1,11,21···.)
		int endPage = startPage + pagePerBlock -1;			    // 페이지 목록에서 마지막 페이지 넘버 (10개씩이면 10,20,30···.)
		
		List list = null;
        if (totalRowCount > 0) {
        	list = memberSellerDao.answerlist(startRow, endRow, p_id);
        } else {
            list = Collections.emptyList(); // 안 넣어도 상관 없음
        } // if end
        
        mav.addObject("total", totalRowCount);
        mav.addObject("answerlist",list);
        mav.addObject("pageNum", currentPage);

        mav.addObject("count", totalRowCount);
        mav.addObject("totalPage", totalPage);
        mav.addObject("startPage", startPage);
        mav.addObject("endPage", endPage);

		//mav.addObject("answerlist",memberSellerDao.answerlist(p_id));
		
		return mav;
	}//end
	
	@ResponseBody
	@RequestMapping (value = "/mypageS/answerUpdate", method = RequestMethod.POST)
	public int answerUpdate(@ModelAttribute AnswerDTO dto) {
		//System.out.println(dto.getContent());
		//System.out.println(dto.getA_no());
		return memberSellerDao.answerupdate(dto);
	}//end
}//class end 
