package music.admin.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class NoticeAdminServiceImpl implements NoticeAdminService{

	@Autowired
	NoticeAdminDao dao;
	
	@Override
	public List<NoticeAdminVo> selectAll(NoticeAdminVo vo) {
		int totCount = dao.count(vo); 
		
		//총 페이지수
		int totPage = totCount / vo.getPageRow();
		if(totCount % vo.getPageRow() > 0) totPage++; 
		
		//시작페이지
		int startPage = (vo.getReqPage()-1)/vo.getPageRange()*vo.getPageRange()+1; 
		int endPage = startPage+vo.getPageRange()-1; 
		if(endPage > totPage) endPage = totPage; 
		
		vo.setTotCount(totCount); 
		vo.setTotPage(totPage);  
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		
		return dao.selectAll(vo);
	}

	@Override
	public NoticeAdminVo detail(NoticeAdminVo vo) {		
		dao.updateReadcount(vo); //조회수 +1증가
		return dao.detail(vo);
	}

	@Override
	public int insert(NoticeAdminVo vo) {
		return dao.insert(vo);
	}
	
	@Override
	public NoticeAdminVo edit(NoticeAdminVo vo) {
		return dao.detail(vo);
	}
	
	@Override
	public int update(NoticeAdminVo vo) {
		return dao.update(vo);
	}

	@Override
	public int delete(NoticeAdminVo vo) {
		return dao.delete(vo);
	}	
	
}
