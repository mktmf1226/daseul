package kr.co.itwill.concert;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ConcertCont {
	
	public ConcertCont() {
		System.out.println("------- ConcertCont() 객체 생성됨 ");
	}// ConcertCont()
	
	@Autowired
	ConcertDAO concertDao;
	
	
//  [콘서트 리스트 - 전체보기] 시작 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  //
	
	@RequestMapping("/concert")
	public ModelAndView concertList(HttpServletRequest req) {
		
        ModelAndView mav = new ModelAndView();
        mav.setViewName("concert/concertList");
        
        int totalRowCount = concertDao.concertTotal();
        
        
        // 페이징 파트
        int numPerPage = 9; // 한 페이지당 레코드(글) 갯수
        int pagePerBlock = 5; // 페이지 리스트 (블럭당 페이지 수)

        // 현재 페이지 번호 (문자형)
        String pageNum = req.getParameter("pageNum");
        //System.out.println(pageNum);
        
        if (pageNum == null) {
            pageNum = "1";
        } // if end

        int currentPage = Integer.parseInt(pageNum);
        int startRow = (currentPage - 1) * numPerPage + 1;
        int endRow = currentPage * numPerPage;
        double totcnt = (double) totalRowCount / numPerPage;
        int totalPage = (int) Math.ceil(totcnt);
        double d_page = (double) currentPage / pagePerBlock;
        int Pages = (int)Math.ceil(d_page)-1;
        int startPage = Pages * pagePerBlock+1;
        int endPage = startPage + pagePerBlock-1;
        
        List list = null;
        if (totalRowCount > 0) {
        	list = concertDao.concertListLatest(startRow, endRow);//1, 5, M
        } else {
            list = Collections.emptyList(); // 안 넣어도 상관 없음
        } // if end
        		
        mav.addObject("list", list);
        
 	    mav.addObject("total", totalRowCount);
        mav.addObject("pageNum", currentPage);
        mav.addObject("count", totalRowCount);
        mav.addObject("totalPage", totalPage);
        mav.addObject("startPage", startPage);
        mav.addObject("endPage", endPage);
        
        return mav;
	}// concertList() end
	
	
	
	
	
	
//  [콘서트 리스트 - 지난공연] 시작 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  //
	@RequestMapping("/concert/past")
	public ModelAndView pastConcertList(HttpServletRequest req) {
		
        ModelAndView mav = new ModelAndView();
        mav.setViewName("concert/concertList");
        
        int totalRowCount = concertDao.pastConcertTotal();
        
        
        // 페이징 파트
        int numPerPage = 9; // 한 페이지당 레코드(글) 갯수
        int pagePerBlock = 5; // 페이지 리스트 (블럭당 페이지 수)

        // 현재 페이지 번호 (문자형)
        String pageNum = req.getParameter("pageNum");
        //System.out.println(pageNum);
        
        if (pageNum == null) {
            pageNum = "1";
        } // if end

        int currentPage = Integer.parseInt(pageNum);
        int startRow = (currentPage - 1) * numPerPage + 1;
        int endRow = currentPage * numPerPage;
        double totcnt = (double) totalRowCount / numPerPage;
        int totalPage = (int) Math.ceil(totcnt);
        double d_page = (double) currentPage / pagePerBlock;
        int Pages = (int)Math.ceil(d_page)-1;
        int startPage = Pages * pagePerBlock+1;
        int endPage = startPage + pagePerBlock-1;
        
        List list = null;
        if (totalRowCount > 0) {
        	list = concertDao.pastConcertList(startRow, endRow);//1, 5, M
        } else {
            list = Collections.emptyList(); // 안 넣어도 상관 없음
        } // if end
        
        //System.out.println(list);
        
        mav.addObject("list", list);
        
 	    mav.addObject("total", totalRowCount);
        mav.addObject("pageNum", currentPage);
        mav.addObject("count", totalRowCount);
        mav.addObject("totalPage", totalPage);
        mav.addObject("startPage", startPage);
        mav.addObject("endPage", endPage);
        
        return mav;
	}//pastConcertList end
	
	
	
//  [콘서트 리스트 - 예정된 공연] 시작 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  //
	@RequestMapping("/concert/scheduled")
	public ModelAndView yejungConcertList(HttpServletRequest req) {
		
        ModelAndView mav = new ModelAndView();
        mav.setViewName("concert/concertList");
        
        int totalRowCount = concertDao.yejungConcertTotal();
        
        
        // 페이징 파트
        int numPerPage = 9; // 한 페이지당 레코드(글) 갯수
        int pagePerBlock = 5; // 페이지 리스트 (블럭당 페이지 수)

        // 현재 페이지 번호 (문자형)
        String pageNum = req.getParameter("pageNum");
        //System.out.println(pageNum);
        
        if (pageNum == null) {
            pageNum = "1";
        } // if end

        int currentPage = Integer.parseInt(pageNum);
        int startRow = (currentPage - 1) * numPerPage + 1;
        int endRow = currentPage * numPerPage;
        double totcnt = (double) totalRowCount / numPerPage;
        int totalPage = (int) Math.ceil(totcnt);
        double d_page = (double) currentPage / pagePerBlock;
        int Pages = (int)Math.ceil(d_page)-1;
        int startPage = Pages * pagePerBlock+1;
        int endPage = startPage + pagePerBlock-1;
        
        List list = null;
        if (totalRowCount > 0) {
        	list = concertDao.yejungConcertList(startRow, endRow);//1, 5, M
        } else {
            list = Collections.emptyList(); // 안 넣어도 상관 없음
        } // if end
        
        //System.out.println(list);
        
        mav.addObject("list", list);
        
 	    mav.addObject("total", totalRowCount);
        mav.addObject("pageNum", currentPage);
        mav.addObject("count", totalRowCount);
        mav.addObject("totalPage", totalPage);
        mav.addObject("startPage", startPage);
        mav.addObject("endPage", endPage);
        
        return mav;
	}//pastConcertList end
	

//  [콘서트 리스트 - 검색] 시작 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  //
	@RequestMapping("/searchConcert")
	public ModelAndView search(@RequestParam(defaultValue = "") String title) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("concert/concertList");
		mav.addObject("list", concertDao.searchConcert(title));
		
		mav.addObject("title", title);
		
		return mav;
	}//search() end
	
	
	
//  [콘서트 상세] 시작 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  //
	@RequestMapping("/concert/{c_no}")
	public ModelAndView concertDetail(@PathVariable String c_no) {
		//System.out.println("11111111" );
		//System.out.println("earlybirdCheck" + concertDao.earlybirdCheck(c_no));
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("concert/concertDetail");
		mav.addObject("concert", concertDao.detailConcert(c_no));
		mav.addObject("earlybird", concertDao.earlybirdCheck(c_no));
		
		return mav;
	}//concertDetail() end
	
	

	
	
}// class end
