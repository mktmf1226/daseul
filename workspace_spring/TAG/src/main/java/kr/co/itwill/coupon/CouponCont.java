package kr.co.itwill.coupon;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.itwill.coupon.CouponDTO;

@Controller
public class CouponCont {

	public CouponCont() {
		System.out.println("-----CouponCont() 객체생성됨");
	}//end
	
	@Autowired
	CouponDAO couponDao;
	
	
	@RequestMapping("couponDetail/detail")
	public ModelAndView list() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("couponDetail/detail");
		
		List<CouponDTO> list=couponDao.list();
		mav.addObject("list", list);
		//mav.addObject("cnt", list.size());
		return mav;
	}//list() end
	
}//class end
