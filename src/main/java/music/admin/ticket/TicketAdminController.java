package music.admin.ticket;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import music.ticket.TicketService;
import music.ticket.TicketVo;

@Controller
public class TicketAdminController {
	
	@Autowired
	TicketService service;
	
	//목록
	@RequestMapping("/admin/ticket/index.do")
	public String index(TicketVo vo, HttpSession sess,Model model) {	
		model.addAttribute("vo",service.selectAll(vo));
		return "admin/ticket/index";
	}
	//쓰기
	@RequestMapping("/admin/ticket/write.do")
	public String write() {		
		return "admin/ticket/write";
	}	
	
	//등록
	@RequestMapping("/admin/ticket/insert.do")
	public String insert(Model model,TicketVo vo,HttpServletRequest req) { 

		int r = service.insert(vo);

		if(r>0) {
			model.addAttribute("msg","정상적으로 등록되었습니다.");
			model.addAttribute("url","index.do");
		}else {
			model.addAttribute("msg","등록실패");
			model.addAttribute("url","write.do");		
		}
		
		return "/admin/include/alert";
	}
	
	
	//삭제
	@RequestMapping("/admin/ticket/delete.do") 
	public String delete(Model model,TicketVo vo, @RequestParam(value="chbox[]") List<String> chArr) {
		
		int r = 0;
		int no = 0;
		
		for(String i : chArr) {
			no = Integer.parseInt(i);
			vo.setNo(no);
			r = service.delete(vo);
		}
		
		if(r>0) {
			model.addAttribute("msg","true");
		}else {
			model.addAttribute("msg","false");
		}		
		return "/admin/include/result";
	}
	
}
