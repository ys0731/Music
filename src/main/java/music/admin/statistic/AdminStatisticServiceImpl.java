package music.admin.statistic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import music.admin.song.AdminSongVo;
import music.player.MusicPlayerVo;

@Service
public class AdminStatisticServiceImpl implements AdminStatisticService {
	
	@Autowired
	AdminStatisticDao dao;

	@Override
	public List<AdminSongVo> selectAll(AdminSongVo vo) {
		return dao.selectAll(vo);
	}

	@Override
	public AdminSongVo exist(AdminSongVo vo) {
		return dao.exist(vo);
	}

	@Override
	public MusicPlayerVo daily(MusicPlayerVo vo) {
		return dao.daily(vo);
	}

	@Override
	public List<MusicPlayerVo> weekly(MusicPlayerVo vo) {
		return dao.weekly(vo);
	}

	@Override
	public List<MusicPlayerVo> totalSong(MusicPlayerVo vo) {
		return dao.totalSong(vo);
	}

	@Override
	public List<MusicPlayerVo> totalGenre(MusicPlayerVo vo) {
		return dao.totalGenre(vo);
	}


}
