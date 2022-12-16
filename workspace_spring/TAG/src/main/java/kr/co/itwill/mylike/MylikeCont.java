package kr.co.itwill.mylike;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MylikeCont {

	public MylikeCont() {
		System.out.println("-----MylikeCont() 객체생성됨");
	}//end
	
	@Autowired
	MylikeDAO mylikeDao;
	
	/*
	@RequestMapping("mypage/mylike")
	public String mylike() {
		return "mypage/mylike";
	}//mylike() end
	*/
	
	@RequestMapping("mypage/mylike")
	public ModelAndView list(HttpSession session) {
		
		//현재 로그인되어 있는 아이디
		//나중에 소스 취합할때 주석 지우고 이부분으로 하면 됨
		//String s_m_id=(String)session.getAttribute("s_m_id");		
		String s_m_id="daseul";//소스 취합할때 이 줄 삭제하고, 위줄에 있는 거로 해야 함
		
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("mypage/mylike");
		
		List<MylikeDTO> list=mylikeDao.list(s_m_id);
		mav.addObject("list", list);
		
		
		//공연 이미지만 추출하기
		//결과값 prep.png, Maksim.jpg 모으기
		List<String> imglist_c=new ArrayList<>();		
		//-----------------------------------------------------------------------
		List<Map<String, String>> list_c=mylikeDao.list_c(s_m_id);
		//DB에서 가져온 정보
		//{like_li=1, edit=8세 이상 / prep.png / 전R석, like_cd=C, lno=5, m_id=daseul}
		//{like_li=4, edit=만 7세이상 / Maksim.jpg / 전 R석 / 가격 R132000 /  22.12.24 ~ 22.12.25, like_cd=C, lno=4, m_id=daseul}
		//System.out.println("------"+list_c.size()); //DB에서 가져온 행의 갯수
		
		
		//DB에서 가져온 정보(list_c)에서 "prep.png"정보만 추출하기
		for(int i=0; i<list_c.size(); i++) {
			//System.out.println(list_c.get(i));
			//DB에서 가져온 정보(list_c)는 자료형이 Map이기 때문에, 문자열로 형변환 해야 한다(참조 46행의 List<Map<String, String>>)
			//왜? 문자열에서 내가 원하는 정보만 추출하기 위해서
			//"{like_li=1, edit=8세 이상 / prep.png / 전R석, like_cd=C, lno=5, m_id=daseul}"
			String concert=list_c.get(i).toString();			
			//System.out.println(concert);
			
			
			//concert변수에서 ,를 기준으로 문자열 분리하기
			//{like_li=1
			// edit=8세 이상 / prep.png / 전R석
			//		 like_cd=C
			//		 lno=5
			//		 m_id=daseul}
			String[] c=concert.split(",");
			//for(int j=0; j<c.length; j++) {
			//	System.out.println(c[j]);
			//}
			
			//c[1]값에서 "prep.png" 추출하기 위해서 / 를 기준으로 문자열 분리하기
			String[] d=c[1].split("/");
			//for(int j=0; j<d.length; j++) {
			//	System.out.println("#" + d[j].trim() + "#");
			//}
			
			// /기호 앞뒤의 공백을 제거한후 imglist_c변수에 추가하기(50행 변수 참조)
			imglist_c.add(d[1].trim());
		}//for end
		
		mav.addObject("imglist_c", imglist_c);
		//-------------------------------------------------------------------------
		
		
		
		
		
		List<Map<String, String>> list_p=mylikeDao.list_p(s_m_id);
		mav.addObject("list_p", list_p);
		
		
		
		return mav;
	}//list() end
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}//class end
