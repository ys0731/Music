package music.admin.sales;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminSalesServiceImpl implements AdminSalesService {
	
	@Autowired
	AdminSalesDao dao;

	@Override
	public List<AdminSalesVo> categorySales(AdminSalesVo vo) {
		return dao.categorySales(vo);
	}

	@Override
	public List<AdminSalesVo> ticketStatistics() {
		List list = new ArrayList(); // 전체데이터 담을 변수
		
		List<AdminSalesVo> all = dao.ticketAll(); // 전체이용권
		List[] listArr = new List[all.size()]; // 전체이용권갯수만큼 배열크기 지정 생성
		int allList = 0; // 길이(전체일수)
		for (int i=0; i<all.size(); i++) { // 이용권갯수만큼 반복
			List<AdminSalesVo> one = dao.ticketStatistics(all.get(i).getNo()); // 각 이용권의 날짜별 합계 리스트 조회
			listArr[i] = one; // 배열에 저장
			allList = one.size();
		}
		
		Object[] row0 = new Object[all.size()+1];
		row0[0] = "Day";
		for (int j=0; j<row0.length-1; j++) {
			AdminSalesVo vo = (AdminSalesVo)all.get(j);
			row0[j+1] = vo.getName();
		}
		list.add(row0);
		
		for (int i=0; i<allList; i++) {
			Object[] row = new Object[all.size()+1];
			
			row[0] = ((AdminSalesVo)listArr[0].get(i)).getDay();
			for (int j=0; j<row.length-1; j++) {
				AdminSalesVo vo = (AdminSalesVo)listArr[j].get(i);
				row[j+1] = vo.getPrice();
			}
			list.add(row);
			
		}
		
		return list;
	}

}
