package music.qna;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class QnaController {
	
	@Autowired
	QnaService service;
	
	
	//등록폼
	@RequestMapping("/qna/write.do")
	public String write() {		
		return "qna/write";
		
	}	
	
	//등록
	@RequestMapping("/qna/insert.do")
	public String insert(Model model,QnaVo vo,HttpServletRequest req) { 

		int r = service.insert(vo);

		if(r>0) {
			model.addAttribute("msg","정상적으로 등록되었습니다.");
			model.addAttribute("url","index.do");
		}else {
			model.addAttribute("msg","등록실패");
			model.addAttribute("url","write.do");		
		}
		
		return "include/alert";
	}
		
	//목록	
	@RequestMapping("/qna/index.do")
	public String index(Model model,QnaVo vo) {
		
		//new 시간 설정 
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DAY_OF_MONTH, -1); //하루
        //System.out.println("날짜:"+cal);
        String nowday = format.format(cal.getTime());
        
        model.addAttribute("nowday",nowday);
		model.addAttribute("vo",service.selectAll(vo)); 
		return "qna/index";
	}
	
	//상세
	@RequestMapping("/qna/view.do")
	public String view(Model model,QnaVo vo) {		
		model.addAttribute("vo",service.detail(vo));
		return "/qna/view";
	}	
	
	
	//수정폼
	@RequestMapping("/qna/edit.do")
	public String edit(Model model,QnaVo vo) {
		model.addAttribute("vo",service.edit(vo));
		return "qna/edit";
	}
	
	//수정
	@RequestMapping("/qna/update.do")
	public String update(Model model,QnaVo vo,HttpServletRequest req) {
		int r = service.update(vo);

		if(r>0) {
			model.addAttribute("msg","정상적으로 수정되었습니다.");
			model.addAttribute("url","index.do");
		}else {
			model.addAttribute("msg","수정실패");
			model.addAttribute("url","edit.do?no="+vo.getNo());		
		}
		
		return "include/alert";
	}
	
	
	//삭제
	@RequestMapping("/qna/delete.do") 
	public String delete(Model model,QnaVo vo) {
		
		int r = service.delete(vo);
		if (r > 0) {
			model.addAttribute("msg", "true");
		} else {
			model.addAttribute("msg", "false");
		}
		return "include/result";
	}
//
//		@RequestMapping("/admin/qna/userpost.do") 
//		public String userpost(Model model,QnaVo vo) {
//			
//			//new 시간 설정 
//	        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//	        Calendar cal = Calendar.getInstance();
//	        cal.add(Calendar.DAY_OF_MONTH, -1); //하루
//	        //System.out.println("날짜:"+cal);
//	        String nowday = format.format(cal.getTime());
//	        
//	        model.addAttribute("nowday",nowday);
//			model.addAttribute("vo",service.selectAll(vo)); 
//			return "admin/qna/userpost";
//		}
//	 
		
	
		
}
	 
	 
	 
