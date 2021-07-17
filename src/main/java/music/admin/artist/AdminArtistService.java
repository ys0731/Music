package music.admin.artist;

import java.util.List;

public interface AdminArtistService {
	
	List<AdminArtistVo> selectAll(AdminArtistVo vo);
	
	List<AdminArtistVo> selectAllArtists(AdminArtistVo vo);
	
	AdminArtistVo detail(AdminArtistVo vo);
	
	int insert(AdminArtistVo vo);

	AdminArtistVo edit(AdminArtistVo vo);

	int update(AdminArtistVo vo);

	int delete(AdminArtistVo vo);
}
