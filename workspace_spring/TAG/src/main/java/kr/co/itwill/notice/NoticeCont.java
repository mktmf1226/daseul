package kr.co.itwill.notice;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Controller
@RequestMapping("/")
public class NoticeCont {

	public NoticeCont() {
		System.out.println("-----NoticeCont() 객체생성됨");
	}//end
	
	@Autowired
	NoticeDAO noticeDao;
	
	
	@RequestMapping(value="write")
	public String write() {
		return "/notice/write";
	}//write() end
	
	/*
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public void insert(@ModelAttribute NoticeDTO dto) {
		
		String subject=dto.getSubject();
		System.out.println(subject);//null
		
		
	}*/
	
	/*
	@RequestMapping("/notice.do")
	public ModelAndView list() {
		ModelAndView mav=new ModelAndView();
		//redirect : 등록한 명령어를 호출할 수 있다		
		mav.setViewName("notice/list");
		return mav;
	}//home() end
	*/
	
	
	
	@RequestMapping(value = "notice/insert", method = RequestMethod.POST)
	public String insert(@RequestParam String subject, @RequestParam String edit) throws Exception {

		NoticeDTO notice=new NoticeDTO();
		notice.setSubject(subject);
		notice.setEdit(edit);
		
		noticeDao.insert(notice);
		return "redirect:/notice/list";
	}//insert() end
		
	
	@RequestMapping("notice/list")
	public ModelAndView list() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("notice/list");
		
		List<NoticeDTO> list=noticeDao.list();
		//System.out.println(list.size());		
		mav.addObject("list", list);
		mav.addObject("cnt", list.size());
		return mav;
	}//list() end
	
	/*	
	@RequestMapping("/list")
	private List<NoticeDTO> list(@RequestParam String subject, @RequestParam String edit) throws Exception {
		return noticeDao.list(subject);
	}//list() end
	*/
	
	@ResponseBody
	@RequestMapping("notice/detail/{n_no}")
	public ModelAndView detail(@PathVariable int n_no) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("notice/detail");
		mav.addObject("notice", noticeDao.detail(n_no));
		return mav;
	}//detail() end
	
	
	
	@RequestMapping("notice/update")
	public ModelAndView update(@RequestParam int n_no) throws Exception {

		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/notice/update");
		mav.addObject("notice", noticeDao.detail(n_no));
	
		return mav;
	}//update() end
	
	@RequestMapping("notice/updateProc")
	public String updateProc(@ModelAttribute NoticeDTO dto) throws Exception {
		//notice.setSubject();
		//notice.setEdit();
		
		noticeDao.update(dto);		
		return "redirect:/notice/detail/" + dto.getN_no();
	}//update() end
	
	@RequestMapping("notice/delete")
	public String delete(int n_no) throws Exception {
		noticeDao.delete(n_no);
		return "redirect:/notice/list";
	}//delete() end
	
   
   
}//class end
