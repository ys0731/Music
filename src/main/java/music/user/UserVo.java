package music.user;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import util.CommonVo;

public class UserVo extends CommonVo {
	
	private int no;
	private String id;
	private String pwd;
	private String email;
	private String nickname;
	private String gender;
	private String tel;
	private Timestamp signdate;
	
	private String checkId; //아이디 중복체크
	private String nicknameId; //닉네임 중복체크

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
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getSigndate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
		return sdf.format(signdate);
	}
	public void setSigndate(Timestamp signdate) {
		this.signdate = signdate;
	}
	public String getCheckId() {
		return checkId;
	}
	public void setCheckId(String checkId) {
		this.checkId = checkId;
	}	
	
}
