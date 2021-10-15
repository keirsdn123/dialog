package net.su.dialog.schedule.domain;

import net.su.dialog.main.domain.PagingVo;

public class SchVo extends PagingVo{
	
	private int scheCode;	//스케줄 코드
	private String scheWorkTitle;	//스케줄 작업명
	private String scheWorkCycle;	//스케줄 작업주기
	private String scheStatusCode;	//스케줄 상태코드
	private String scheType;	//스케줄 타입 
	private String retryCount;	//재시도횟수
	private String scheDate;	//스케줄 등록일
	private String scheWriter; //스케줄 등록자 
	private String scheCron;	//스케줄 표현식
	private int scheOverlap;	//스케줄 중복검사
	
	private String daumSchedulerPath; //스케줄러 절대경로 (다음뉴스) 
	
	private String exportFileTitle;
	private String exportFileRoute;
	private String exportExtension;
	private String devSourceFileTitle;
	private String logSeq;
	
	
	
	
	public String getLogSeq() {
		return logSeq;
	}
	public void setLogSeq(String logSeq) {
		this.logSeq = logSeq;
	}
	public String getDevSourceFileTitle() {
		return devSourceFileTitle;
	}
	public void setDevSourceFileTitle(String devSourceFileTitle) {
		this.devSourceFileTitle = devSourceFileTitle;
	}
	public String getExportExtension() {
		return exportExtension;
	}
	public void setExportExtension(String exportExtension) {
		this.exportExtension = exportExtension;
	}
	public String getExportFileTitle() {
		return exportFileTitle;
	}
	public void setExportFileTitle(String exportFileTitle) {
		this.exportFileTitle = exportFileTitle;
	}
	public String getExportFileRoute() {
		return exportFileRoute;
	}
	public void setExportFileRoute(String exportFileRoute) {
		this.exportFileRoute = exportFileRoute;
	}
	public String getDaumSchedulerPath() {
		return daumSchedulerPath;
	}
	public void setDaumSchedulerPath(String daumSchedulerPath) {
		this.daumSchedulerPath = daumSchedulerPath;
	}
	public int getScheOverlap() {
		return scheOverlap;
	}
	public void setScheOverlap(int scheOverlap) {
		this.scheOverlap = scheOverlap;
	}
	public int getScheCode() {
		return scheCode;
	}
	public void setScheCode(int scheCode) {
		this.scheCode = scheCode;
	}
	public String getScheWorkTitle() {
		return scheWorkTitle;
	}
	public void setScheWorkTitle(String scheWorkTitle) {
		this.scheWorkTitle = scheWorkTitle;
	}
	public String getScheWorkCycle() {
		return scheWorkCycle;
	}
	public void setScheWorkCycle(String scheWorkCycle) {
		this.scheWorkCycle = scheWorkCycle;
	}
	public String getScheStatusCode() {
		return scheStatusCode;
	}
	public void setScheStatusCode(String scheStatusCode) {
		this.scheStatusCode = scheStatusCode;
	}
	public String getScheType() {
		return scheType;
	}
	public void setScheType(String scheType) {
		this.scheType = scheType;
	}
	public String getRetryCount() {
		return retryCount;
	}
	public void setRetryCount(String retryCount) {
		this.retryCount = retryCount;
	}
	public String getScheDate() {
		return scheDate;
	}
	public void setScheDate(String scheDate) {
		this.scheDate = scheDate;
	}
	public String getScheWriter() {
		return scheWriter;
	}
	public void setScheWriter(String scheWriter) {
		this.scheWriter = scheWriter;
	}
	public String getScheCron() {
		return scheCron;
	}
	public void setScheCron(String scheCron) {
		this.scheCron = scheCron;
	}
	
	

	
	
}
