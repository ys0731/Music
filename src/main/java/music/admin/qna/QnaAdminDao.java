package music.admin.qna;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class QnaAdminDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<QnaAdminVo> selectAll(QnaAdminVo vo){
		return sqlSession.selectList("qnaAdmin.selectAll",vo);
	}
	public int count(QnaAdminVo vo) {
		return sqlSession.selectOne("qnaAdmin.count", vo);
	}
	public QnaAdminVo detail(QnaAdminVo vo){
		return sqlSession.selectOne("qnaAdmin.detail",vo); 
	}	
	
	public int insert(QnaAdminVo vo) {
		return sqlSession.insert("qnaAdmin.insert",vo);
	}
	
	public int update(QnaAdminVo vo) {
		return sqlSession.update("qnaAdmin.update",vo);
	}
	
	public int delete(QnaAdminVo vo) {
		return sqlSession.delete("qnaAdmin.delete",vo);
	}		
}
