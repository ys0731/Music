package music.admin.statistic;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminStatisticController {
	
	@RequestMapping("/admin/statistic/chart1.do")
	public String chart1() {
		return "admin/statistic/chart1";
	}
	
	@RequestMapping("/admin/statistic/chart2.do")
	public String chart2() {
		return "admin/statistic/chart2";
	}
	
	@RequestMapping("/admin/statistic/chart3.do")
	public String chart3() {
		return "admin/statistic/chart3";
	}
	
}
