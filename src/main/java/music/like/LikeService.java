package music.like;

import java.util.List;

public interface LikeService {

	public int like(LikeVo vo);
	public int dislike(LikeVo vo);
	public LikeVo search(LikeVo vo);
	public List<LikeVo> like_List(LikeVo vo);
	public int count(LikeVo vo);
	public List<LikeVo> heart_List(LikeVo vo);
}
