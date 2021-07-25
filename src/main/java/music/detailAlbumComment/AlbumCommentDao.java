package music.detailAlbumComment;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AlbumCommentDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<AlbumCommentVo> selectAll(AlbumCommentVo vo) {
		return sqlSession.selectList("albumComment.selectAll", vo);
	}
	
	public int count(AlbumCommentVo vo) {
		return sqlSession.selectOne("albumComment.count", vo);
	}
	
	public AlbumCommentVo detail(AlbumCommentVo vo) {
		return sqlSession.selectOne("albumComment.detail", vo);
	}
	
	public void updateReadcount(AlbumCommentVo vo) {
		sqlSession.update("albumComment.updateReadcount", vo);
	}
	
	public void gno(int no) {
		sqlSession.update("albumComment.gno", no);
	}
	
	public int insert(AlbumCommentVo vo) {
		return sqlSession.insert("albumComment.insert", vo);
	}
	
	public int insertReply(AlbumCommentVo vo) {
		return sqlSession.insert("albumComment.insertReply", vo);
	}
	
	public int onoUpdate(AlbumCommentVo vo) {
		return sqlSession.update("albumComment.onoUpdate", vo);
	}
	
	public int delete(AlbumCommentVo vo) {
		return sqlSession.delete("albumComment.delete", vo);
	}

	public List<AlbumCommentVo> findByNo(int no) {
		return sqlSession.selectList("albumComment.findByNo", no);
	}
}
