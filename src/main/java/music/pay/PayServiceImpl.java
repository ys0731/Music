package music.pay;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class PayServiceImpl implements PayService{

	@Autowired
	PayDao dao;


	@Override
	public List<PayVo> selectAll(PayVo vo) {
		return dao.selectAll(vo);
	}
	
	@Override
	public int insert(PayVo vo) {
		return dao.insert(vo);
	}

	@Override
	public int delete(PayVo vo) {
		return dao.delete(vo);
	}
	


	
}
