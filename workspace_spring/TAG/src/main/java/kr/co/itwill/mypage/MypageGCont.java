package kr.co.itwill.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageGCont {
	
	public MypageGCont() {
		System.out.println("-----MypageGCont() 객체생성됨");
	}//end
	
	@RequestMapping("mypage/mypageG")
	public String mypage() {
		return "mypage/mypageG";
	}//mypage() end
	
	
	
	
}//class end
