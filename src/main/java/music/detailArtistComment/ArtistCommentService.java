package music.detailArtistComment;

import java.util.List;

public interface ArtistCommentService {
	List<ArtistCommentVo> selectAll(ArtistCommentVo vo);
	ArtistCommentVo detail(ArtistCommentVo vo);
	int insert(ArtistCommentVo vo);
	int insertReply(ArtistCommentVo vo);
	int delete(ArtistCommentVo vo);
	List<ArtistCommentVo> findByNo(int no);
}
