package net.su.dialog.schedule.domain;

public class DataCollectionVo {
	private int scheCode;	//스케줄 코드
	private int devSourceCode; //개발소스파일 정형적모듈 코드
	private String daumNewsRequestCollectWord;	//다음 뉴스 수집 단어
	private String daumNewsRequestCollectStartDate;	//다음 뉴스 수집 시작 일시
	private String daumNewsRequestCollectEndDate;	//다음 뉴스 수집 종료 일시
	private int daumNewsDataCollectRequestCode;	//다음 뉴스 수집 seq
	
	
	public int getDevSourceCode() {
		return devSourceCode;
	}
	public void setDevSourceCode(int devSourceCode) {
		this.devSourceCode = devSourceCode;
	}
	public int getDaumNewsDataCollectRequestCode() {
		return daumNewsDataCollectRequestCode;
	}
	public void setDaumNewsDataCollectRequestCode(int daumNewsDataCollectRequestCode) {
		this.daumNewsDataCollectRequestCode = daumNewsDataCollectRequestCode;
	}
	public int getScheCode() {
		return scheCode;
	}
	public void setScheCode(int scheCode) {
		this.scheCode = scheCode;
	}
	public String getDaumNewsRequestCollectWord() {
		return daumNewsRequestCollectWord;
	}
	public void setDaumNewsRequestCollectWord(String daumNewsRequestCollectWord) {
		this.daumNewsRequestCollectWord = daumNewsRequestCollectWord;
	}
	public String getDaumNewsRequestCollectStartDate() {
		return daumNewsRequestCollectStartDate;
	}
	public void setDaumNewsRequestCollectStartDate(String daumNewsRequestCollectStartDate) {
		this.daumNewsRequestCollectStartDate = daumNewsRequestCollectStartDate;
	}
	public String getDaumNewsRequestCollectEndDate() {
		return daumNewsRequestCollectEndDate;
	}
	public void setDaumNewsRequestCollectEndDate(String daumNewsRequestCollectEndDate) {
		this.daumNewsRequestCollectEndDate = daumNewsRequestCollectEndDate;
	}
	
	
}
