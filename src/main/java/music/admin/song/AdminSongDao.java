package music.admin.song;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import music.admin.album.AdminAlbumVo;
import music.admin.artist.AdminArtistVo;

@Repository
public class AdminSongDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<AdminSongVo> selectAll(AdminSongVo vo) {
		return sqlSession.selectList("song.selectAll", vo);
	}
	
	public List<AdminSongVo> selectAllSongs(AdminSongVo vo) {
		return sqlSession.selectList("song.selectAllSongs", vo);
	}

	public int count(AdminSongVo vo) {
		return sqlSession.selectOne("song.count", vo);
	}

	public AdminSongVo detail(AdminSongVo vo) {
		return sqlSession.selectOne("song.detail", vo);
	}
	
	public int insert(AdminSongVo vo) {
		return sqlSession.insert("song.insert", vo);
	}

	public int update(AdminSongVo vo) {
		return sqlSession.update("song.update", vo);
	}
	
	public int delete(AdminSongVo vo) {
		return sqlSession.delete("song.delete", vo);
	}

	public int deleteIncludedList(AdminSongVo vo) {
		return sqlSession.delete("song.deleteIncludedList", vo);
	}
	
	public AdminAlbumVo exist1(AdminAlbumVo vo) {
		return sqlSession.selectOne("song.exist1", vo);
	}
	
	public AdminArtistVo exist2(AdminArtistVo vo) {
		return sqlSession.selectOne("song.exist2", vo);
	}
}
