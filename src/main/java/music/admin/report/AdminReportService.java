package music.admin.report;

import java.util.List;


public interface AdminReportService {
	
	List<AdminReportVo> selectAll(AdminReportVo vo);
	AdminReportVo detail(AdminReportVo vo);
	int delete(AdminReportVo vo);
	int insert(AdminReportVo vo);
}
