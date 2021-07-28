package music.recommend;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RecommendDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<RecommendVo> selectList (RecommendVo vo) {
		return sqlSession.selectList("recommended.selectList", vo);
	}

	public List<RecommendVo> selectSongList (RecommendVo vo) {
		return sqlSession.selectList("recommended.selectSongList", vo);
	}

	public RecommendVo selectListTitle (RecommendVo vo) {
		return sqlSession.selectOne("recommended.selectListTitle", vo);
	}
}
