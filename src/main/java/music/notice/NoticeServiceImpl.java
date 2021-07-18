package music.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	NoticeDao dao;
	
	@Override
	public List<NoticeVo> selectAll(NoticeVo vo) {
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
	public NoticeVo detail(NoticeVo vo) {		
		dao.updateReadcount(vo); //조회수 +1증가
		return dao.detail(vo);
	}


	
}
