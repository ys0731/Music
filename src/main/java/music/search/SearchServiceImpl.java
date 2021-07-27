package music.search;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class SearchServiceImpl implements SearchService {
	
	@Autowired
	SearchDao dao;

	@Override
	public List<SearchVo> searchRanking(SearchVo vo) {
		
		return dao.searchRanking(vo);
	}

	@Override
	public int searchInsert(String searchword) {
		
		return dao.searchInsert(searchword);
	}

	@Override
	public Map selectOne(String searchword) {
		return dao.selectOne(searchword);
	}
}
