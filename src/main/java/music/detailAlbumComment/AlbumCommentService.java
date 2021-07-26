package music.detailAlbumComment;

import java.util.List;


public interface AlbumCommentService {
	List<AlbumCommentVo> selectAll(AlbumCommentVo vo);
	AlbumCommentVo detail(AlbumCommentVo vo);
	int insert(AlbumCommentVo vo);
	int insertReply(AlbumCommentVo vo);
	int delete(AlbumCommentVo vo);
	List<AlbumCommentVo> findByNo(int no);
}
