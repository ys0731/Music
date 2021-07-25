package music.admin.recommend;

import java.util.List;

import music.admin.song.AdminSongVo;

public interface AdminRecommendService {
	
	List<AdminSongVo> selectAll(AdminSongVo vo);

	List<AdminRecommendVo> selectToday(AdminRecommendVo vo);

	List<AdminRecommendVo> selectTag(AdminRecommendVo vo);

	AdminRecommendVo selectListOne(AdminRecommendVo vo);
	
	List<AdminRecommendVo> selectSongList(AdminRecommendVo vo);

	int insertTop(AdminRecommendVo vo);
	
	int insertBottom(AdminRecommendVo vo);

	int reset();

	int update(AdminRecommendVo vo);

	int updateList(AdminRecommendVo vo);

	int updateDeleteList(AdminRecommendVo vo);

	int delete(AdminRecommendVo vo);

}
