package music.admin.song;

import java.util.List;

import music.admin.album.AdminAlbumVo;
import music.admin.artist.AdminArtistVo;

public interface AdminSongService {
	
	List<AdminSongVo> selectAll(AdminSongVo vo);
	
	List<AdminSongVo> selectAllSongs(AdminSongVo vo);
	
	AdminSongVo detail(AdminSongVo vo);
	
	int insert(AdminSongVo vo);

	AdminSongVo edit(AdminSongVo vo);

	int update(AdminSongVo vo);

	int delete(AdminSongVo vo);
	
	AdminAlbumVo exist1(AdminAlbumVo vo);
	
	AdminArtistVo exist2(AdminArtistVo vo);
}
