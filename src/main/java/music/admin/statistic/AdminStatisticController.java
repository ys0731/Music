package music.admin.statistic;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import music.admin.song.AdminSongVo;
import music.player.MusicPlayerVo;

@Controller
public class AdminStatisticController {
	
	@Autowired
	AdminStatisticService service;
	
	@RequestMapping("/admin/statistic/chart1.do")
	public String chart1(Model model, MusicPlayerVo vo) {
		AdminSongVo asv = new AdminSongVo();
		model.addAttribute("songList", service.selectAll(asv));
		
		model.addAttribute("result", service.daily(vo));
		return "admin/statistic/chart1";
	}

	@RequestMapping("/admin/statistic/checksong.do")
	public void checkSong(Model model, AdminSongVo vo, HttpServletResponse res) throws IOException {
		AdminSongVo asv = new AdminSongVo();
		
		asv = service.exist(vo);
		
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		
		if (vo.getNo() == 0 || asv != null) {
			out.print("true");
		} else {
			out.print("false");
		}
	}
	
	@RequestMapping("/admin/statistic/chart2.do")
	public String chart2(Model model) {
		MusicPlayerVo vo = new MusicPlayerVo();
		model.addAttribute("songlist", service.weekly(vo));
		return "admin/statistic/chart2";
	}
	
	@RequestMapping("/admin/statistic/chart3.do")
	public String chart3(Model model) {
		MusicPlayerVo vo = new MusicPlayerVo();
		model.addAttribute("song", service.totalSong(vo));
		model.addAttribute("genre", service.totalGenre(vo));
		return "admin/statistic/chart3";
	}
	
}
