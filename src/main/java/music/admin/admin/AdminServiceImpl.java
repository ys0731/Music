package music.admin.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import util.SendMail;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminDao dao;

	@Override
	public AdminVo login(AdminVo vo) {
		return dao.login(vo);
	}



}

