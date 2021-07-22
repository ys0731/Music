package music.pay;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import util.CommonVo;

public class PayVo extends CommonVo{
	
	private int no;
	private int ticket_no;
	private String ticket_type;
	private Timestamp pay_start_date;
	private Timestamp pay_end_date;
	private int user_no;

	private int time;
	
	
	public int getTicket_no() {
		return ticket_no;
	}
	public void setTicket_no(int ticket_no) {
		this.ticket_no = ticket_no;
	}
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTicket_type() {
		return ticket_type;
	}
	public void setTicket_type(String ticket_type) {
		this.ticket_type = ticket_type;
	}
	public String getPay_start_date() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH시 mm분"); 
		return sdf.format(pay_start_date);
	}
	public void setPay_start_date(Timestamp pay_start_date) {
		this.pay_start_date = pay_start_date;
	}
	public String getPay_end_date() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH시 mm분"); 
		return sdf.format(pay_end_date);
	}
	public void setPay_end_date(Timestamp pay_end_date) {
		this.pay_end_date = pay_end_date;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	
	
}
