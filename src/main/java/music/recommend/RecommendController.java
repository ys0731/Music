package music.recommend;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import music.user.UserService;
import music.user.UserVo;


@Controller
public class RecommendController {
	
	@Autowired
	RecommendService service;
	@Autowired
	UserService uService;
	
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
	public String recommendInfo(Model model, RecommendVo vo, UserVo uv, HttpSession sess) {
		model.addAttribute("title", service.selectListTitle(vo));
		model.addAttribute("list", service.selectSongList(vo));
		
		UserVo expiryDate = uService.isUserExpiryDate(((UserVo)sess.getAttribute("userInfo")));
		if(expiryDate !=null) { //만료일이 지나지 않았으면  
			model.addAttribute("expiryDate",expiryDate);						
		}		
		return "recommend/recommend_info";
	}	
	
}
