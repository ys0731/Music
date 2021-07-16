package music.user;

import java.sql.Timestamp;

import util.CommonVo;

public class UserVo extends CommonVo {
	
	private int no;
	private String id;
	private String pwd;
	private String email;
	private String nickname;
	private int birth_date;
	private int gender;
	private String tel;
	private Timestamp signdate;
	private String checkId;
	private String profile_org;
	private String profile_real;
	private int kakao;
	private String token;
	
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
	public int getBirth_date() {
		return birth_date;
	}
	public void setBirth_date(int birth_date) {
		this.birth_date = birth_date;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Timestamp getSigndate() {
		return signdate;
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
	public String getProfile_org() {
		return profile_org;
	}
	public void setProfile_org(String profile_org) {
		this.profile_org = profile_org;
	}
	public String getProfile_real() {
		return profile_real;
	}
	public void setProfile_real(String profile_real) {
		this.profile_real = profile_real;
	}
	public int getKakao() {
		return kakao;
	}
	public void setKakao(int kakao) {
		this.kakao = kakao;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	
	
}
