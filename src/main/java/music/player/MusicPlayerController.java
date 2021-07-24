package music.player;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import music.admin.song.AdminSongVo;
import music.user.UserVo;

@Controller
public class MusicPlayerController {
	
	@Autowired
	MusicPlayerService service;
	
	@RequestMapping("/player/play.do")
	public void player(HttpServletRequest req, HttpSession sess) {
		String no = req.getParameter("no");
		
		AdminSongVo asv = new AdminSongVo();
		asv.setNo(Integer.parseInt(no));
		
		List<AdminSongVo> li = new ArrayList<AdminSongVo>();
		li.add(service.detail(asv));
		
		sess.setAttribute("playlist", li);
	}

	@RequestMapping("/player/playlog.do")
	public void playerLog(HttpServletRequest req, HttpSession sess) {
		int song_no = Integer.parseInt(req.getParameter("no"));
		UserVo uv = (UserVo) sess.getAttribute("userInfo");
		int user_no = uv.getNo();
		MusicPlayerVo mpv = new MusicPlayerVo();
		mpv.setUser_no(user_no);
		mpv.setSong_no(song_no);
		service.insertClick(mpv);
	}
	
	@RequestMapping("/player/checkplay.do")
	@ResponseBody
	public void arrPlayer(HttpServletRequest req, HttpSession sess) {
		String[] list = req.getParameterValues("chkArr");
		AdminSongVo asv = new AdminSongVo();
		List<AdminSongVo> li = new ArrayList<AdminSongVo>();
		for (String i : list) {
			asv.setNo(Integer.parseInt(i));
			li.add(service.detail(asv));
		}
		sess.setAttribute("playlist", li);
	}
	
	@RequestMapping("/player/playlogs.do")
	public void playerLogs(HttpServletRequest req, HttpSession sess) {
		String[] song_no = req.getParameterValues("chkArr");
		UserVo uv = (UserVo) sess.getAttribute("userInfo");
		int user_no = uv.getNo();
		MusicPlayerVo mpv = new MusicPlayerVo();
		mpv.setUser_no(user_no);
		
		for (String i : song_no) {
			mpv.setSong_no(Integer.parseInt(i));
			service.insertClick(mpv);
		}
	}
	
	@RequestMapping("/player/plusplay.do")
	@ResponseBody
	public void plusPlayer(HttpServletRequest req, HttpSession sess) {
		String list = req.getParameter("no");
		AdminSongVo asv = new AdminSongVo();
		List<AdminSongVo> lili = new ArrayList<AdminSongVo>();
		
		List<AdminSongVo> li = (List<AdminSongVo>)sess.getAttribute("playlist");
		
		for (AdminSongVo i : li) {
			lili.add(service.detail(i));
		}
		asv.setNo(Integer.parseInt(list));
		lili.add(service.detail(asv));
		
		sess.setAttribute("playlist", lili);
	}
	
	@RequestMapping("/player/sendplaylist.do")
	public String sendPlaylist() {
		return "player/player";
	}
}
