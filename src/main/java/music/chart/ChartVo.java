package music.chart;

import java.sql.Timestamp;

import util.CommonVo;

public class ChartVo extends CommonVo{
	
	private int no; //곡 번호
	private String title;
	private String artist;
	private String album;
	private String lyrics;
	private String org;
	private String rel;
	private int count; //누적 재생 수
	private int genre; //장르
	private int rank_ch; //순위 등락
	
	private int user_no; //유저 번호
	private int mlike_cnt; //좋아요 여부
	
	
	
	public int getMlike_cnt() {
		return mlike_cnt;
	}
	public void setMlike_cnt(int mlike_cnt) {
		this.mlike_cnt = mlike_cnt;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
	public String getLyrics() {
		return lyrics;
	}
	public void setLyrics(String lyrics) {
		this.lyrics = lyrics;
	}
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getGenre() {
		return genre;
	}
	public void setGenre(int genre) {
		this.genre = genre;
	}
	public String getOrg() {
		return org;
	}
	public void setOrg(String org) {
		this.org = org;
	}
	public String getRel() {
		return rel;
	}
	public void setRel(String rel) {
		this.rel = rel;
	}
	public int getRank_ch() {
		return rank_ch;
	}
	public void setRank_ch(int rank_ch) {
		this.rank_ch = rank_ch;
	}
	
	
	
	
	
	
	
	
	
}
