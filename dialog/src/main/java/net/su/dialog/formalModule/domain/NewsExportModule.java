package net.su.dialog.formalModule.domain;

public class NewsExportModule {
	
	private int dateExportRequestCode;	//데이터반출요청 코드
	private int dataCode;				//데이터 코드
	private int memberCode;				//회원코드
	private int scheCode;				//스케줄코드
	private int dataExportManagementCode;	//데이터반출관리코드
	private String exportCollectWord;	//반출단어
	private String exportCollectStartDate;	//반출 시작일
	private String exportCollectEndDate;	//반출 종료일
	private String exportCollectStatus;		//반출 상태 
	private String exportCollectDate;		//반출 등록날짜
	private String regularDataTableTitle;	//정기데이터 테이블
	
	
	public int getScheCode() {
		return scheCode;
	}
	public void setScheCode(int scheCode) {
		this.scheCode = scheCode;
	}
	public int getDataExportManagementCode() {
		return dataExportManagementCode;
	}
	public void setDataExportManagementCode(int dataExportManagementCode) {
		this.dataExportManagementCode = dataExportManagementCode;
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
	public int getDateExportRequestCode() {
		return dateExportRequestCode;
	}
	public void setDateExportRequestCode(int dateExportRequestCode) {
		this.dateExportRequestCode = dateExportRequestCode;
	}
	public int getDataCode() {
		return dataCode;
	}
	public void setDataCode(int dataCode) {
		this.dataCode = dataCode;
	}
	public String getExportCollectWord() {
		return exportCollectWord;
	}
	public void setExportCollectWord(String exportCollectWord) {
		this.exportCollectWord = exportCollectWord;
	}
	public String getExportCollectStartDate() {
		return exportCollectStartDate;
	}
	public void setExportCollectStartDate(String exportCollectStartDate) {
		this.exportCollectStartDate = exportCollectStartDate;
	}
	public String getExportCollectEndDate() {
		return exportCollectEndDate;
	}
	public void setExportCollectEndDate(String exportCollectEndDate) {
		this.exportCollectEndDate = exportCollectEndDate;
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
	
	
	
}
