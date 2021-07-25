package music.mvChart;

import java.sql.Timestamp;

import music.admin.song.AdminSongVo;

public class ClickMvVo {
	
	private int no;
	private int mv_no;
	private int user_no;
	private Timestamp clickdate;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getMv_no() {
		return mv_no;
	}
	public void setMv_no(int mv_no) {
		this.mv_no = mv_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public Timestamp getClickdate() {
		return clickdate;
	}
	public void setClickdate(Timestamp clickdate) {
		this.clickdate = clickdate;
	}
	
	
	
}
