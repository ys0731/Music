package music.recommend;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RecommendServiceImpl implements RecommendService {
	
	@Autowired
	RecommendDao dao;

	@Override
	public List<RecommendVo> selectList(RecommendVo vo) {
		return dao.selectList(vo);
	}

	@Override
	public List<RecommendVo> selectSongList(RecommendVo vo) {
		return dao.selectSongList(vo);
	}

	@Override
	public RecommendVo selectListTitle(RecommendVo vo) {
		return dao.selectListTitle(vo);
	}

	@Override
	public List<RecommendVo> selectTodayList(RecommendVo vo) {
		return dao.selectTodayList(vo);
	}

}
