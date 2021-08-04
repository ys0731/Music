package music.detail;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import music.admin.artist.AdminArtistVo;
import music.search.SearchService;
import music.search.SearchVo;
import music.user.UserVo;


@Controller
public class DetailController {

	@Autowired
	DetailService service;
	@Autowired
	SearchService sService;
	
	// 앨범상세
	@RequestMapping("/detail/albumDetail.do")
	public String albumDetail(@RequestParam(value = "album_no", required = false) int no, Model model, HttpSession sess) {
		int user_no = 0;
		UserVo uv = (UserVo)sess.getAttribute("userInfo");
		if (uv != null) user_no = uv.getNo();	
		
		Map map = new HashMap();
		map.put("album_no", no);
		map.put("user_no", user_no);
		
		model.addAttribute("vo", service.albumDetail(no));
		model.addAttribute("list", service.albumSong(map));
		return "detail/albumDetail";
	}

	// 아티스트상세
	@RequestMapping("/detail/artistDetail.do")
	public String artistDetail(@RequestParam(value = "artist_no", required = false) int no, Model model, HttpSession sess) {
		int user_no = 0;
		UserVo uv = (UserVo)sess.getAttribute("userInfo");
		if (uv != null) user_no = uv.getNo();
		model.addAttribute("vo", service.artistDetail(no));
		
		Map map = new HashMap();
		map.put("artist_no", no);
		map.put("user_no", user_no);
		model.addAttribute("list", service.artistSong(map));
		return "detail/artistDetail";
	}
	
	// 검색목록
	@RequestMapping("/detail/searchView.do")
	public String searchView(@RequestParam String searchword, Model model,SearchVo vo, AdminArtistVo av,HttpSession sess) {
		int user_no = 0;
		UserVo uv = (UserVo)sess.getAttribute("userInfo");
		if (uv != null) user_no = uv.getNo();
		if(!"".equals(searchword)) { 
			model.addAttribute("vo", service.artistSearch(searchword));	//artist 검색 결과 vo에 저장 
			
			Map map = new HashMap();
			map.put("user_no", user_no);
			map.put("searchword", searchword);
			
			model.addAttribute("svo", service.songSearch(map));	//song 검색 결과 vo에 저장 
			model.addAttribute("avo", service.artistAlbumSearch(searchword)); //aritst album 내용 저장

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
