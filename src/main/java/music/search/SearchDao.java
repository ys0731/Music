package music.search;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SearchDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<SearchVo> searchRanking(SearchVo vo) {
		return sqlSession.selectList("search.searchRanking",vo);
	}
	
	public int searchInsert(String searchword) {
		return sqlSession.insert("search.searchInsert",searchword);
	}
	
	public Map selectOne(String searchword) {
		return sqlSession.selectOne("search.selectOne", searchword);
	}
}
