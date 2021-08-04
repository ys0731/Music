package music.detail;

import java.util.List;
import java.util.Map;

public interface DetailService {
	Map albumDetail(int no);
	Map artistDetail(int no);
	List<Map> albumSong(Map map);
	List<Map> artistSong(Map map);
	List<Map> artistSearch(String searchword);
	List<Map> songSearch(Map map);
	List<Map> artistAlbumSearch(String searchword);
	  
}
