package music.admin.report;

import java.sql.Timestamp;

import util.CommonVo;

public class AdminReportVo extends CommonVo{
	
	private int no;
	private String id; //신고당한 유저 id
	private int user_no; //신고당한 유저 번호
	private int al_no; //앨범댓글번호
	private int ar_no; //가수댓글번호
	private String al_words; //앨범댓글내용
	private String ar_words; //가수댓글내용
	private Timestamp repdate; //신고일
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getAl_words() {
		return al_words;
	}
	public void setAl_words(String al_words) {
		this.al_words = al_words;
	}
	public String getAr_words() {
		return ar_words;
	}
	public void setAr_words(String ar_words) {
		this.ar_words = ar_words;
	}
	public Timestamp getRepdate() {
		return repdate;
	}
	public void setRepdate(Timestamp repdate) {
		this.repdate = repdate;
	}
	public int getAl_no() {
		return al_no;
	}
	public void setAl_no(int al_no) {
		this.al_no = al_no;
	}
	public int getAr_no() {
		return ar_no;
	}
	public void setAr_no(int ar_no) {
		this.ar_no = ar_no;
	}
	
	
	
	
}
