package music.admin.song;

import java.sql.Timestamp;

import util.CommonVo;

public class AdminSongVo extends CommonVo {
	
//----------Song-------------
	private int no;
	private int album_no;
	private int artist_no;
	private String title;
	private int genre;
	private String lyrics;
	private Timestamp regdate;
	private String src_org;
	private String src_real;
	
	//---------------------------Alias
	// AdminSong.xml (SELECT album FROM album WHERE album_no=album.no) AS albumName, (SELECT artist FROM artist WHERE artist_no=artist.no) AS artistName
	private String albumName;
	private String artistName;
	//---------------------------Alias
	// player.xml (SELECT *, al.img_real AS album_img, ar.artist AS artist_name)
	private String album_img;
	private String artist_name;
	//---------------------------
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getAlbum_no() {
		return album_no;
	}
	public void setAlbum_no(int album_no) {
		this.album_no = album_no;
	}
	public int getArtist_no() {
		return artist_no;
	}
	public void setArtist_no(int artist_no) {
		this.artist_no = artist_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getGenre() {
		return genre;
	}
	public void setGenre(int genre) {
		this.genre = genre;
	}
	public String getLyrics() {
		return lyrics;
	}
	public void setLyrics(String lyrics) {
		this.lyrics = lyrics;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getSrc_org() {
		return src_org;
	}
	public void setSrc_org(String src_org) {
		this.src_org = src_org;
	}
	public String getSrc_real() {
		return src_real;
	}
	public void setSrc_real(String src_real) {
		this.src_real = src_real;
	}
	
	//---------------------------
	public String getAlbumName() {
		return albumName;
	}
	public void setAlbumName(String albumName) {
		this.albumName = albumName;
	}
	public String getArtistName() {
		return artistName;
	}
	public void setArtistName(String artistName) {
		this.artistName = artistName;
	}
	//---------------------------
	public String getAlbum_img() {
		return album_img;
	}
	public void setAlbum_img(String album_img) {
		this.album_img = album_img;
	}
	public String getArtist_name() {
		return artist_name;
	}
	public void setArtist_name(String artist_name) {
		this.artist_name = artist_name;
	}
}
