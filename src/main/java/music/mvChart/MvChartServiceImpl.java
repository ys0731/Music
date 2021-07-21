package music.mvChart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MvChartServiceImpl implements MvChartService {
	
	@Autowired
	MvChartDao dao;   

	public List<MvChartVo> PopularMv(MvChartVo vo) {
		List<MvChartVo> list = dao.PopularMv(vo);
		return list;
	}

	public List<MvChartVo> RecentMv(MvChartVo vo) {
		List<MvChartVo> list = dao.RecentMv(vo);
		return list;
	}

	
}
