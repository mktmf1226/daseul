package kr.co.itwill.cart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CartCont {
	
	public CartCont() {
		System.out.println("------- CartCont() 객체 생성됨 ");
	}// CartCont()

	
	@Autowired
	CartDAO cartDao;
	
	
//  [장바구니] 시작 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  //
	
	@RequestMapping("/cart")
	public ModelAndView cart() {
		
        ModelAndView mav = new ModelAndView();
        mav.setViewName("cart/cartList");
		
        return mav;
	}// concertList() end
	
	
	
}//class end
