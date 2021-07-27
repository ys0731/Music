package music.detail;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import music.chart.ChartVo;

@Service
public class DetailServiceImpl implements DetailService {
	
	@Autowired
	DetailDao dao;

	@Override
	public Map albumDetail(int no) {
		return dao.albumDetail(no);
	}

	@Override
	public Map artistDetail(int no) {
		return dao.artistDetail(no);
	}
	@Override
	public List<Map> artistSearch(String searchword) {
		List<Map> list = dao.artistSearch(searchword);
		return list;
	}	
	@Override
	public List<Map> albumSong(int no) {
		List<Map> list = dao.albumSong(no);
		return list;
	}

	@Override
	public List<Map> artistSong(int no) {
		List<Map> list = dao.artistSong(no);
		return list;
	}

	@Override
	public List<Map> songSearch(String searchword) {
		List<Map> list = dao.songSearch(searchword);
		return list;
	}


	
}
