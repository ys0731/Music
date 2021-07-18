package music.admin.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
//	
//	public List<AdminVo> selectAll(AdminVo vo) {
//		return sqlSession.selectList("user.selectAll", vo);
//	}
//	
//	public int count(AdminVo vo) {
//		return sqlSession.selectOne("user.count", vo);
//	}
//	
//	public AdminVo detail(AdminVo vo) {
//		return sqlSession.selectOne("user.detail", vo);
//	}
//	
//	public int insert(AdminVo vo) {
//		return sqlSession.insert("user.insert", vo);
//	}
//	
//	public int update(AdminVo vo) {
//		return sqlSession.update("user.update", vo);
//	}
//	
//	public int delete(AdminVo vo) {
//		return sqlSession.delete("user.delete", vo);
//	}
//	
//	public int isDuplicateId(String id) {
//		return sqlSession.selectOne("user.isDuplicateId", id);
//	}
	
	public AdminVo login(AdminVo vo) {
		return sqlSession.selectOne("admin.login", vo);
	}
	

}
