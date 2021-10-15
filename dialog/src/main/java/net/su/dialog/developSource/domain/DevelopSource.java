package net.su.dialog.developSource.domain;

import java.util.List;

import net.su.dialog.main.domain.PagingVo;

public class DevelopSource extends PagingVo{
	
	private int devSourceCode; //개발 소스 seq
	private String devSourceTitle; //개발 소스 제목
	private String devSourceExplanation; // 개발 소스 설명
	private String devSourceType; // 개발 소스 타입
	private String devSourceEnrollmentDate; // 개발 소스 등록일
	private String devSourceFileTitle; //개발 소스 파일명
	private String devSourceFileOrignalTitle; // 개발 소스 원본 파일명
	private String devSourcefileRoute; //개발 소스 파일 경로
	private String devSourceActStatus; //개발 소스 사용 유무
	private String scheCode; //스케줄 코드
	private String scheCron; //스케줄 크론 
	private String devSourceWriter; //개발 소스 작성자
	private String devSourceFileExtension;// 개발 소스 파일 확장자
	private int devSourceFileCode;//개발 소스 파일 seq
	private List<String> devSourceFileRoutes; //개발 소스 파일 경로
	private int devSourceRoot; // 개발 소스 root(수집 파일과 표준화 파일의 관계)
	
	
	
	//재훈추가
	private String devSourceFileClassName;
	private String devSourceFilePackageName;
	private String devSourceFileMethodName;
	private String devSourceFilePath;
	
	
	
	public String getDevSourceFilePath() {
		return devSourceFilePath;
	}
	public void setDevSourceFilePath(String devSourceFilePath) {
		this.devSourceFilePath = devSourceFilePath;
	}
	public String getDevSourceFileClassName() {
		return devSourceFileClassName;
	}
	public void setDevSourceFileClassName(String devSourceFileClassName) {
		this.devSourceFileClassName = devSourceFileClassName;
	}
	public String getDevSourceFilePackageName() {
		return devSourceFilePackageName;
	}
	public void setDevSourceFilePackageName(String devSourceFilePackageName) {
		this.devSourceFilePackageName = devSourceFilePackageName;
	}
	public String getDevSourceFileMethodName() {
		return devSourceFileMethodName;
	}
	public void setDevSourceFileMethodName(String devSourceFileMethodName) {
		this.devSourceFileMethodName = devSourceFileMethodName;
	}
	public String getScheCron() {
		return scheCron;
	}
	public void setScheCron(String scheCron) {
		this.scheCron = scheCron;
	}
	public int getDevSourceRoot() {
		return devSourceRoot;
	}
	public void setDevSourceRoot(int devSourceRoot) {
		this.devSourceRoot = devSourceRoot;
	}
	public List<String> getDevSourceFileRoutes() {
		return devSourceFileRoutes;
	}
	public void setDevSourceFileRoutes(List<String> devSourceFileRoutes) {
		this.devSourceFileRoutes = devSourceFileRoutes;
	}
	public int getDevSourceFileCode() {
		return devSourceFileCode;
	}
	public void setDevSourceFileCode(int devSourceFileCode) {
		this.devSourceFileCode = devSourceFileCode;
	}
	public String getDevSourceFileExtension() {
		return devSourceFileExtension;
	}
	public void setDevSourceFileExtension(String devSourceFileExtension) {
		this.devSourceFileExtension = devSourceFileExtension;
	}
	public int getDevSourceCode() {
		return devSourceCode;
	}
	public void setDevSourceCode(int devSourceCode) {
		this.devSourceCode = devSourceCode;
	}
	public String getDevSourceTitle() {
		return devSourceTitle;
	}
	public void setDevSourceTitle(String devSourceTitle) {
		this.devSourceTitle = devSourceTitle;
	}
	public String getDevSourceExplanation() {
		return devSourceExplanation;
	}
	public void setDevSourceExplanation(String devSourceExplanation) {
		this.devSourceExplanation = devSourceExplanation;
	}
	public String getDevSourceType() {
		return devSourceType;
	}
	public void setDevSourceType(String devSourceType) {
		this.devSourceType = devSourceType;
	}
	public String getDevSourceEnrollmentDate() {
		return devSourceEnrollmentDate;
	}
	public void setDevSourceEnrollmentDate(String devSourceEnrollmentDate) {
		this.devSourceEnrollmentDate = devSourceEnrollmentDate;
	}
	public String getDevSourceFileTitle() {
		return devSourceFileTitle;
	}
	public void setDevSourceFileTitle(String devSourceFileTitle) {
		this.devSourceFileTitle = devSourceFileTitle;
	}
	public String getDevSourceFileOrignalTitle() {
		return devSourceFileOrignalTitle;
	}
	public void setDevSourceFileOrignalTitle(String devSourceFileOrignalTitle) {
		this.devSourceFileOrignalTitle = devSourceFileOrignalTitle;
	}
	public String getDevSourcefileRoute() {
		return devSourcefileRoute;
	}
	public void setDevSourcefileRoute(String devSourcefileRoute) {
		this.devSourcefileRoute = devSourcefileRoute;
	}
	public String getDevSourceActStatus() {
		return devSourceActStatus;
	}
	public void setDevSourceActStatus(String devSourceActStatus) {
		this.devSourceActStatus = devSourceActStatus;
	}
	public String getScheCode() {
		return scheCode;
	}
	public void setScheCode(String scheCode) {
		this.scheCode = scheCode;
	}
	public String getDevSourceWriter() {
		return devSourceWriter;
	}
	public void setDevSourceWriter(String devSourceWriter) {
		this.devSourceWriter = devSourceWriter;
	}
}
