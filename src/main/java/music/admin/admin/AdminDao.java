package music.admin.admin;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public AdminVo login(AdminVo vo) {
		return sqlSession.selectOne("admin.login", vo);
	}
	

}
