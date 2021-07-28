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
		int totCount = dao.count(vo);
		
		int totPage = (totCount % vo.getPageRow() > 0) ? totCount / vo.getPageRow() + 1 : totCount / vo.getPageRow();
		System.out.println(totPage);
		
		vo.setTotCount(totCount);
		vo.setTotPage(totPage);
		
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
