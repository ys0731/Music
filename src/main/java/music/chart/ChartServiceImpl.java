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
	

}
