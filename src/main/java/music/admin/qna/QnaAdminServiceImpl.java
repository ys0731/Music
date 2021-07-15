package music.admin.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QnaAdminServiceImpl implements QnaAdminService{

	@Autowired
	QnaAdminDao dao;
	
	@Override
	public List<QnaAdminVo> selectAll(QnaAdminVo vo) {
		int totCount = dao.count(vo); 
		
		//총 페이지수
		int totPage = totCount / vo.getPageRow();
		if(totCount % vo.getPageRow() > 0) totPage++; 
		
		//시작페이지
		int startPage = (vo.getReqPage()-1)/vo.getPageRange()*vo.getPageRange()+1; 
		int endPage = startPage+vo.getPageRange()-1; 
		if(endPage > totPage) endPage = totPage; 
		
		vo.setTotCount(totCount); 
		vo.setTotPage(totPage);  
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		
		return dao.selectAll(vo);
	}

	@Override
	public QnaAdminVo detail(QnaAdminVo vo) {		
		return dao.detail(vo);
	}

	@Override
	public int insert(QnaAdminVo vo) {
		return dao.insert(vo);
	}
	
	@Override
	public QnaAdminVo edit(QnaAdminVo vo) {
		return dao.detail(vo);
	}
	
	@Override
	public int update(QnaAdminVo vo) {
		return dao.update(vo);
	}

	@Override
	public int delete(QnaAdminVo vo) {
		return dao.delete(vo);
	}	
	
}
