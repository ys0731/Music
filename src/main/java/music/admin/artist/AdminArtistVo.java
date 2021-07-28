package music.admin.artist;

import java.sql.Timestamp;

import util.CommonVo;

public class AdminArtistVo extends CommonVo {
	
//----------Artist-------------
	private int no;
	private String artist;
	private String debdate;
	private String info;
	private String img_org;
	private String img_real;
	private Timestamp regdate;
	
	//-----------------------------------대조용
	private int artist_no;
	
	public int getArtist_no() {
		return artist_no;
	}
	public void setArtist_no(int artist_no) {
		this.artist_no = artist_no;
	}
	//----------------------------------------
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getArtist() {
		return artist;
	}
	public void setArtist(String artist) {
		this.artist = artist;
	}
	public String getDebdate() {
		return debdate;
	}
	public void setDebdate(String debdate) {
		this.debdate = debdate;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getImg_org() {
		return img_org;
	}
	public void setImg_org(String img_org) {
		this.img_org = img_org;
	}
	public String getImg_real() {
		return img_real;
	}
	public void setImg_real(String img_real) {
		this.img_real = img_real;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
}
