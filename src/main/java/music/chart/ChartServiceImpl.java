package music.chart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChartServiceImpl implements ChartService {
	
	@Autowired
	ChartDao dao;

	@Override
	public List<ChartVo> ChartList_24hits(ChartVo vo) {		 
		return dao.ChartList_24hits(vo);
	}
	@Override
	public List<ChartVo> ChartList_daily(ChartVo vo) {		
		return dao.ChartList_daily(vo);
	}
	@Override
	public List<ChartVo> ChartList_weekly(ChartVo vo) {
		return dao.ChartList_weekly(vo);
	}

	@Override
	public List<ChartVo> ChartList_classic(ChartVo vo) {		
		return dao.ChartList_classic(vo);
	}
	
	@Override
	public List<ChartVo> ChartList_jazz(ChartVo vo) {
		return dao.ChartList_jazz(vo);
	}
	@Override
	public List<ChartVo> ChartList_kpop(ChartVo vo) {
		return dao.ChartList_kpop(vo);
	}
	@Override
	public List<ChartVo> ChartList_pop(ChartVo vo) {
		return dao.ChartList_pop(vo);
	}

	@Override
	public List<ChartVo> ChartList_recent(ChartVo vo) {
		return dao.ChartList_recent(vo);
	}
	
	@Override
	public List<ChartVo> User_recent(ChartVo vo) {
		vo.setPageRow(5);
		int totCount = dao.count(vo); // 총갯수
		// 총페이지수
		int totPage = totCount / vo.getPageRow();
		if (totCount % vo.getPageRow() > 0) totPage++;
		// 시작페이지
		int startPage = (vo.getReqPage()-1)/vo.getPageRange()
						*vo.getPageRange()+1;
		int endPage = startPage+vo.getPageRange()-1;
		if (endPage > totPage) endPage = totPage;
		
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		vo.setTotCount(totCount);
		vo.setTotPage(totPage);
		return dao.User_recent(vo);
	}
	@Override
	public ChartVo detail(int no) {
		return dao.detail(no);
	}
	

}
