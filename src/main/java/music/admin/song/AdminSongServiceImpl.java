package music.admin.song;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import music.admin.album.AdminAlbumVo;
import music.admin.artist.AdminArtistVo;

@Service
public class AdminSongServiceImpl implements AdminSongService {
	
	@Autowired
	AdminSongDao dao;

	@Override
	public List<AdminSongVo> selectAll(AdminSongVo vo) {
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
	public List<AdminSongVo> selectAllSongs(AdminSongVo vo) {
		return dao.selectAllSongs(vo);
	}

	@Override
	public AdminSongVo detail(AdminSongVo vo) {
		return dao.detail(vo);
	}

	@Override
	public int insert(AdminSongVo vo) {
		return dao.insert(vo);
	}

	@Override
	public AdminSongVo edit(AdminSongVo vo) {
		return dao.detail(vo);
	}

	@Override
	public int update(AdminSongVo vo) {
		return dao.update(vo);
	}
	
	@Override
	public int delete(AdminSongVo vo) {
		int deletedList = dao.deleteIncludedList(vo);
		return dao.delete(vo);
	}

	@Override
	public AdminAlbumVo exist1(AdminAlbumVo vo) {
		return dao.exist1(vo);
	}

	@Override
	public AdminArtistVo exist2(AdminArtistVo vo) {
		return dao.exist2(vo);
	}


}
