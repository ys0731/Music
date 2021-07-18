package music.notice;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<NoticeVo> selectAll(NoticeVo vo){
		return sqlSession.selectList("notice.selectAll",vo);
	}
	
	public int count(NoticeVo vo){
		return sqlSession.selectOne("notice.count",vo); 
	}
	
	public NoticeVo detail(NoticeVo vo){
		return sqlSession.selectOne("notice.detail",vo); 
	}	
	
	public void updateReadcount(NoticeVo vo){
		sqlSession.update("notice.updateReadcount",vo);
	}		
	
	
}
