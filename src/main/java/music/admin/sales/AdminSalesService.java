package music.admin.sales;

import java.util.List;

import music.admin.song.AdminSongVo;

public interface AdminSalesService {

	List<AdminSalesVo> categorySales(AdminSalesVo vo);
	List<AdminSalesVo> ticketStatistics();

}
