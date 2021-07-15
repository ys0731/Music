package util;

public class CommonVo {
	
	private int pageRow;  //페이지당 개수
	private int startIdx; //시작 인덱스
	private int reqPage;  //사용자가 요청한 페이지 
	private int totCount; //총개수
	private int totPage; //총페이지수
	private int pageRange; //하단페이지 범위(10개 혹은 5개 등등) 
	private int startPage; //시작페이지
	private int endPage;   //끝페이지 
	private String stype; //검색타입(전체,제목,내용)
	private String sval; //검색어 
	private String filename_org; //사용자가 첨부한 원본파일명
	private String filename_real; //서버에 저장된 실제파일명 
	private String isDel; //기존파일 삭제 체크 
	
	public CommonVo() {
		this.pageRow = 10; //기본값
		this.reqPage = 1; 
		this.pageRange=5;
	}
	
	public String getIsDel() {
		return isDel;
	}
	public void setIsDel(String isDel) {
		this.isDel = isDel;
	}
	public String getFilename_org() {
		return filename_org;
	}
	
	public void setFilename_org(String filename_org) {
		this.filename_org = filename_org;
	}
	
	public String getFilename_real() {
		return filename_real;
	}
	
	public void setFilename_real(String filename_real) {
		this.filename_real = filename_real;
	}
	
	public String getStype() {
		return stype;
	}
	public void setStype(String stype) {
		this.stype = stype;
	}
	public String getSval() {
		return sval;
	}
	public void setSval(String sval) {
		this.sval = sval;
	}
	public int getStartPage() {
		return startPage;
	}
	
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	
	public int getEndPage() {
		return endPage;
	}
	
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	public int getPageRange() {
		return pageRange;
	}
	
	public void setPageRange(int pageRange) {
		this.pageRange = pageRange;
	}
	public int getTotCount() {
		return totCount;
	}
	
	public void setTotCount(int totCount) {
		this.totCount = totCount;
	}
	
	public int getTotPage() {
		return totPage;
	}
	
	public void setTotPage(int totPage) {
		this.totPage = totPage;
	}
	public int getReqPage() {
		return reqPage;
	}
	
	public void setReqPage(int reqPage) {
		this.reqPage = reqPage;
	}
	
	public int getStartIdx() {
		return (getReqPage()-1)*getPageRow(); 										      
	}
	
	public void setStartIdx(int startIdx) {
		this.startIdx = startIdx;
	}
	
	public int getPageRow() {
		return pageRow;
	}

	public void setPageRow(int pageRow) {
		this.pageRow = pageRow;
	}
}
