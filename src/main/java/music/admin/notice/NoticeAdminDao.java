package music.admin.notice;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeAdminDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<NoticeAdminVo> selectAll(NoticeAdminVo vo){
		return sqlSession.selectList("noticeAdmin.selectAll",vo);
	}
	
	public int count(NoticeAdminVo vo){
		return sqlSession.selectOne("noticeAdmin.count",vo); 
	}
	
	public NoticeAdminVo detail(NoticeAdminVo vo){
		return sqlSession.selectOne("noticeAdmin.detail",vo); 
	}	
	
	public void updateReadcount(NoticeAdminVo vo){
		sqlSession.update("noticeAdmin.updateReadcount",vo);
	}		
	
	public int insert(NoticeAdminVo vo) {
		return sqlSession.insert("noticeAdmin.insert",vo);
	}
	
	public int update(NoticeAdminVo vo) {
		return sqlSession.update("noticeAdmin.update",vo);
	}
	
	public int delete(NoticeAdminVo vo) {
		return sqlSession.delete("noticeAdmin.delete",vo);
	}		
}
