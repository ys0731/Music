package music.admin.recommend;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import music.admin.album.AdminAlbumVo;
import music.admin.artist.AdminArtistVo;
import music.admin.song.AdminSongVo;

@Service
public class AdminRecommendServiceImpl implements AdminRecommendService {
	
	@Autowired
	AdminRecommendDao dao;

	@Override
	public List<AdminSongVo> selectAll(AdminSongVo vo) {
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
	public List<AdminRecommendVo> selectToday(AdminRecommendVo vo) {
		return dao.selectToday(vo);
	}

	@Override
	public List<AdminRecommendVo> selectTag(AdminRecommendVo vo) {
		return dao.selectTag(vo);
	}
	
	@Override
	public AdminRecommendVo selectListOne(AdminRecommendVo vo) {
		return dao.selectListOne(vo);
	}

	@Override
	public int insertTop(AdminRecommendVo vo) {
		return dao.insertTop(vo);
	}
	
	@Override
	public int insertBottom(AdminRecommendVo vo) {
		return dao.insertBottom(vo);
	}

	@Override
	public int reset() {
		return dao.reset();
	}

	@Override
	public int update(AdminRecommendVo vo) {
		return dao.update(vo);
	}
	
	@Override
	public int delete(AdminRecommendVo vo) {
		int del1 = dao.deleteRecommend(vo);
		int del2 = dao.deleteRecommendList(vo);
		
		return del1;
	}


}
