package music.admin.sales;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminSalesDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<AdminSalesVo> categorySales(AdminSalesVo vo) {
		return sqlSession.selectList("sales.categorySales", vo);
	}

	public List<AdminSalesVo> ticketAll() {
		return sqlSession.selectList("sales.ticketAll");
	}
	
	public List<AdminSalesVo> ticketStatistics(int no) {
		return sqlSession.selectList("sales.ticketStatistics", no);
	}
	

}
