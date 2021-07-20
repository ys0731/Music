package music.search;

import java.util.List;

import music.admin.artist.AdminArtistVo;

public interface SearchService {
	List<SearchVo> searchRanking(SearchVo vo);
	int searchInsert(SearchVo vo);
	AdminArtistVo selectOne(AdminArtistVo vo);
}
