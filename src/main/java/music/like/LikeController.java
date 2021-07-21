package music.like;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import music.user.UserService;
import music.user.UserVo; 

@Controller
public class LikeController {

	@Autowired
	LikeService lservice;
	
	@Autowired
	UserService uservice;
	
	//AJAX로 처리 고민
	@RequestMapping("/like/like.do")
	public String like(LikeVo lv, Model model,HttpSession sess,UserVo uv, HttpServletRequest req) {
		int r;
		uv = (UserVo)sess.getAttribute("userInfo");  //로그인한 유저의 정보
		int uno = uv.getNo();  //로그인한 유저의 유저번호
		int sno = Integer.parseInt(req.getParameter("sno")); //좋아요 누른 곡의 곡번호
		lv.setSong_no(sno);
		lv.setUser_no(uno);
		LikeVo lvo = lservice.search(lv); 
		
		if(lvo == null) {                //like에서 해당 유저의 해당 곡 좋아요 기록이 없으면      
			r=lservice.like(lv);         //service.like 실행
			model.addAttribute("result","true");
			return "include/result";
		} else {
			r=lservice.dislike(lv);      //있으면 service.dislike 실행
			model.addAttribute("result","false");
			return "include/result";
		}
	}
	
}
