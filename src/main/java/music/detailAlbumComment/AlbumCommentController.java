package music.detailAlbumComment;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import music.user.UserVo;


@Controller
public class AlbumCommentController {

	@Autowired
	AlbumCommentService service;

	
	@RequestMapping("/albumDetailComment/insert.do")
	public String albumCommentInsert(Model model, AlbumCommentVo vo, HttpSession sess) {
		UserVo userInfo = (UserVo) sess.getAttribute("userInfo");
		System.out.println(userInfo.getNo());
		vo.setUser_no(userInfo.getNo());
		int r = service.insert(vo);
		if (r > 0) {
			model.addAttribute("msg", "true");
		} else {
			model.addAttribute("msg", "false");
		}
		return "include/result";
	}
	
	@RequestMapping("/albumDetailComment/insertReply.do")
	public String insertReply(Model model, AlbumCommentVo vo, HttpSession sess) {
		UserVo userInfo = (UserVo) sess.getAttribute("userInfo");
		System.out.println(userInfo.getNo());
		vo.setUser_no(userInfo.getNo());
		int r = service.insertReply(vo);
		if (r > 0) {
			model.addAttribute("msg", "true");
		} else {
			model.addAttribute("msg", "false");
		}
		return "include/result";
	}
	@RequestMapping("/albumDetailComment/list.do")
	public String commentList(@RequestParam int album_no, Model model, AlbumCommentVo cv) {
		model.addAttribute("list", service.findByNo(album_no));
		return "comment/albumComment";
	}
	
	@RequestMapping("/albumDetailComment/delete.do")
	public String commentDelete(Model model, @RequestParam int no) {
		AlbumCommentVo vo = new AlbumCommentVo();
		vo.setNo(no);
		
		int r = service.delete(vo);
		if (r > 0) {
			model.addAttribute("msg", "true");
		} else {
			model.addAttribute("msg", "false");
		}
		return "include/result";
	}

}
