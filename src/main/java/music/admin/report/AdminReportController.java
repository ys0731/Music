package music.admin.report;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class AdminReportController {
	
	@Autowired
	AdminReportService rservice;
	
	@RequestMapping("/admin/report/index.do")
	public String index(Model model,AdminReportVo vo) {
		model.addAttribute("vo",rservice.selectAll(vo));
		
		return "admin/report/index";
	}
	
	@RequestMapping("/admin/report/view.do")
	public String detail(Model model,AdminReportVo vo,HttpServletRequest req) {
		int no = Integer.parseInt(req.getParameter("no"));
		vo.setNo(no);
		model.addAttribute("vo",rservice.detail(vo));
		
		return "admin/report/view";
	}
	
	@RequestMapping("/admin/report/delete.do")
	public String delete(Model model,AdminReportVo vo,HttpServletRequest req, @RequestParam int no,
			@RequestParam int al_co_no, @RequestParam int ar_co_no, @RequestParam int user_no) {
		vo.setAl_no(al_co_no);
		vo.setAr_no(ar_co_no);
		vo.setUser_no(user_no);
		int r = rservice.delete(vo);
		if (r > 0) {
			model.addAttribute("msg", "true");
		} else {
			model.addAttribute("msg", "false");
		}
		return "include/result";
	}
	
	//유저가 신고버튼 누를시
	@RequestMapping("/user/report/insert.do")
	public String insert(Model model,AdminReportVo vo, HttpServletRequest req, @RequestParam int user_no,
			@RequestParam int artist_co_no, @RequestParam int album_co_no) {
				
		vo.setUser_no(user_no);
		vo.setAl_no(album_co_no); //아티스트 댓글을 신고하면 0을 set
		vo.setAr_no(artist_co_no); //앨범 댓글을 신고하면 0을 set
		int r = rservice.insert(vo);
		if (r > 0) {
			model.addAttribute("msg", "true");
		} else {
			model.addAttribute("msg", "false");
		}
		return "include/result";
		//완
		
	}
}
