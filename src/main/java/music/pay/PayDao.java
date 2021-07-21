package music.pay;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import music.user.UserVo;


@Repository
public class PayDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<PayVo> selectAll(PayVo vo) {
		return sqlSession.selectList("pay.selectAll", vo);
	}

	public int insert(PayVo vo) {
		return sqlSession.insert("pay.insert", vo);
	}

	public int delete(PayVo vo) {
		return sqlSession.delete("pay.delete", vo);
	}

}
