package music.mvChart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MvChartController {
	  
	@Autowired
	MvChartService service;

		//최신mv차트
		@RequestMapping("/mvChart/recentMv.do")
		public String recentMv(MvChartVo vo, Model model) {
			model.addAttribute("list", service.RecentMv(vo));
			return "mvChart/recentMv";
		}

	}