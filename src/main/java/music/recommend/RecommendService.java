package music.recommend;

import java.util.List;

public interface RecommendService {
	
	List<RecommendVo> selectList(RecommendVo vo);

	List<RecommendVo> selectSongList(RecommendVo vo);

	RecommendVo selectListTitle(RecommendVo vo);
}
