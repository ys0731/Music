package music.detail;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import music.admin.notice.NoticeAdminVo;

@Repository
public class DetailDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 앨범 상세
	public Map albumDetail(int no) {
		return sqlSession.selectOne("detail.albumDetail", no);
	}

	// 아티스트 상세
	public Map artistDetail(int no) {
		return sqlSession.selectOne("detail.artistDetail", no);
	}
	// 아티스트 검색
	public List<Map> artistSearch(String searchword){
		return sqlSession.selectList("detail.artistSearch",searchword);
	}

	// 노래 검색
	public List<Map> songSearch(String searchword){
		return sqlSession.selectList("detail.songSearch",searchword);
	}
	// 엘범상세 곡
	public List<Map> albumSong(int no) {
		return sqlSession.selectList("detail.albumSong", no);
	}

	// 아티스트 곡
	public List<Map> artistSong(int no) {
		return sqlSession.selectList("detail.artistSong", no);
	}

}
