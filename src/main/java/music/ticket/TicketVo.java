package music.ticket;

import java.sql.Timestamp;

import util.CommonVo;

public class TicketVo extends CommonVo{
	
	private int no;
	private String ticket_type;
	private int price;
	private Timestamp regdate;
	private int time;
	
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	

	
	
}
