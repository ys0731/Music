package music.admin.sales;

import util.CommonVo;

public class AdminSalesVo extends CommonVo {
	
private int no;
private int amount;
private String ticket_type;

// add
private int day;
private String name;
private int price;


public int getDay() {
	return day;
}
public void setDay(int day) {
	this.day = day;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public int getNo() {
	return no;
}
public void setNo(int no) {
	this.no = no;
}
public int getAmount() {
	return amount;
}
public void setAmount(int amount) {
	this.amount = amount;
}
public String getTicket_type() {
	return ticket_type;
}
public void setTicket_type(String ticket_type) {
	this.ticket_type = ticket_type;
}

	
}
