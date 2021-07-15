package music.admin.qna;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface QnaAdminService {
	List<QnaAdminVo> selectAll(QnaAdminVo vo);
	QnaAdminVo detail(QnaAdminVo vo);
	int insert(QnaAdminVo vo);
	QnaAdminVo edit(QnaAdminVo vo);
	int update(QnaAdminVo vo);
	int delete(QnaAdminVo vo);
}
