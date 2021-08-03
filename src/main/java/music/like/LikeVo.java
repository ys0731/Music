package music.like;

import util.CommonVo;

public class LikeVo extends CommonVo{
	
	private int no;
	private String title;
	private String artist;
	private String album;
	private int liked; //좋아요 수
	private int song_no;
	private int user_no;
	private int ar_no; //아티스트 번호
	private int al_no; //앨범 번호
	
	private String rel;
	
	
	
	
	public String getRel() {
		return rel;
	}
	public void setRel(String rel) {
		this.rel = rel;
	}
	public int getAr_no() {
		return ar_no;
	}
	public void setAr_no(int ar_no) {
		this.ar_no = ar_no;
	}
	public int getAl_no() {
		return al_no;
	}
	public void setAl_no(int al_no) {
		this.al_no = al_no;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getSong_no() {
		return song_no;
	}
	public void setSong_no(int song_no) {
		this.song_no = song_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getArtist() {
		return artist;
	}
	public void setArtist(String artist) {
		this.artist = artist;
	}
	public String getAlbum() {
		return album;
	}
	public void setAlbum(String album) {
		this.album = album;
	}
	public int getLiked() {
		return liked;
	}
	public void setLiked(int liked) {
		this.liked = liked;
	}
	
	
	
	
	
	
	
	
}
