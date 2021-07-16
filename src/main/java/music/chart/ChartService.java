package music.chart;

import java.util.List;

public interface ChartService {
	List<ChartVo> ChartList_24hits(ChartVo vo);
	List<ChartVo> ChartList_daily(ChartVo vo);
	List<ChartVo> ChartList_weekly(ChartVo vo);
	List<ChartVo> ChartList_classic(ChartVo vo);
	List<ChartVo> ChartList_jazz(ChartVo vo);
	List<ChartVo> ChartList_kpop(ChartVo vo);
	List<ChartVo> ChartList_pop(ChartVo vo);
	List<ChartVo> ChartList_recent(ChartVo vo);

	
}
