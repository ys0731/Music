package music.recommend;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
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
	public String recommendInfo(Model model, RecommendVo vo, HttpSession sess) {
		int user_no = 0;
		UserVo uv = (UserVo)sess.getAttribute("userInfo");
		if (uv != null) user_no = uv.getNo();	
		
		vo.setUser_no(user_no);

		model.addAttribute("title", service.selectListTitle(vo));
		model.addAttribute("list", service.selectSongList(vo));
	
		return "recommend/recommend_info";
	}	
	
	
}

