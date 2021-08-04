package music.detail;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public List<Map> albumSong(Map map) {
		List<Map> list = dao.albumSong(map);
		return list;
	}

	@Override
	public List<Map> artistSong(Map map) {
		List<Map> list = dao.artistSong(map);
		return list;
	}

	@Override
	public List<Map> songSearch(Map map) {
		List<Map> list = dao.songSearch(map);
		return list;
	}
	
	@Override
	public List<Map> artistAlbumSearch(String searchword) {
		List<Map> list = dao.artistAlbumSearch(searchword);
		return list;
	}

	
}
