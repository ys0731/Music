package music.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import util.SendMail;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserDao dao;

	public List<UserVo> selectAll(UserVo vo) {
		int totCount = dao.count(vo); // 총갯수
		// 총페이지수
		int totPage = totCount / vo.getPageRow();
		if (totCount % vo.getPageRow() > 0) totPage++;
		// 시작페이지
		int startPage = (vo.getReqPage()-1)/vo.getPageRange()
						*vo.getPageRange()+1;
		int endPage = startPage+vo.getPageRange()-1;
		if (endPage > totPage) endPage = totPage;
		
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		vo.setTotCount(totCount);
		vo.setTotPage(totPage);
		return dao.selectAll(vo);
	}

	public UserVo deatil(UserVo vo) {
		return dao.detail(vo);
	}

	public int insert(UserVo vo) {
		return dao.insert(vo);
	}

	public UserVo edit(UserVo vo) {
		return dao.detail(vo);
	}

	public int update(UserVo vo) {
		return dao.update(vo);
	}

	public int delete(UserVo vo) {
		return dao.delete(vo);
	}

	public int isDuplicateId(String id) {
		return dao.isDuplicateId(id);
	}

	public int isDuplicateNickname(String nickname) {
		return dao.isDuplicateNickname(nickname);
	}
	
	public UserVo login(UserVo vo) {
		return dao.login(vo);
	}



}

