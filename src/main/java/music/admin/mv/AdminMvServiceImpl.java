package music.admin.mv;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import music.admin.song.AdminSongVo;

@Service
public class AdminMvServiceImpl implements AdminMvService {
	
	@Autowired
	AdminMvDao dao;

	public List<AdminMvVo> selectAll(AdminMvVo vo) {
		// 총 개수
				int totCount = dao.count(vo);
				
				// 페이지 개수
				int totPage = (totCount % vo.getPageRow() > 0) ? totCount / vo.getPageRow() + 1 : totCount / vo.getPageRow();
				System.out.println(totPage);
				
				// Command객체를 사용하기 위하여 세팅함
				vo.setTotCount(totCount);
				vo.setTotPage(totPage);
				
				// 시작 페이지
				int startPage = (vo.getReqPage() - 1) / (vo.getPageRange()) * (vo.getPageRange()) + 1;
				int endPage = startPage + vo.getPageRange() - 1;
				if (endPage > totPage) endPage = totPage;
				
				vo.setStartPage(startPage);
				vo.setEndPage(endPage);
				
				return dao.selectAll(vo);
			}

	public AdminMvVo detail(AdminMvVo vo) {
		return dao.detail(vo);
	}

	public int insert(AdminMvVo vo) {
		return dao.insert(vo);
	}

	public AdminMvVo edit(AdminMvVo vo) {
		return dao.detail(vo);
	}

	public int update(AdminMvVo vo) {
		return dao.update(vo);
	}

	public int delete(AdminMvVo vo) {
		return dao.delete(vo);
	}

	public AdminSongVo exist(AdminSongVo vo) {
		return dao.exist(vo);
	}


}
