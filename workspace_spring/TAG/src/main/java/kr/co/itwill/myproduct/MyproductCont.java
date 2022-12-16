package kr.co.itwill.myproduct;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.itwill.myproduct.MyproductDTO;

@Controller
public class MyproductCont {

	public MyproductCont() {
		System.out.println("-----MyproductCont() 객체생성됨");
	}//end
	
	@Autowired
	MyproductDAO myproductDao;
	
	/*
	@RequestMapping("mypage/myproduct")
	public String myproduct() {
		return "mypage/myproduct";
	}//myproduct() end
	*/
	
	@RequestMapping("mypage/myproduct")
	public ModelAndView list() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("mypage/myproduct");
		
		List<MyproductDTO> list=myproductDao.list();
		mav.addObject("list", list);
		return mav;
	}//list() end
	
}//class end
