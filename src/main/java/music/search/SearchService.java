package music.search;

import java.util.List;
import java.util.Map;


public interface SearchService {
	List<SearchVo> searchRanking(SearchVo vo);
	int searchInsert(String searchword);
	Map selectOne(String searchword);
}
