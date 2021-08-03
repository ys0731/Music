package music.detailArtistComment;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import music.detailArtistComment.ArtistCommentVo;


@Controller
public class ArtistCommentController {

	@Autowired
	ArtistCommentService service;

	
	@RequestMapping("/artistDetailComment/insert.do")
	public String artistCommentInsert(Model model, ArtistCommentVo vo) {
		int r = service.insert(vo);
		if (r > 0) {
			model.addAttribute("msg", "true");
		} else {
			model.addAttribute("msg", "false");
		}
		return "include/result";
	}
	
	@RequestMapping("/artistDetailComment/insertReply.do")
	public String insertReply(Model model, ArtistCommentVo vo) {
		int r = service.insertReply(vo);
		if (r > 0) {
			model.addAttribute("msg", "true");
		} else {
			model.addAttribute("msg", "false");
		}
		return "include/result";
	}
	
	@RequestMapping("/artistDetailComment/list.do")
	public String commentList(@RequestParam int artist_no, Model model, ArtistCommentVo cv) {
		model.addAttribute("list", service.findByNo(artist_no));
		return "comment/artistComment";
	}
	
	@RequestMapping("/artistDetailComment/delete.do")
	public String commentDelete(Model model, @RequestParam int no) {
		ArtistCommentVo vo = new ArtistCommentVo();
		vo.setNo(no);
		
		model.addAttribute("count", service.replycount(vo));
		
		int r = service.delete(vo);
		if (r > 0) {
			model.addAttribute("msg", "true");
		} else {
			model.addAttribute("msg", "false");
		}
		return "include/result";
	}

	// 답글이 있는 댓글 삭제 방지
	@RequestMapping("/artistDetailComment/beforedelete.do")
	public String beforeDelete(Model model, @RequestParam int no) {
		ArtistCommentVo vo = new ArtistCommentVo();
		vo.setNo(no);
		
		int n = service.replycount(vo).getNested();
		int r = service.replycount(vo).getReplycount();
		
		if (n == 0 && r > 1) { // 댓글이면서, 댓글에 답글이 하나 이상 존재하는 경우
			model.addAttribute("msg", "true");
		} else {
			model.addAttribute("msg", "false");
		}
		
		return "include/result";
	}

}
