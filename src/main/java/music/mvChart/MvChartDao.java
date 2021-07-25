package music.mvChart;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MvChartDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	  
		//인기
		public List<MvChartVo> PopularMv(MvChartVo vo) {
			return sqlSession.selectList("mvChart.popularMv",vo);    
		}
		//최신    
		public List<MvChartVo> RecentMv(MvChartVo vo) {
			return sqlSession.selectList("mvChart.recentMv", vo);
		}
		//mv로그
		public int insert(ClickMvVo vo) {
			return sqlSession.insert("mvChart.clickMv", vo);
		}
	}
