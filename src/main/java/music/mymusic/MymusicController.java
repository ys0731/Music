package music.mymusic;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import music.chart.ChartService;
import music.chart.ChartVo;
import music.detailAlbumComment.AlbumCommentService;
import music.detailAlbumComment.AlbumCommentVo;
import music.detailArtistComment.ArtistCommentService;
import music.detailArtistComment.ArtistCommentVo;
import music.like.LikeService;
import music.like.LikeVo;
import music.user.UserService;
import music.user.UserVo;

@Controller
public class MymusicController {
	
	@Autowired
	ChartService cservice;
	
	@Autowired
	UserService uservice;
	
	@Autowired
	LikeService lservice;
	
	@Autowired
	AlbumCommentService acservice;
	
	@Autowired
	ArtistCommentService arcservice;
			
	//마이뮤직-최근감상곡
	@RequestMapping("/mymusic/mymusic.do")
	public String mymusic(Model model, UserVo uv, ChartVo cv, HttpSession sess) {
		uv = (UserVo)sess.getAttribute("userInfo");
		cv.setUser_no(uv.getNo());
		model.addAttribute("list", cservice.User_recent(cv));
		model.addAttribute("uv", uservice.deatil(uv));
		
		return "mymusic/mymusic";
		
	}
	
	//마이뮤직-좋아요 누른 곡
	@RequestMapping("/mymusic/mymusic_like.do")
	public String mymusic_like(Model model, LikeVo lv, HttpSession sess,UserVo uv) {
		uv = (UserVo)sess.getAttribute("userInfo");
		lv.setUser_no(uv.getNo());
		
		model.addAttribute("list", lservice.like_List(lv));
		
		return "mymusic/mymusic_like";
	}
	
	//마이뮤직-내정보
	@RequestMapping("/mymusic/myusic_myinfo.do")
	public String mymusic_myinfo(Model model,HttpSession sess, UserVo uv) {
		uv = uservice.deatil(((UserVo)sess.getAttribute("userInfo")));
		model.addAttribute("user",uv);
		
		return "mymusic/mymusic_myinfo";
	}
	
	//마이뮤직-회원탈퇴
	@RequestMapping("/mymusic/mymusic_withdrawal.do")
	public String mymusic_withdrwal(Model model,HttpSession sess, UserVo uv) {
		uv = uservice.deatil(((UserVo)sess.getAttribute("userInfo")));
		model.addAttribute("user",uv);
		return "mymusic/mymusic_withdrawal";
	}
	
	//마이뮤직-회원탈퇴 확인
	@RequestMapping("/mymusic/mymusic_withdrawal_check.do")
	public String mymusic_withdrwal_check(Model model,HttpSession sess, UserVo uv) {
		uv = uservice.deatil(((UserVo)sess.getAttribute("userInfo")));
		model.addAttribute("user",uv);
		return "mymusic/mymusic_withdrawal_check";
	}
	
	//회원탈퇴
	@RequestMapping("/mymusic/mymusic_delete.do")
	public String mymusic_delete(Model model,HttpSession sess, UserVo uv) {
		uv = uservice.deatil(((UserVo)sess.getAttribute("userInfo")));
		uservice.delete(uv);
		sess.invalidate();
		return "/index.do";
	}
	
	//회원정보변경
	@RequestMapping("/mymusic/mymusic_update.do")
	public String mymusic_update(Model model,HttpSession sess, UserVo uv) {
		uv = uservice.deatil(((UserVo)sess.getAttribute("userInfo")));
		model.addAttribute("user",uv);
		return "mymusic/mymusic_update";
	}
	
	@RequestMapping("/mymusic/mymusic_edit.do")
	public String mymusic_edit(Model model, UserVo uv, HttpServletRequest req, HttpSession sess) {
		uv = uservice.deatil(((UserVo)sess.getAttribute("userInfo")));		
		String pwd = req.getParameter("newPwd");		
		String email = req.getParameter("email")+"@"+req.getParameter("domain_input");
		String tel = req.getParameter("tel");
		uv.setPwd(pwd);
		uv.setEmail(email);
		uv.setTel(tel);
		uservice.update(uv);
		return "mymusic/mymusic";
	}
	
	@RequestMapping("/mymusic/mymusic_nick_edit.do")
	public String nick_edit(UserVo uv, HttpServletRequest req, HttpSession sess,Model model) {
		uv = uservice.deatil(((UserVo)sess.getAttribute("userInfo")));
		String nickname = req.getParameter("nickname");
		uv.setNickname(nickname);
		uservice.updateNick(uv);
		model.addAttribute("msg","true");
		return "include/result";
		
	}
	
	@RequestMapping("/mymusic/mymusic_comment.do")
	public String comment(UserVo uv, HttpServletRequest req, HttpSession sess,Model model,AlbumCommentVo acv) {
		uv = (UserVo)sess.getAttribute("userInfo");
		acv.setUser_no(uv.getNo());
		acv.setPageRow(4);
		
		model.addAttribute("list", acservice.selectAll(acv));		
		
		return "mymusic/mymusic_comment";
	}
		
		@RequestMapping("/mymusic/mymusic_comment2.do")
		public String comment2(UserVo uv, HttpServletRequest req, HttpSession sess,Model model,ArtistCommentVo arcv) {
			uv = (UserVo)sess.getAttribute("userInfo");
			arcv.setUser_no(uv.getNo());
			arcv.setPageRow(4);
			
			model.addAttribute("list", arcservice.selectAll(arcv));		
			
			return "mymusic/mymusic_comment2";
	}
}
