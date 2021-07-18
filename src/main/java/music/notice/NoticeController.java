package music.notice;


import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class NoticeController {
	
	@Autowired
	NoticeService service;
	
	//목록	
	@RequestMapping("/notice/index.do")
	public String index(Model model,NoticeVo vo) {
		
		//new 시간 설정 
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DAY_OF_MONTH, -1); //하루
        String nowday = format.format(cal.getTime());
        
        model.addAttribute("nowday",nowday);
		model.addAttribute("vo",service.selectAll(vo)); 
		return "notice/index";
	}
	
	//상세
	@RequestMapping("/notice/view.do")
	public String view(Model model,NoticeVo vo) {		
		model.addAttribute("vo",service.detail(vo));
		return "/notice/view";
	}	
	
	
	 
}
	 
	 
	 
