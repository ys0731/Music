package music.admin.album;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminAlbumDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<AdminAlbumVo> selectAll(AdminAlbumVo vo) {
		return sqlSession.selectList("album.selectAll", vo);
	}

	public List<AdminAlbumVo> selectAllAlbums(AdminAlbumVo vo) {
		return sqlSession.selectList("album.selectAllAlbums", vo);
	}

	public int count(AdminAlbumVo vo) {
		return sqlSession.selectOne("album.count", vo);
	}

	public AdminAlbumVo detail(AdminAlbumVo vo) {
		return sqlSession.selectOne("album.detail", vo);
	}
	
	public int insert(AdminAlbumVo vo) {
		return sqlSession.insert("album.insert", vo);
	}

	public int update(AdminAlbumVo vo) {
		return sqlSession.update("album.update", vo);
	}
	
	public int delete(AdminAlbumVo vo) {
		return sqlSession.delete("album.delete", vo);
	}
}
