package music.mvChart;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import music.user.UserVo;

@Controller
public class MvChartController {
	  
	@Autowired
	MvChartService service;
	
	//인기mv차트
		@RequestMapping("/mvChart/popularMv.do")
		public String popularMv(MvChartVo vo, Model model) {
			model.addAttribute("list", service.PopularMv(vo));
			return "mvChart/popularMv";
		}

		//최신mv차트
		@RequestMapping("/mvChart/recentMv.do")
		public String recentMv(MvChartVo vo, Model model) {
			model.addAttribute("list", service.RecentMv(vo));
			return "mvChart/recentMv";
		}
		@RequestMapping("/mvChart/clickMv.do")
		public String clickMv(Model model, ClickMvVo vo, HttpSession sess) {
			
			//UserVo userInfo = new UserVo();
			UserVo userInfo = (UserVo) sess.getAttribute("userInfo");
			System.out.println(userInfo.getNo());
			vo.setUser_no(userInfo.getNo());
			model.addAttribute("mno", service.insert(vo));
			return "mvChart/recentMv";
		}
	}