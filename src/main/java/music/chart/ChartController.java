package music.chart;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import music.admin.album.AdminAlbumService;
import music.admin.album.AdminAlbumVo;
import music.like.LikeService;
import music.like.LikeVo;
import music.user.UserService;
import music.user.UserVo;

@Controller
public class ChartController {
	
	@Autowired
	ChartService service;
	
	@Autowired
	LikeService lservice;
	
	@Autowired
	UserService uservice;

	
	//실시간 순위 차트
	@RequestMapping("/chart/chart_24hit.do")
	public String chart_24hits(ChartVo vo, Model model, UserVo uv, HttpSession sess) {
		uv = (UserVo)sess.getAttribute("userInfo"); //로그인한 유저의 정보
		if(uv != null) {  //로그인 했으면
			int uno = uv.getNo(); 
			vo.setUser_no(uno);  //로그인한유저의 번호를 ChartVo에 set
		}
		model.addAttribute("list", service.ChartList_24hits(vo));
		return "chart/chart_chart_24hits";
	}
	
	//일간 순위 차트
	@RequestMapping("/chart/chart_daily.do")
	public String chart_daily(ChartVo vo, Model model,UserVo uv, HttpSession sess) {
		uv = (UserVo)sess.getAttribute("userInfo"); //로그인한 유저의 정보
		if(uv != null) {  //로그인 했으면
			int uno = uv.getNo(); 
			vo.setUser_no(uno);  //로그인한유저의 번호를 ChartVo에 set
			model.addAttribute("list", service.ChartList_daily(vo));
			return "chart/chart_chart_daily";
		} else {		
			model.addAttribute("list", service.ChartList_daily(vo));
			return "chart/chart_chart_daily";
		}
	}
	
	//주간 순위 차트
	@RequestMapping("/chart/chart_weekly.do")
	public String chart_weekly(ChartVo vo, Model model, UserVo uv, HttpSession sess) {
		uv = (UserVo)sess.getAttribute("userInfo"); //로그인한 유저의 정보
		if(uv != null) {  //로그인 했으면
			int uno = uv.getNo(); 
			vo.setUser_no(uno);  //로그인한유저의 번호를 ChartVo에 set
			model.addAttribute("list", service.ChartList_weekly(vo));
			return "chart/chart_chart_weekly";
		} else {		
			model.addAttribute("list", service.ChartList_weekly(vo));
			return "chart/chart_chart_weekly";
		}
	}
	
	//장르-클래식 
	@RequestMapping("/chart/chart_genre_classic.do")
	public String chart_classic(ChartVo vo, Model model, UserVo uv, HttpSession sess) {
		uv = (UserVo)sess.getAttribute("userInfo"); //로그인한 유저의 정보
		if(uv != null) {  //로그인 했으면
			int uno = uv.getNo(); 
			vo.setUser_no(uno);  //로그인한유저의 번호를 ChartVo에 set
			model.addAttribute("list", service.ChartList_classic(vo));
			return "chart/chart_genre_classic";
		} else {		
			model.addAttribute("list", service.ChartList_classic(vo));
			return "chart/chart_genre_classic";
		}
	}
	
	//장르-재즈 
	@RequestMapping("/chart/chart_genre_jazz.do")
	public String chart_jazz(ChartVo vo, Model model, UserVo uv, HttpSession sess) {
		uv = (UserVo)sess.getAttribute("userInfo"); //로그인한 유저의 정보
		if(uv != null) {  //로그인 했으면
			int uno = uv.getNo(); 
			vo.setUser_no(uno);  //로그인한유저의 번호를 ChartVo에 set
			model.addAttribute("list", service.ChartList_jazz(vo));
			return "chart/chart_genre_jazz";
		} else {		
			model.addAttribute("list", service.ChartList_jazz(vo));
			return "chart/chart_genre_jazz";
		}
	}
		
	//장르-케이팝 
	@RequestMapping("/chart/chart_genre_kpop.do")
	public String chart_kpop(ChartVo vo, Model model, UserVo uv, HttpSession sess) {
		uv = (UserVo)sess.getAttribute("userInfo"); //로그인한 유저의 정보
		if(uv != null) {  //로그인 했으면
			int uno = uv.getNo(); 
			vo.setUser_no(uno);  //로그인한유저의 번호를 ChartVo에 set
			model.addAttribute("list", service.ChartList_kpop(vo));
			return "chart/chart_genre_kpop";
		} else {		
			model.addAttribute("list", service.ChartList_kpop(vo));
			return "chart/chart_genre_kpop";
		}
	}
	
	//장르-팝 
	@RequestMapping("/chart/chart_genre_pop.do")
	public String chart_pop(ChartVo vo, Model model, UserVo uv, HttpSession sess) {
		uv = (UserVo)sess.getAttribute("userInfo"); //로그인한 유저의 정보
		if(uv != null) {  //로그인 했으면
			int uno = uv.getNo(); 
			vo.setUser_no(uno);  //로그인한유저의 번호를 ChartVo에 set
			model.addAttribute("list", service.ChartList_pop(vo));
			return "chart/chart_genre_pop";
		} else {		
			model.addAttribute("list", service.ChartList_pop(vo));
			return "chart/chart_genre_pop";
		}
	}
	
	//최신곡 차트
	@RequestMapping("/chart/chart_recent.do")
	public String chart_recent(ChartVo vo, Model model, UserVo uv, HttpSession sess) {
		uv = (UserVo)sess.getAttribute("userInfo"); //로그인한 유저의 정보
		if(uv != null) {  //로그인 했으면
			int uno = uv.getNo(); 
			vo.setUser_no(uno);  //로그인한유저의 번호를 ChartVo에 set
			model.addAttribute("list", service.ChartList_recent(vo));
			return "chart/recent_chart";
		} else {		
			model.addAttribute("list", service.ChartList_recent(vo));
			return "chart/recent_chart";
		}
	}
	
	//가사 팝업창
	@RequestMapping("chart/lyrics.do")
	public String lyrics(ChartVo vo, Model model,HttpServletRequest req) {
		int no = Integer.parseInt(req.getParameter("no"));
		ChartVo cv = service.detail(no);
		model.addAttribute("vo", cv);
		return "chart/lyrics";
	}
	

}
