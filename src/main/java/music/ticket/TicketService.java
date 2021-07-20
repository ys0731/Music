package music.ticket;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface TicketService {
	List<TicketVo> selectAll(TicketVo vo);
	int insert(TicketVo vo);
	int delete(TicketVo vo);


}
