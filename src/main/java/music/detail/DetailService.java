package music.detail;

import java.util.List;
import java.util.Map;

public interface DetailService {
	Map albumDetail(int no);
	Map artistDetail(int no);
	List<Map> albumSong(int no);
	List<Map> artistSong(int no);
	List<Map> artistSearch(String searchword);
	List<Map> songSearch(String searchword);
	List<Map> artistAlbumSearch(String searchword);
	  
}
