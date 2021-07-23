package music.admin.recommend;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import music.admin.song.AdminSongVo;

@Repository
public class AdminRecommendDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<AdminSongVo> selectAll (AdminSongVo vo) {
		return sqlSession.selectList("recommend.selectAll", vo); // namespace.id
	}

	public List<AdminRecommendVo> selectToday (AdminRecommendVo vo) {
		return sqlSession.selectList("recommend.selectToday", vo);
	}

	public List<AdminRecommendVo> selectTag (AdminRecommendVo vo) {
		return sqlSession.selectList("recommend.selectTag", vo);
	}
	
	public AdminRecommendVo selectListOne (AdminRecommendVo vo) {
		return sqlSession.selectOne("recommend.selectListOne", vo);
	}

	public int count(AdminSongVo vo) {
		return sqlSession.selectOne("recommend.count", vo);
	}
	
	public int insertTop(AdminRecommendVo vo) {
		return sqlSession.insert("recommend.insertTop", vo);
	}

	public int insertBottom(AdminRecommendVo vo) {
		return sqlSession.insert("recommend.insertBottom", vo);
	}
	
	public int reset() {
		return sqlSession.update("recommend.reset");
	}
	
	public int update(AdminRecommendVo vo) {
		return sqlSession.update("recommend.update", vo);
	}
	
	public int deleteRecommend(AdminRecommendVo vo) {
		return sqlSession.delete("recommend.deleteRecommend", vo);
	}

	public int deleteRecommendList(AdminRecommendVo vo) {
		return sqlSession.delete("recommend.deleteRecommendList", vo);
	}
}
