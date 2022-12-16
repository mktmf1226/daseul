package kr.co.itwill.point;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PointCont {

	public PointCont() {
		System.out.println("-----PointCont() 객체생성됨");
	}//end
	
	@Autowired
	PointDAO pointDao;
	
	
	@RequestMapping("pointDetail/detail")
	public ModelAndView list() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("pointDetail/detail");
		
		List<PointDTO> list=pointDao.list();
		mav.addObject("list", list);
		return mav;
	}//list() end
	
}//class end
