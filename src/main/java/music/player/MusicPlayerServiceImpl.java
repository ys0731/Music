package music.player;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import music.admin.song.AdminSongVo;

@Service
public class MusicPlayerServiceImpl implements MusicPlayerService {
	
	@Autowired
	MusicPlayerDao dao;

	@Override
	public AdminSongVo detail(AdminSongVo vo) {
		return dao.detail(vo);
	}

	@Override
	public int insertClick(MusicPlayerVo vo) {
		return dao.insertClick(vo);
	}

}
