package music.detailArtistComment;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ArtistCommentDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<ArtistCommentVo> selectAll(ArtistCommentVo vo) {
		return sqlSession.selectList("artistComment.selectAll", vo);
	}
	
	public int count(ArtistCommentVo vo) {
		return sqlSession.selectOne("artistComment.count", vo);
	}
	
	public ArtistCommentVo detail(ArtistCommentVo vo) {
		return sqlSession.selectOne("artistComment.detail", vo);
	}
	
	public void updateReadcount(ArtistCommentVo vo) {
		sqlSession.update("artistComment.updateReadcount", vo);
	}
	
	public void gno(int no) {
		sqlSession.update("artistComment.gno", no);
	}
	
	public int insert(ArtistCommentVo vo) {
		return sqlSession.insert("artistComment.insert", vo);
	}
	
	public int insertReply(ArtistCommentVo vo) {
		return sqlSession.insert("artistComment.insertReply", vo);
	}
	
	public int onoUpdate(ArtistCommentVo vo) {
		return sqlSession.update("artistComment.onoUpdate", vo);
	}
	
	public int delete(ArtistCommentVo vo) {
		return sqlSession.delete("artistComment.delete", vo);
	}
	
	public List<ArtistCommentVo> findByNo(int no) {
		return sqlSession.selectList("artistComment.findByNo", no);
	}

}
