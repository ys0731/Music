package music.ticket;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class TicketServiceImpl implements TicketService{

	@Autowired
	TicketDao dao;

	@Override
	public List<TicketVo> selectAll(TicketVo vo) {
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
	public int insert(TicketVo vo) {
		return dao.insert(vo);
	}

	@Override
	public int delete(TicketVo vo) {
		return dao.delete(vo);
	}
	


	
}
