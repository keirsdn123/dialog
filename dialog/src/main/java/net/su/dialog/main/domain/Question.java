package net.su.dialog.main.domain;


public class Question extends PagingVo {
   

   private int memberCode;         //회원고유번호   
   private String memberName;      //회원 이름
   private int memberRatingCode; //멤버 권한
   
   
   private int noticeCode; //Q&A 번호
   private String noticeTitle; //Q&A 제목
   private String noticeContent; // Q&A 내용
   private String noticeDate ; // Q&A 날짜
   private int noticeViews; //Q&A 조회수
   
   private int noticeFileCode; //Q&A 파일 번호
   private String noticeFileTitle; // Q&A 파일 제목
   private String noticeFileRoute; // Q&A 파일 경로
   private String noticeFileExtension; //Q&A 파일 확장자
   private String noticeFileOriginalTitle; // Q&A 파일 원본 제목
   private String noticeStatus; //Q&A 상태 
   private int noticeSort; //검색 옵션
   
   private int notice_code; //return 값 
   
   private int noticeReCode;        //Q&A답글 번호
   private String noticeReContent;  //Q&A답글 내용
   private String noticeReDate; //Q&A답글 등록일
   
   
   private String searchType; //검색 타입
   private String searchContent; //검색 내용

   
   

   public int getNotice_code() {
      return notice_code;
   }
   public void setNotice_code(int notice_code) {
      this.notice_code = notice_code;
   }
   public int getNoticeCode() {
      return noticeCode;
   }
   public void setNoticeCode(int noticeCode) {
      this.noticeCode = noticeCode;
   }
   public String getNoticeTitle() {
      return noticeTitle;
   }
   public void setNoticeTitle(String noticeTitle) {
      this.noticeTitle = noticeTitle;
   }
   public String getNoticeContent() {
      return noticeContent;
   }
   public void setNoticeContent(String noticeContent) {
      this.noticeContent = noticeContent;
   }
   public String getNoticeDate() {
      return noticeDate;
   }
   public void setNoticeDate(String noticeDate) {
      this.noticeDate = noticeDate;
   }
   public int getNoticeViews() {
      return noticeViews;
   }
   public void setNoticeViews(int noticeViews) {
      this.noticeViews = noticeViews;
   }
   public int getMemberCode() {
      return memberCode;
   }
   public void setMemberCode(int memberCode) {
      this.memberCode = memberCode;
   }
   public String getMemberName() {
      return memberName;
   }
   public void setMemberName(String memberName) {
      this.memberName = memberName;
   }
   public int getNoticeFileCode() {
      return noticeFileCode;
   }
   public void setNoticeFileCode(int noticeFileCode) {
      this.noticeFileCode = noticeFileCode;
   }
   public String getNoticeFileTitle() {
      return noticeFileTitle;
   }
   public void setNoticeFileTitle(String noticeFileTitle) {
      this.noticeFileTitle = noticeFileTitle;
   }
   public String getNoticeFileRoute() {
      return noticeFileRoute;
   }
   public void setNoticeFileRoute(String noticeFileRoute) {
      this.noticeFileRoute = noticeFileRoute;
   }
   public String getNoticeStatus() {
      return noticeStatus;
   }
   public void setNoticeStatus(String noticeStatus) {
      this.noticeStatus = noticeStatus;
   }
   public int getMemberRatingCode() {
      return memberRatingCode;
   }
   public void setMemberRatingCode(int memberRatingCode) {
      this.memberRatingCode = memberRatingCode;
   }
   public String getSearchType() {
      return searchType;
   }
   public void setSearchType(String searchType) {
      this.searchType = searchType;
   }
   public String getSearchContent() {
      return searchContent;
   }
   public void setSearchContent(String searchContent) {
      this.searchContent = searchContent;
   }
   public int getNoticeReCode() {
      return noticeReCode;
   }
   public void setNoticeReCode(int noticeReCode) {
      this.noticeReCode = noticeReCode;
   }
   public String getNoticeReContent() {
      return noticeReContent;
   }
   public void setNoticeReContent(String noticeReContent) {
      this.noticeReContent = noticeReContent;
   }
   public String getNoticeFileExtension() {
      return noticeFileExtension;
   }
   public void setNoticeFileExtension(String noticeFileExtension) {
      this.noticeFileExtension = noticeFileExtension;
   }
   public String getNoticeFileOriginalTitle() {
      return noticeFileOriginalTitle;
   }
   public void setNoticeFileOriginalTitle(String noticeFileOriginalTitle) {
      this.noticeFileOriginalTitle = noticeFileOriginalTitle;
   }
   public String getNoticeReDate() {
      return noticeReDate;
   }
   public void setNoticeReDate(String noticeReDate) {
      this.noticeReDate = noticeReDate;
   }
	public int getNoticeSort() {
		return noticeSort;
	}
	public void setNoticeSort(int noticeSort) {
		this.noticeSort = noticeSort;
	}
   
}
	
	
