package music.search;

import java.sql.Timestamp;

public class SearchVo {
	
	private int no;
	private String searchword;
	private int count; //검색 횟수를 담을 필드값
	private Timestamp searchdate;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getSearchword() {
		return searchword;
	}
	public void setSearchword(String searchword) {
		this.searchword = searchword;
	}	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Timestamp getSearchdate() {
		return searchdate;
	}
	public void setSearchdate(Timestamp searchdate) {
		this.searchdate = searchdate;
	}
	
	
}
