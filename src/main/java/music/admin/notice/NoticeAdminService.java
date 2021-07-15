package music.admin.notice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface NoticeAdminService {
	List<NoticeAdminVo> selectAll(NoticeAdminVo vo);
	NoticeAdminVo detail(NoticeAdminVo vo);
	int insert(NoticeAdminVo vo);
	NoticeAdminVo edit(NoticeAdminVo vo);
	int update(NoticeAdminVo vo);
	int delete(NoticeAdminVo vo);
}
