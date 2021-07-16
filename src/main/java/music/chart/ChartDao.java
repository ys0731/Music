package music.chart;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChartDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//순위
	public List<ChartVo> ChartList_24hits(ChartVo vo) {
		return sqlSession.selectList("chart.ChartList_24hits",vo);
	}
	public List<ChartVo> ChartList_daily(ChartVo vo) {
		return sqlSession.selectList("chart.ChartList_daily",vo);
	}
	public List<ChartVo> ChartList_weekly(ChartVo vo) {
		return sqlSession.selectList("chart.ChartList_weekly",vo);
	}
	
	//장르
	public List<ChartVo> ChartList_classic(ChartVo vo) {
		return sqlSession.selectList("chart.Chart_classic", vo);
	}
	public List<ChartVo> ChartList_jazz(ChartVo vo) {
		return sqlSession.selectList("chart.Chart_jazz", vo);
	}
	public List<ChartVo> ChartList_kpop(ChartVo vo) {
		return sqlSession.selectList("chart.Chart_kpop", vo);
	}
	public List<ChartVo> ChartList_pop(ChartVo vo) {
		return sqlSession.selectList("chart.Chart_pop", vo);
	}
	
	//최신
	public List<ChartVo> ChartList_recent(ChartVo vo) {
		return sqlSession.selectList("chart.Chart_recent", vo);
	}
}
