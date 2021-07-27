package music.admin.report;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminReportDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<AdminReportVo> selectAll(AdminReportVo vo) {
		return sqlSession.selectList("adminreport.selectAll", vo);
	}
	
	public AdminReportVo detail(AdminReportVo vo) {
		return sqlSession.selectOne("adminreport.detail",vo);
	}
	
	public int count(AdminReportVo vo) {
		return sqlSession.selectOne("adminreport.count",vo);
	}
	
	public int delete(AdminReportVo vo) {
		return sqlSession.delete("adminreport.delete",vo);
	}
	public int insert(AdminReportVo vo) {
		return sqlSession.insert("adminreport.insert",vo);
	}
}
