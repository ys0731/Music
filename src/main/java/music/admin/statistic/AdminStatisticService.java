package music.admin.statistic;

import java.util.List;

import music.admin.song.AdminSongVo;
import music.player.MusicPlayerVo;

public interface AdminStatisticService {

	List<AdminSongVo> selectAll(AdminSongVo vo);
	
	AdminSongVo exist(AdminSongVo vo);

	MusicPlayerVo daily(MusicPlayerVo vo);

	List<MusicPlayerVo> weekly(MusicPlayerVo vo);

	List<MusicPlayerVo> totalSong(MusicPlayerVo vo);
	
	List<MusicPlayerVo> totalGenre(MusicPlayerVo vo);
}
