package music.ticket;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import music.pay.PayService;
import music.pay.PayVo;
import music.user.UserVo;


@Controller
public class TicketController {
	
	@Autowired
	TicketService service;
	
	@Autowired
	PayService pService;	
	
	//목록
	@RequestMapping("/ticket/index.do")
	public String index(TicketVo vo, PayVo pv, HttpSession sess,Model model) {		
		pv.setUser_no(((UserVo)sess.getAttribute("userInfo")).getNo());
		model.addAttribute("list",pService.selectAll(pv));
		model.addAttribute("vo",service.selectAll(vo));
		return "ticket/index";
	}
	
	
}
