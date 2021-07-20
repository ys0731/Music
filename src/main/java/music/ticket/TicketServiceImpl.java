package music.ticket;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class TicketServiceImpl implements TicketService{

	@Autowired
	TicketDao dao;

	@Override
	public List<TicketVo> selectAll(TicketVo vo) {
		return dao.selectAll(vo);
	}

	@Override
	public int insert(TicketVo vo) {
		return dao.insert(vo);
	}

	@Override
	public int delete(TicketVo vo) {
		return dao.delete(vo);
	}
	


	
}
