package music.pay;

import java.util.List;

public interface PayService {
	List<PayVo> selectAll(PayVo vo);
	int insert(PayVo vo);
	int delete(PayVo vo);


}
