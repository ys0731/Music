package music.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QnaServiceImpl implements QnaService{

	@Autowired
	QnaDao dao;
	
	@Override
	public List<QnaVo> selectAll(QnaVo vo) {
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
	public QnaVo detail(QnaVo vo) {		
		return dao.detail(vo);
	}

	@Override
	public int insert(QnaVo vo) {
		return dao.insert(vo);
	}
	
	@Override
	public QnaVo edit(QnaVo vo) {
		return dao.detail(vo);
	}
	
	@Override
	public int update(QnaVo vo) {
		return dao.update(vo);
	}

	@Override
	public int delete(QnaVo vo) {
		return dao.delete(vo);
	}	
	
}
