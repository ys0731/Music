package music.admin.qna;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import util.CommonVo;

public class QnaAdminVo extends CommonVo{
				
	private int no;
	private String title;
	private String content;
	private int secret;
	private Timestamp regdate;
	private int user_no;
	private String answer;
	private Timestamp awregdate;
	
	private String name;
	
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getAwregdate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm"); 
		return sdf.format(regdate);
	}
	public void setAwregdate(Timestamp awregdate) {
		this.awregdate = awregdate;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getSecret() {
		return secret;
	}
	public void setSecret(int secret) {
		this.secret = secret;
	}
	public String getRegdate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm"); 
		return sdf.format(regdate);
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}


	
	
	
	
	
	
}
