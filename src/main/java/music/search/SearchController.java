package music.search;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import music.admin.artist.AdminArtistService;
import music.admin.artist.AdminArtistVo;

@Controller
public class SearchController {
	
	@Autowired
	AdminArtistService aservice;
	
	@Autowired
	SearchService service;
	
	@RequestMapping("search.do")
	public String search(SearchVo vo, Model model,AdminArtistVo av) {
		av = service.selectOne(av); //artist테이블에서 검색어랑 이름이 같은 아티스트 검색
		model.addAttribute("vo",av);
		if(av != null) {  //결과가 있으면
			int r = service.searchInsert(vo);  //search 테이블에 검색어 저장
			return "";    // artist 상세 페이지 리턴
		} else {
			return "";
		}
			
		
	}
}
