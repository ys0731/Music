package music.search;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import music.admin.artist.AdminArtistVo;

@Repository
public class SearchDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<SearchVo> searchRanking(SearchVo vo) {
		return sqlSession.selectList("search.searchRanking",vo);
	}
	
	public int searchInsert(SearchVo vo) {
		return sqlSession.insert("search.searchInsert",vo);
	}
	
	public AdminArtistVo selectOne(AdminArtistVo vo) {
		return sqlSession.selectOne("search.selectOne", vo);
	}
}
