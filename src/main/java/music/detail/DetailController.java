package music.detail;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import music.detailAlbumComment.AlbumCommentService;
import music.detailAlbumComment.AlbumCommentVo;


@Controller
public class DetailController {

	@Autowired
	DetailService service;
	@Autowired
	AlbumCommentService aService;

	
	// 앨범상세
	@RequestMapping("/detail/albumDetail.do")
	public String albumDetail(@RequestParam(value = "album_no", required = false) int no, Model model) {
		model.addAttribute("vo", service.albumDetail(no));
		model.addAttribute("list", service.albumSong(no));
//	    System.out.println( aService.findByNo(no));
//		model.addAttribute("commentList", aService.findByNo(no));
		return "detail/albumDetail";
	}

	// 아티스트상세
	@RequestMapping("/detail/artistDetail.do")
	public String artistDetail(@RequestParam(value = "artist_no", required = false) int no, Model model) {
		model.addAttribute("vo", service.artistDetail(no));
		model.addAttribute("list", service.artistSong(no));
		return "detail/artistDetail";
	}
	
	

}
