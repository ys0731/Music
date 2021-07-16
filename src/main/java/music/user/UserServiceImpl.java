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

	public UserVo login(UserVo vo) {
		return dao.login(vo);
	}

	public UserVo searchId(UserVo vo) {
		return dao.searchId(vo);
	}

	public UserVo searchPwd(UserVo vo) {
		//1.아이디, 이메일로 조회
				UserVo uv = dao.searchPwd(vo);
				//2.조회결과가 있으면 임시비밀번호 생성, 수정
				if (uv != null) {
					//임시비밀번호 생성
					String tempPwd = "";
					for (int i=0; i<3; i++) {
						tempPwd += (char)((Math.random()*26)+65);
					}
					for (int i=0; i<3; i++) {
						tempPwd += (int)((Math.random()*9));
					}
					vo.setPwd(tempPwd); //임시비밀번호 vo에 저장
					dao.updateTempPwd(vo); //임시비밀번호를 db에 수정
					//3.이메일로 임시비밀번호 전송
					SendMail.sendMail("lsmvip0522@naver.com", uv.getEmail(), "[SEND MUSIC]"+uv.getId()+"님의 임시 비밀번호 입니다.", "안녕하세요 SENDMUSIC입니다."+uv.getId()+"님의 임시 비밀번호는 "+tempPwd+"입니다.");
				}
				return uv;
			}

}

