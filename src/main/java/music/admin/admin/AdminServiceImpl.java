package music.admin.admin;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminDao dao;

	@Override
	public AdminVo login(AdminVo vo) {
		return dao.login(vo);
	}



}

