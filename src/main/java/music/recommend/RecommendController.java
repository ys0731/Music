package music.recommend;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RecommendController {
	
	@Autowired
	RecommendService service;
	
	@RequestMapping("/recommend/recommend_list.do")
	public String recommendList(Model model) {
		RecommendVo vo1 = new RecommendVo();
		vo1.setGroup_id(1);
		model.addAttribute("list1", service.selectList(vo1));
		
		RecommendVo vo2 = new RecommendVo();
		vo2.setGroup_id(2);
		model.addAttribute("list2", service.selectList(vo2));
		
		return "recommend/recommend_list";
	}	

	@RequestMapping("/recommend/recommend_info.do")
	public String recommendInfo(Model model, RecommendVo vo) {
		model.addAttribute("title", service.selectListTitle(vo));
		model.addAttribute("list", service.selectSongList(vo));
		return "recommend/recommend_info";
	}	
	
}
