package music.admin.artist;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminArtistDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<AdminArtistVo> selectAll(AdminArtistVo vo) {
		return sqlSession.selectList("artist.selectAll", vo); // namespace.id
	}
	
	public List<AdminArtistVo> selectAllArtists(AdminArtistVo vo) {
		return sqlSession.selectList("artist.selectAllArtists", vo);
	}

	public int count(AdminArtistVo vo) {
		return sqlSession.selectOne("artist.count", vo);
	}

	public AdminArtistVo detail(AdminArtistVo vo) {
		return sqlSession.selectOne("artist.detail", vo);
	}
	
	public int insert(AdminArtistVo vo) {
		return sqlSession.insert("artist.insert", vo);
	}

	public int update(AdminArtistVo vo) {
		return sqlSession.update("artist.update", vo);
	}
	
	public int delete(AdminArtistVo vo) {
		return sqlSession.delete("artist.delete", vo);
	}
}
