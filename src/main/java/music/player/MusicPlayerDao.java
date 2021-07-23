package music.player;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import music.admin.song.AdminSongVo;

@Repository
public class MusicPlayerDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public AdminSongVo detail(AdminSongVo vo) {
		return sqlSession.selectOne("player.detail", vo);
	}
}
