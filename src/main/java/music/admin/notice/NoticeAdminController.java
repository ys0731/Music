package music.admin.notice;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class NoticeAdminController {
	
	@Autowired
	NoticeAdminService service;
	
	//목록	
	@RequestMapping("/admin/notice/index.do")
	public String index(Model model,NoticeAdminVo vo) {
		model.addAttribute("vo",service.selectAll(vo)); 
		return "admin/notice/index";
	}
	
	//상세
	@RequestMapping("/admin/notice/view.do")
	public String view(Model model,NoticeAdminVo vo) {		
		model.addAttribute("vo",service.detail(vo));
		return "admin/notice/view";
	}	
	
	//쓰기
	@RequestMapping("/admin/notice/write.do")
	public String write() {		
		return "admin/notice/write";
	}	
	
	//등록
	@RequestMapping("/admin/notice/insert.do")
	public String insert(Model model,NoticeAdminVo vo,HttpServletRequest req) { 

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
	
	//수정폼
	@RequestMapping("/admin/notice/edit.do")
	public String edit(Model model,NoticeAdminVo vo) {
		model.addAttribute("vo",service.edit(vo));
		return "/admin/notice/edit";
	}
	
	//수정
	@RequestMapping("/admin/notice/update.do")
	public String update(Model model,NoticeAdminVo vo,HttpServletRequest req) {
		int r = service.update(vo);

		if(r>0) {
			model.addAttribute("msg","정상적으로 수정되었습니다.");
			model.addAttribute("url","index.do");
		}else {
			model.addAttribute("msg","수정실패");
			model.addAttribute("url","edit.do?no="+vo.getNo());		
		}
		
		return "/admin/include/alert";
	}
	
	
	//삭제
	@RequestMapping("/admin/notice/delete.do") 
	public String delete(Model model,NoticeAdminVo vo, @RequestParam(value="chbox[]") List<String> chArr) {
		
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
	 
	 
	 
