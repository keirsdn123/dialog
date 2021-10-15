package net.su.dialog.formalModule.domain;

import java.util.List;

public class DaumNewsModule {
	
	private int scheduleCode;	//뉴스 크롤링 seq
	private int dataCode;		//정기 데이터셋  seq
	private String scheWorkTitle; //스케줄 작업명 
	private String newsCollectKeyword;	//뉴스 크롤링 수집단어
	private String newsCollectStartDate;	//뉴스 크롤링 시작날짜
	private String newsCollectEndDate;	//뉴스 크롤링 종료날짜
	
	private int daumNewsCollectModuleSeq;	//다음 뉴스 수집 seq
	private String daumNewsCollectModuleTableName;	//다음뉴스 테이블 이름
	private String daumNewsCollectModuleTitle = null;	//다음 뉴스 수집 제목
	private String daumNewsCollectModuleContent =null;	//다음 뉴스 수집 내용
	private String daumNewsCollectModuleWriter =null;	//다음 뉴스 수집 작성자
	private String daumNewsCollectModuleDate =null;		//다음 뉴스 수집 등록날짜
	private String daumNewsCollectModuleModifyDate =null;	//다음 뉴스 수집 수정날짜
	private String daumNewsCollectModuleNewsPaper =null;	//다음 뉴스 수집 신문사
	private String daumNewsCollectModuleLink;
	private int daumNewsCollectRequestCode;	//다음 뉴스 데이터 수집 요청 seq
	
	private int memberCode;
	private int dataExportRequestCode;
	private int dataExportManagementCode;
	private String exportCollectStatus;
	private String regularDataTableTitle;
	private String exportCollectDate;
	
	
	public String getDaumNewsCollectModuleLink() {
		return daumNewsCollectModuleLink;
	}
	public void setDaumNewsCollectModuleLink(String daumNewsCollectModuleLink) {
		this.daumNewsCollectModuleLink = daumNewsCollectModuleLink;
	}
	public int getDataExportManagementCode() {
		return dataExportManagementCode;
	}
	public void setDataExportManagementCode(int dataExportManagementCode) {
		this.dataExportManagementCode = dataExportManagementCode;
	}
	public String getExportCollectStatus() {
		return exportCollectStatus;
	}
	public void setExportCollectStatus(String exportCollectStatus) {
		this.exportCollectStatus = exportCollectStatus;
	}
	public String getRegularDataTableTitle() {
		return regularDataTableTitle;
	}
	public void setRegularDataTableTitle(String regularDataTableTitle) {
		this.regularDataTableTitle = regularDataTableTitle;
	}
	public String getExportCollectDate() {
		return exportCollectDate;
	}
	public void setExportCollectDate(String exportCollectDate) {
		this.exportCollectDate = exportCollectDate;
	}
	public int getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}
	public int getDataExportRequestCode() {
		return dataExportRequestCode;
	}
	public void setDataExportRequestCode(int dataExportRequestCode) {
		this.dataExportRequestCode = dataExportRequestCode;
	}
	public int getDaumNewsCollectRequestCode() {
		return daumNewsCollectRequestCode;
	}
	public void setDaumNewsCollectRequestCode(int daumNewsCollectRequestCode) {
		this.daumNewsCollectRequestCode = daumNewsCollectRequestCode;
	}
	public String getDaumNewsCollectModuleTableName() {
		return daumNewsCollectModuleTableName;
	}
	public void setDaumNewsCollectModuleTableName(String daumNewsCollectModuleTableName) {
		this.daumNewsCollectModuleTableName = daumNewsCollectModuleTableName;
	}
	public String getScheWorkTitle() {
		return scheWorkTitle;
	}
	public void setScheWorkTitle(String scheWorkTitle) {
		this.scheWorkTitle = scheWorkTitle;
	}
	public String getDaumNewsCollectModuleNewsPaper() {
		return daumNewsCollectModuleNewsPaper;
	}
	public void setDaumNewsCollectModuleNewsPaper(String daumNewsCollectModuleNewsPaper) {
		this.daumNewsCollectModuleNewsPaper = daumNewsCollectModuleNewsPaper;
	}
	public int getScheduleCode() {
		return scheduleCode;
	}
	public void setScheduleCode(int scheduleCode) {
		this.scheduleCode = scheduleCode;
	}
	public int getDataCode() {
		return dataCode;
	}
	public void setDataCode(int dataCode) {
		this.dataCode = dataCode;
	}
	public String getNewsCollectKeyword() {
		return newsCollectKeyword;
	}
	public void setNewsCollectKeyword(String newsCollectKeyword) {
		this.newsCollectKeyword = newsCollectKeyword;
	}
	public String getNewsCollectStartDate() {
		return newsCollectStartDate;
	}
	public void setNewsCollectStartDate(String newsCollectStartDate) {
		this.newsCollectStartDate = newsCollectStartDate;
	}
	public String getNewsCollectEndDate() {
		return newsCollectEndDate;
	}
	public void setNewsCollectEndDate(String newsCollectEndDate) {
		this.newsCollectEndDate = newsCollectEndDate;
	}
	public int getDaumNewsCollectModuleSeq() {
		return daumNewsCollectModuleSeq;
	}
	public void setDaumNewsCollectModuleSeq(int daumNewsCollectModuleSeq) {
		this.daumNewsCollectModuleSeq = daumNewsCollectModuleSeq;
	}
	public String getDaumNewsCollectModuleTitle() {
		return daumNewsCollectModuleTitle;
	}
	public void setDaumNewsCollectModuleTitle(String daumNewsCollectModuleTitle) {
		this.daumNewsCollectModuleTitle = daumNewsCollectModuleTitle;
	}
	public String getDaumNewsCollectModuleContent() {
		return daumNewsCollectModuleContent;
	}
	public void setDaumNewsCollectModuleContent(String daumNewsCollectModuleContent) {
		this.daumNewsCollectModuleContent = daumNewsCollectModuleContent;
	}
	public String getDaumNewsCollectModuleWriter() {
		return daumNewsCollectModuleWriter;
	}
	public void setDaumNewsCollectModuleWriter(String daumNewsCollectModuleWriter) {
		this.daumNewsCollectModuleWriter = daumNewsCollectModuleWriter;
	}
	public String getDaumNewsCollectModuleDate() {
		return daumNewsCollectModuleDate;
	}
	public void setDaumNewsCollectModuleDate(String daumNewsCollectModuleDate) {
		this.daumNewsCollectModuleDate = daumNewsCollectModuleDate;
	}
	public String getDaumNewsCollectModuleModifyDate() {
		return daumNewsCollectModuleModifyDate;
	}
	public void setDaumNewsCollectModuleModifyDate(String daumNewsCollectModuleModifyDate) {
		this.daumNewsCollectModuleModifyDate = daumNewsCollectModuleModifyDate;
	}
	
	

}
