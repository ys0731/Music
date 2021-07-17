package music.admin.album;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminAlbumServiceImpl implements AdminAlbumService {
	
	@Autowired
	AdminAlbumDao dao;

	@Override
	public List<AdminAlbumVo> selectAll(AdminAlbumVo vo) {
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

	@Override
	public List<AdminAlbumVo> selectAllAlbums(AdminAlbumVo vo) {
		return dao.selectAllAlbums(vo);
	}

	@Override
	public AdminAlbumVo detail(AdminAlbumVo vo) {
		return dao.detail(vo);
	}

	@Override
	public int insert(AdminAlbumVo vo) {
		return dao.insert(vo);
	}

	@Override
	public AdminAlbumVo edit(AdminAlbumVo vo) {
		return dao.detail(vo);
	}

	@Override
	public int update(AdminAlbumVo vo) {
		return dao.update(vo);
	}
	
	@Override
	public int delete(AdminAlbumVo vo) {
		return dao.delete(vo);
	}

}
