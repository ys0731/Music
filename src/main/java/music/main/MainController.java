package music.main;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import music.admin.album.AdminAlbumService;
import music.admin.album.AdminAlbumVo;
import music.chart.ChartService;
import music.chart.ChartVo;
import music.notice.NoticeService;
import music.notice.NoticeVo;
import music.search.SearchService;
import music.search.SearchVo;

@Controller
public class MainController {

	@Autowired
	ChartService cservice;
	
	@Autowired
	AdminAlbumService alservice;
	
	@Autowired
	SearchService sservice;
	
	@Autowired
	NoticeService nservice;
	
	//메인 페이지
	@RequestMapping("/index.do")
	public String index(Model model, ChartVo cv, AdminAlbumVo av, HttpSession sess, SearchVo sv, NoticeVo nv) {
		
		model.addAttribute("av",alservice.selectAllAlbums(av));
		model.addAttribute("cv",cservice.ChartList_24hits(cv));
		
		model.addAttribute("nv",nservice.selectAll(nv));	
		return "index";
		}
}
