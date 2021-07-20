package music.search;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import music.admin.artist.AdminArtistVo;

@Service
public class SearchServiceImpl implements SearchService {
	
	@Autowired
	SearchDao dao;

	@Override
	public List<SearchVo> searchRanking(SearchVo vo) {
		
		return dao.searchRanking(vo);
	}

	@Override
	public int searchInsert(SearchVo vo) {
		
		return dao.searchInsert(vo);
	}

	@Override
	public AdminArtistVo selectOne(AdminArtistVo vo) {
		
		return dao.selectOne(vo);
	}
}
