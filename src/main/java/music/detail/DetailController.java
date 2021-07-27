package music.detail;



import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import music.admin.artist.AdminArtistVo;
import music.detailAlbumComment.AlbumCommentService;
import music.search.SearchService;
import music.search.SearchVo;


@Controller
public class DetailController {

	@Autowired
	DetailService service;
	@Autowired
	AlbumCommentService aService;
	@Autowired
	SearchService sService;
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
	
	// 검색목록
	@RequestMapping("/detail/searchView.do")
	public String searchView(@RequestParam String searchword, Model model,SearchVo vo, AdminArtistVo av,HttpSession sess) {
		
		if(!"".equals(searchword)) { 
			model.addAttribute("vo", service.artistSearch(searchword));	//artist 검색 결과 vo에 저장 
			//model.addAttribute("abvo", service.albumSearch(searchword));	//album 검색 결과 vo에 저장 
			model.addAttribute("svo", service.songSearch(searchword));	//song 검색 결과 vo에 저장 

			if(sService.selectOne(searchword) != null) {  //artist테이블에서 검색어랑 이름이 같은 아티스트 검색	, 결과가 있으면
				int r = sService.searchInsert(searchword);  //search 테이블에 검색어 저장
				if(r>0) {
					List<SearchVo> searchRank = sService.searchRanking(vo);
					sess.setAttribute("searchRank", searchRank);
				}

			}
		}
		return "detail/searchView";
	}
	

}
