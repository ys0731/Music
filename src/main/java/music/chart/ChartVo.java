package music.chart;

import java.sql.Timestamp;

public class ChartVo {
		
	private String title;
	private String artist;
	private String album;
	private String lyrics;
	private String org;
	private String rel;
	private int count; //누적 재생 수
	private int genre; //장르
	private int rank_ch; //순위 등락
	
	
	
	
	
	
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
