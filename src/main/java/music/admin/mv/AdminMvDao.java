package music.admin.mv;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import music.admin.song.AdminSongVo;

@Repository
public class AdminMvDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<AdminMvVo> selectAll(AdminMvVo vo) {
		return sqlSession.selectList("mv.selectAll", vo); 
	}

	public int count(AdminMvVo vo) {
		return sqlSession.selectOne("mv.count", vo);
	}

	public AdminMvVo detail(AdminMvVo vo) {
		return sqlSession.selectOne("mv.detail", vo);
	}
	
	public int insert(AdminMvVo vo) {
		return sqlSession.insert("mv.insert", vo);
	}

	public int update(AdminMvVo vo) {
		return sqlSession.update("mv.update", vo);
	}
	
	public int delete(AdminMvVo vo) {
		return sqlSession.delete("mv.delete", vo);
	}
	
	public AdminSongVo exist(AdminSongVo vo) {
		return sqlSession.selectOne("mv.exist", vo);
	}

}
