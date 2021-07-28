package music.admin.statistic;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import music.admin.song.AdminSongVo;
import music.player.MusicPlayerVo;

@Repository
public class AdminStatisticDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<AdminSongVo> selectAll(AdminSongVo vo) {
		return sqlSession.selectList("statistic.selectAll", vo);
	}
	
	public AdminSongVo exist(AdminSongVo vo) {
		return sqlSession.selectOne("statistic.exist", vo);
	}

	public MusicPlayerVo daily(MusicPlayerVo vo) {
		return sqlSession.selectOne("statistic.daily", vo);
	}

	public List<MusicPlayerVo> weekly(MusicPlayerVo vo) {
		return sqlSession.selectList("statistic.weekly", vo);
	}

	public List<MusicPlayerVo> totalSong(MusicPlayerVo vo) {
		return sqlSession.selectList("statistic.totalSong", vo);
	}

	public List<MusicPlayerVo> totalGenre(MusicPlayerVo vo) {
		return sqlSession.selectList("statistic.totalGenre", vo);
	}
}
