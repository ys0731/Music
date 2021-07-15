package music.qna;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface QnaService {
	List<QnaVo> selectAll(QnaVo vo);
	QnaVo detail(QnaVo vo);
	int insert(QnaVo vo);
	QnaVo edit(QnaVo vo);
	int update(QnaVo vo);
	int delete(QnaVo vo);
}
