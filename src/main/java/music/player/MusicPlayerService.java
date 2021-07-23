package music.player;

import music.admin.song.AdminSongVo;

public interface MusicPlayerService {
	
	AdminSongVo detail(AdminSongVo vo);

	int insertClick(MusicPlayerVo vo);
}
