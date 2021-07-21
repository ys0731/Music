package music.like;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import music.chart.ChartVo;

@Service
public class LikeServiceImpl implements LikeService {
	
	@Autowired
	LikeDao dao;
	
	@Override
	public int like(LikeVo vo) {
	
		return dao.like(vo);
	}

	@Override
	public int dislike(LikeVo vo) {
		
		return dao.dislike(vo);
	}

	@Override
	public LikeVo search(LikeVo vo) {
		
		return dao.search(vo);
	}

	@Override
	public List<LikeVo> like_List(LikeVo vo) {
		vo.setPageRow(4);
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

		return dao.like_List(vo);
	}

	@Override
	public int count(LikeVo vo) {
		return dao.count(vo);
	}

	@Override
	public List<LikeVo> heart_List(LikeVo vo) {
		return dao.heart_list(vo);
	}

	

}
