package music.admin.qna;

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
public class QnaAdminController {
	
	@Autowired
	QnaAdminService service;
	
	//목록	
	@RequestMapping("/admin/qna/index.do")
	public String index(Model model,QnaAdminVo vo) {
		
		//new 시간 설정 
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DAY_OF_MONTH, -1); //하루
        //System.out.println("날짜:"+cal);
        String nowday = format.format(cal.getTime());
        
        model.addAttribute("nowday",nowday);
		model.addAttribute("vo",service.selectAll(vo)); 
		return "admin/qna/index";
	}
	
	//상세
	@RequestMapping("/admin/qna/view.do")
	public String view(Model model,QnaAdminVo vo) {		
		model.addAttribute("vo",service.detail(vo));
		return "admin/qna/view";
	}	
	
	
	//수정폼
	@RequestMapping("/admin/qna/edit.do")
	public String edit(Model model,QnaAdminVo vo) {
		model.addAttribute("vo",service.edit(vo));
		return "/admin/qna/edit";
	}
	
	//수정
	@RequestMapping("/admin/qna/update.do")
	public String update(Model model,QnaAdminVo vo,HttpServletRequest req) {
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
	@RequestMapping("/admin/qna/delete.do") 
	public String delete(Model model,QnaAdminVo vo, @RequestParam(value="chbox[]") List<String> chArr) {
		
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

		@RequestMapping("/admin/qna/userpost.do") 
		public String userpost(Model model,QnaAdminVo vo) {
			
			//new 시간 설정 
	        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	        Calendar cal = Calendar.getInstance();
	        cal.add(Calendar.DAY_OF_MONTH, -1); //하루
	        //System.out.println("날짜:"+cal);
	        String nowday = format.format(cal.getTime());
	        
	        model.addAttribute("nowday",nowday);
			model.addAttribute("vo",service.selectAll(vo)); 
			return "admin/qna/userpost";
		}
	 
		
		
		//하나로 쓰면안돼,, 분류하자.. 관리자/일반 로그인인터셉터 어떻게 구분할건데 ...... 
		
		//쓰기
//		@RequestMapping("/qna/write.do")
//		public String write() {		
//			return "qna/write";
//			
//		}	
		
		//등록
//		@RequestMapping("/admin/qna/insert.do")
//		public String insert(Model model,QnaVo vo,HttpServletRequest req) { 
	//
//			int r = service.insert(vo);
	//
//			if(r>0) {
//				model.addAttribute("msg","정상적으로 등록되었습니다.");
//				model.addAttribute("url","index.do");
//			}else {
//				model.addAttribute("msg","등록실패");
//				model.addAttribute("url","write.do");		
//			}
//			
//			return "/admin/include/alert";
//		}
		
		
		
}
	 
	 
	 
