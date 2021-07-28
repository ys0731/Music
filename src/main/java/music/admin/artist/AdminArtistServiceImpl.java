package music.admin.artist;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminArtistServiceImpl implements AdminArtistService {
	
	@Autowired
	AdminArtistDao dao;

	@Override
	public List<AdminArtistVo> selectAll(AdminArtistVo vo) {
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
	public List<AdminArtistVo> selectAllArtists(AdminArtistVo vo) {
		return dao.selectAllArtists(vo);
	}

	@Override
	public AdminArtistVo detail(AdminArtistVo vo) {
		return dao.detail(vo);
	}

	@Override
	public int insert(AdminArtistVo vo) {
		return dao.insert(vo);
	}

	@Override
	public AdminArtistVo edit(AdminArtistVo vo) {
		return dao.detail(vo);
	}

	@Override
	public int update(AdminArtistVo vo) {
		return dao.update(vo);
	}
	
	@Override
	public int delete(AdminArtistVo vo) {
		return dao.delete(vo);
	}

}
