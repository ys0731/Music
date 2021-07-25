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
	public String albumCommentInsert(Model model, ArtistCommentVo vo) {
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
		
		int r = service.delete(vo);
		if (r > 0) {
			model.addAttribute("msg", "true");
		} else {
			model.addAttribute("msg", "false");
		}
		return "include/result";
	}

}
