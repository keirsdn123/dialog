package net.su.dialog.formalModule.domain;

public class RssNewsModule {

	private int rssNewsSeq;	//RSS 뉴스 고유번호
	private String rssNewsTitle;	//RSS 뉴스 제목
	private String rssNewsContents;	//RSS 뉴스 내용
	private String rssNewsRegistrationDate;	//RSS 뉴스 등록일
	private String rssNewsModificationDate;	//RSS 뉴스 수정일
	private String rssNewsAuthor;	//RSS 뉴스 기자
	private String rssNewsCategory; //RSS 뉴스 분류
	private String rssNewsLink;	//RSS 뉴스 링크
	
	
	
	
	
	
//	private int dataCode;
	
	
//	public int getDataCode() {
//		return dataCode;
//	}
//	public void setDataCode(int dataCode) {
//		this.dataCode = dataCode;
//	}
	public String getRssNewsLink() {
		return rssNewsLink;
	}
	public void setRssNewsLink(String rssNewsLink) {
		this.rssNewsLink = rssNewsLink;
	}
	public int getRssNewsSeq() {
		return rssNewsSeq;
	}
	public void setRssNewsSeq(int rssNewsSeq) {
		this.rssNewsSeq = rssNewsSeq;
	}
	public String getRssNewsTitle() {
		return rssNewsTitle;
	}
	public void setRssNewsTitle(String rssNewsTitle) {
		this.rssNewsTitle = rssNewsTitle;
	}
	public String getRssNewsContents() {
		return rssNewsContents;
	}
	public void setRssNewsContents(String rssNewsContents) {
		this.rssNewsContents = rssNewsContents;
	}
	public String getRssNewsRegistrationDate() {
		return rssNewsRegistrationDate;
	}
	public void setRssNewsRegistrationDate(String rssNewsRegistrationDate) {
		this.rssNewsRegistrationDate = rssNewsRegistrationDate;
	}
	public String getRssNewsModificationDate() {
		return rssNewsModificationDate;
	}
	public void setRssNewsModificationDate(String rssNewsModificationDate) {
		this.rssNewsModificationDate = rssNewsModificationDate;
	}
	public String getRssNewsAuthor() {
		return rssNewsAuthor;
	}
	public void setRssNewsAuthor(String rssNewsAuthor) {
		this.rssNewsAuthor = rssNewsAuthor;
	}
	public String getRssNewsCategory() {
		return rssNewsCategory;
	}
	public void setRssNewsCategory(String rssNewsCategory) {
		this.rssNewsCategory = rssNewsCategory;
	}
	
	
}
