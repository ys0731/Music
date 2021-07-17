package music.admin.album;

import java.util.List;

public interface AdminAlbumService {
	
	List<AdminAlbumVo> selectAll(AdminAlbumVo vo);
	
	List<AdminAlbumVo> selectAllAlbums(AdminAlbumVo vo);
	
	AdminAlbumVo detail(AdminAlbumVo vo);
	
	int insert(AdminAlbumVo vo);

	AdminAlbumVo edit(AdminAlbumVo vo);

	int update(AdminAlbumVo vo);

	int delete(AdminAlbumVo vo);
}
