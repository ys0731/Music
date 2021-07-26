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
		List<ChartVo> list = dao.ChartList_24hits(vo);
		return list;
	}
	@Override
	public List<ChartVo> ChartList_daily(ChartVo vo) {
		List<ChartVo> list = dao.ChartList_daily(vo);
		return list;
	}
	@Override
	public List<ChartVo> ChartList_weekly(ChartVo vo) {
		List<ChartVo> list = dao.ChartList_weekly(vo);
		return list;
	}

	@Override
	public List<ChartVo> ChartList_classic(ChartVo vo) {
		List<ChartVo> list = dao.ChartList_classic(vo);
		return list;
	}
	
	@Override
	public List<ChartVo> ChartList_jazz(ChartVo vo) {
		List<ChartVo> list = dao.ChartList_jazz(vo);
		return list;
	}
	@Override
	public List<ChartVo> ChartList_kpop(ChartVo vo) {
		List<ChartVo> list = dao.ChartList_kpop(vo);
		return list;
	}
	@Override
	public List<ChartVo> ChartList_pop(ChartVo vo) {
		List<ChartVo> list = dao.ChartList_pop(vo);
		return list;
	}

	@Override
	public List<ChartVo> ChartList_recent(ChartVo vo) {
		List<ChartVo> list = dao.ChartList_recent(vo);
		return list;
	}
	
	@Override
	public List<ChartVo> User_recent(ChartVo vo) {
		vo.setPageRow(4);
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
		List<ChartVo> list = dao.User_recent(vo);
		return list;
	}
	@Override
	public ChartVo detail(int no) {
		ChartVo vo = dao.detail(no);
		return vo;
	}
	

}
