package music.admin.album;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import util.CommonVo;

public class AdminAlbumVo extends CommonVo {
	
//----------Album-------------
	private int no;
	private String album;
	private int genre;
	private String reldate;
	private String info;
	private String img_org;
	private String img_real;
	private Timestamp regdate;
	
	//-----------------------------------대조용
	private int album_no;
	
	public int getAlbum_no() {
		return album_no;
	}
	public void setAlbum_no(int album_no) {
		this.album_no = album_no;
	}
	//----------------------------------------
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getAlbum() {
		return album;
	}
	public void setAlbum(String album) {
		this.album = album;
	}
	public int getGenre() {
		return genre;
	}
	public void setGenre(int genre) {
		this.genre = genre;
	}
	public String getReldate() {
		return reldate;
	}
	public void setReldate(String reldate) {
		this.reldate = reldate;
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
//	public String getRegdate() {
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
//		return sdf.format(regdate);
//	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	
}
