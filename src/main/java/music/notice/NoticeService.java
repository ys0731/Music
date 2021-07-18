package music.notice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface NoticeService {
	List<NoticeVo> selectAll(NoticeVo vo);
	NoticeVo detail(NoticeVo vo);


}
