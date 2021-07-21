package music.like;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LikeDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int like(LikeVo vo) {
		return sqlSession.insert("like.like", vo);
	}
	
	public int dislike(LikeVo vo) {
		return sqlSession.delete("like.dislike", vo);
	}
	
	public LikeVo search(LikeVo vo) {
		return sqlSession.selectOne("like.search",vo);
	}
	
	public List<LikeVo> like_List(LikeVo vo) {
		return sqlSession.selectList("like.like_List",vo);
	}
	
	public int count(LikeVo vo) {
		return sqlSession.selectOne("like.count",vo);
	}
	
	public List<LikeVo> heart_list(LikeVo vo) {
		return sqlSession.selectList("like.heart_list",vo);
	}
}
