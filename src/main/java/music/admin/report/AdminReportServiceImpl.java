package music.admin.report;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminReportServiceImpl implements AdminReportService {
	
	@Autowired
	AdminReportDao dao;

	@Override
	public List<AdminReportVo> selectAll(AdminReportVo vo) {
		
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
	public AdminReportVo detail(AdminReportVo vo) {
		return dao.detail(vo);
	}

	@Override
	public int delete(AdminReportVo vo) {
		return dao.delete(vo);
	}

	@Override
	public int insert(AdminReportVo vo) {
		return dao.insert(vo);
	}

}
