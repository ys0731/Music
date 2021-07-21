package music.mvChart;

import java.util.List;

public interface MvChartService {
	List<MvChartVo> PopularMv(MvChartVo vo);
	List<MvChartVo> RecentMv(MvChartVo vo);

	  
}
