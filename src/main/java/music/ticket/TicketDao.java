package music.ticket;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TicketDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<TicketVo> selectAll(TicketVo vo) {
		return sqlSession.selectList("ticket.selectAll", vo);
	}

	public int insert(TicketVo vo) {
		return sqlSession.insert("ticket.insert", vo);
	}

	public int delete(TicketVo vo) {
		return sqlSession.delete("ticket.delete", vo);
	}


}
