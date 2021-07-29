package music.admin.sales;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminSalesController {
	
	@Autowired
	AdminSalesService service;
	
	@RequestMapping("/admin/sales/day.do")
	public String daySales(Model model, AdminSalesVo vo) {
		model.addAttribute("list", service.ticketStatistics());
		return "admin/sales/day";
	}

	@RequestMapping("/admin/sales/category.do")
	public String categorySales(Model model, AdminSalesVo vo) {
		model.addAttribute("list", service.categorySales(vo));
		return "admin/sales/category";
	}
	
}
