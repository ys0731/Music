package music.player;

import java.sql.Timestamp;

import util.StatisticVo;

public class MusicPlayerVo extends StatisticVo {
	
//----------Play-------------
	private int no;
	private int song_no;
	private int user_no;
	private Timestamp clickdate;
	
	
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
	public Timestamp getClickdate() {
		return clickdate;
	}
	public void setClickdate(Timestamp clickdate) {
		this.clickdate = clickdate;
	}

	
}
