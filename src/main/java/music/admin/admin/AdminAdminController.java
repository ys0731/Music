package music.admin.admin;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import music.user.UserService;
import music.user.UserVo;


@Controller
public class AdminAdminController {

	@Autowired
	AdminService service;
	@Autowired
	UserService uService;	
	
	//로그인
	@GetMapping("/admin/login.do")
	public String loginForm(AdminVo vo, @CookieValue(value="cookieId", required = false) Cookie cookie) {
		if (cookie != null) {
			vo.setId(cookie.getValue());
		}
		return "admin/admin/login";
	}
	
	@PostMapping("/admin/login.do")
	public String login(Model model, AdminVo vo, HttpServletRequest req, HttpServletResponse res, HttpSession sess) {
		AdminVo av = service.login(vo);
		if (av == null) {
			model.addAttribute("msg", "아이디 비밀번호가 올바르지 않습니다.");
			model.addAttribute("url", "login.do");
			return "include/alert";
		} else {
			sess.setAttribute("adminInfo", av);
			// 쿠키에 저장
			Cookie cookie = new Cookie("cookieId", vo.getId()); 
			cookie.setPath("/");
			if ("check".equals(vo.getCheckId())) {
				cookie.setMaxAge(60*60*24*365);
			} else {
				cookie.setMaxAge(0);
			}
			res.addCookie(cookie);
			
			return "redirect:/admin/notice/index.do";
		}
	}
	
	//로그아웃
	@GetMapping("/admin/logout.do")
	public String logout(Model model, HttpSession sess) {
		sess.invalidate();
		model.addAttribute("msg", "로그아웃되었습니다.");
		model.addAttribute("url", "/music/admin/login.do");
		return "include/alert";
	}
	
	//회원 목록
	@RequestMapping("/admin/user/index.do")
	public String index(Model model, UserVo vo) {
		model.addAttribute("list", uService.selectAll(vo));
		return "admin/admin/index";
	}
	
	//회원 삭제
	@RequestMapping("/admin/user/delete.do")
	public String delete(Model model, UserVo vo, @RequestParam(value="chbox[]") List<String> chArr) {
		
		int r = 0;
		int no = 0;
		
		for(String i : chArr) {
			no = Integer.parseInt(i);
			vo.setNo(no);
			r = uService.delete(vo);
		}
		
		if(r>0) {
			model.addAttribute("msg","true");
		}else {
			model.addAttribute("msg","false");
		}		
		return "/admin/include/result";

	}	
	
}
