package music.recommend;

public class RecommendVo {
	
	//----------Recommend-------------
	private int no;
	private int group_id;
	private int order_id;
	private String img;
	private String title;
	private String sub_title;
	//----------Recommend_list-------------
	private int package_id;
	private int song_no;
	//--------------------------------
	private int songcount; // 포함된 곡의 수
	//--------------------------------Alias
	private int songList_no;
	private String songList_title;
	private int songList_album_no;
	private String songList_album;
	private String songList_albumImg;
	private int songList_artist_no;
	private String songList_artist;

	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getGroup_id() {
		return group_id;
	}
	public void setGroup_id(int group_id) {
		this.group_id = group_id;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSub_title() {
		return sub_title;
	}
	public void setSub_title(String sub_title) {
		this.sub_title = sub_title;
	}
	
	
	public int getPackage_id() {
		return package_id;
	}
	public void setPackage_id(int package_id) {
		this.package_id = package_id;
	}
	public int getSong_no() {
		return song_no;
	}
	public void setSong_no(int song_no) {
		this.song_no = song_no;
	}
	
	
	public int getSongcount() {
		return songcount;
	}
	public void setSongcount(int songcount) {
		this.songcount = songcount;
	}
	
	
	public int getSongList_no() {
		return songList_no;
	}
	public void setSongList_no(int songList_no) {
		this.songList_no = songList_no;
	}
	public String getSongList_title() {
		return songList_title;
	}
	public void setSongList_title(String songList_title) {
		this.songList_title = songList_title;
	}
	public String getSongList_album() {
		return songList_album;
	}
	public void setSongList_album(String songList_album) {
		this.songList_album = songList_album;
	}
	public String getSongList_albumImg() {
		return songList_albumImg;
	}
	public void setSongList_albumImg(String songList_albumImg) {
		this.songList_albumImg = songList_albumImg;
	}
	public String getSongList_artist() {
		return songList_artist;
	}
	public void setSongList_artist(String songList_artist) {
		this.songList_artist = songList_artist;
	}
	public int getSongList_album_no() {
		return songList_album_no;
	}
	public void setSongList_album_no(int songList_album_no) {
		this.songList_album_no = songList_album_no;
	}
	public int getSongList_artist_no() {
		return songList_artist_no;
	}
	public void setSongList_artist_no(int songList_artist_no) {
		this.songList_artist_no = songList_artist_no;
	}
	
	
}
