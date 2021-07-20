package music.user;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class UserController {

	@Autowired
	UserService service;

	//회원 가입
	@RequestMapping("/user/insert.do")
	public String write(UserVo vo,Model model) {
		return "user/insert";
	}
	
	@RequestMapping("/user/insertAjax.do")
	public String insertAjax(UserVo vo,Model model, HttpServletRequest req) {
		int r = service.insert(vo);
		if (r > 0) {
			model.addAttribute("msg", "true");
		} else {
			model.addAttribute("msg", "false");
		}
		return "include/result";
	}
	
	//아이디 중복체크
	@RequestMapping("/user/isDuplicateId.do")
	public String isDuplicateId(Model model, @RequestParam String id) {
		if (service.isDuplicateId(id) == 0) {
			model.addAttribute("msg", "false");
		} else {
			model.addAttribute("msg", "true");
		}
		return "include/result";
	}

	//닉네임 중복체크
	@RequestMapping("/user/isDuplicateNickname.do")
	public String isDuplicateNickname(Model model, @RequestParam String nickname) {
		if (service.isDuplicateNickname(nickname) == 0) {
			model.addAttribute("msg", "false");
		} else {
			model.addAttribute("msg", "true");
		}
		return "include/result";
	}	
	
	//비밀번호 유효성 검사
	@RequestMapping("/user/isVaildPwd.do")
	public String isVaildPwd(Model model, @RequestParam String pwd) {
		
		String password = pwd;
		
		//숫자,영어,특수문자 포함한 글자 정규식 
		String regex = "^((?=.*\\d)(?=.*[a-zA-Z])(?=.*[\\W]).{8,20})$";
		
		//공백 문자 정규식
		String blank = "(\\s)";
		
		//문자열 길이 
		int pwdLength = password.toUpperCase().length();
		
		//비밀번호 정규식 체크
		Matcher matcher = Pattern.compile(regex).matcher(password);		
		Matcher matcher2 = Pattern.compile(blank).matcher(password);
		
		if(!matcher.find() || matcher2.find() || (pwdLength > 20 || pwdLength < 8)) {
			model.addAttribute("msg", "false");			
		}else {
			model.addAttribute("msg", "true");	
		}
		return "include/result";
	}			
	
	
	//로그인
	@GetMapping("/user/login.do")
	public String loginForm(UserVo vo, @CookieValue(value="cookieId", required = false) Cookie cookie) {
		if (cookie != null) {
			vo.setId(cookie.getValue());
		}
		return "user/login";
	}
	
	@PostMapping("/user/login.do")
	public String login(Model model, UserVo vo, HttpServletRequest req, HttpServletResponse res, HttpSession sess) {
		UserVo uv = service.login(vo);
		if (uv == null) {
			model.addAttribute("msg", "아이디 비밀번호가 올바르지 않습니다.");
			model.addAttribute("url", "login.do");
			return "include/alert";
		} else {
			sess.setAttribute("userInfo", uv);
			// 쿠키에 저장
			Cookie cookie = new Cookie("cookieId", vo.getId()); //아이디 쿠키에 저장 
			cookie.setPath("/");
			if ("check".equals(vo.getCheckId())) {
				cookie.setMaxAge(60*60*24*365);
			} else {
				cookie.setMaxAge(0);
			}
			res.addCookie(cookie);
			
			return "redirect:/index.do";
		}
	}
	
	//로그아웃
	@GetMapping("/user/logout.do")
	public String logout(Model model, HttpSession sess) {
		sess.invalidate();
		model.addAttribute("msg", "로그아웃되었습니다.");
		model.addAttribute("url", "/music/notice/index.do");
		return "include/alert";
	}
	
	//아이디찾기
	@RequestMapping(value = "/user/searchId.do", method = RequestMethod.GET)
	public String searchId(Model model, UserVo vo) {
		return "user/searchId";
	}
	@RequestMapping(value = "/user/searchId.do", method = RequestMethod.POST)
	public String searchId2(Model model, UserVo vo) {
		UserVo uv = service.searchId(vo);
		String id = "";
		if (uv != null) {
			id = uv.getId();
		}
		model.addAttribute("msg", id);
		return "include/result";
	}
	
	//비밀번호 찾기
	@RequestMapping(value = "/user/searchPwd.do", method = RequestMethod.GET)
	public String searchPwd(Model model, UserVo vo) {
		return "user/searchPwd";
	}
	@RequestMapping(value = "/user/searchPwd.do", method = RequestMethod.POST)
	public String searchPwd2(Model model, UserVo vo) {
		UserVo uv = service.searchPwd(vo);
		if(uv != null) {
			model.addAttribute("msg", "ok");
		} else {
			model.addAttribute("msg", "no");
		}
		return "include/result";
	}
	
}
