package music.admin.recommend;

public class AdminRecommendVo {
	
	//----------Recommend-------------
	private int no;
	private int group_id;
	private int order_id;
	private String img;
	private String title;
	private String sub_title;
	//----------Recommend_list-------------
	private int package_id;
	private int song_no;
	//----------todaytag_delete-------------
	private int[] nos;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getGroup_id() {
		return group_id;
	}
	public void setGroup_id(int group_id) {
		this.group_id = group_id;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSub_title() {
		return sub_title;
	}
	public void setSub_title(String sub_title) {
		this.sub_title = sub_title;
	}
	
	
	public int getPackage_id() {
		return package_id;
	}
	public void setPackage_id(int package_id) {
		this.package_id = package_id;
	}
	public int getSong_no() {
		return song_no;
	}
	public void setSong_no(int song_no) {
		this.song_no = song_no;
	}
	
	
	public int[] getNos() {
		return nos;
	}
	public void setNos(int[] nos) {
		this.nos = nos;
	}
	
}
