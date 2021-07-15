package music.qna;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class QnaDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<QnaVo> selectAll(QnaVo vo){
		return sqlSession.selectList("qna.selectAll",vo);
	}
	public int count(QnaVo vo) {
		return sqlSession.selectOne("qna.count", vo);
	}
	public QnaVo detail(QnaVo vo){
		return sqlSession.selectOne("qna.detail",vo); 
	}	
	
	public int insert(QnaVo vo) {
		return sqlSession.insert("qna.insert",vo);
	}
	
	public int update(QnaVo vo) {
		return sqlSession.update("qna.update",vo);
	}
	
	public int delete(QnaVo vo) {
		return sqlSession.delete("qna.delete",vo);
	}		
}
