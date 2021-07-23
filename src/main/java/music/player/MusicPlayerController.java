package music.player;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import music.admin.song.AdminSongVo;

@Controller
public class MusicPlayerController {
	
	@Autowired
	MusicPlayerService service;
	
	@RequestMapping("/player/play.do")
	public String player(Model model, AdminSongVo vo) {
		model.addAttribute("playlist", service.detail(vo));
		return "player/player";
	}
	
	@RequestMapping("/player/checkplay.do")
	@ResponseBody
	public void arrPlayer(HttpServletRequest req, HttpSession sess) {
		String[] list = req.getParameterValues("chkArr");
		AdminSongVo asv = new AdminSongVo();
		List<AdminSongVo> li = new ArrayList<AdminSongVo>();
		for (String i : list) {
			System.out.println(Integer.parseInt(i));
			asv.setNo(Integer.parseInt(i));
			li.add(service.detail(asv));
		}
		sess.setAttribute("playlist", li);
	}
	
	@RequestMapping("/player/sendplaylist.do")
	public String sendPlaylist() {
		return "player/arrPlayer";
	}
}
