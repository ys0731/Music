package music.mvChart;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MvChartDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	  
		//최신    
		public List<MvChartVo> RecentMv(MvChartVo vo) {
			return sqlSession.selectList("mvChart.recentMv", vo);
		}
	}
