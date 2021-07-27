package music.admin.mv;

import java.util.List;

import music.admin.song.AdminSongVo;

public interface AdminMvService {
	
	List<AdminMvVo> selectAll(AdminMvVo vo);
	
	AdminMvVo detail(AdminMvVo vo);
	
	int insert(AdminMvVo vo);

	AdminMvVo edit(AdminMvVo vo);

	int update(AdminMvVo vo);

	int delete(AdminMvVo vo);
	
	AdminSongVo exist(AdminSongVo vo);

}
