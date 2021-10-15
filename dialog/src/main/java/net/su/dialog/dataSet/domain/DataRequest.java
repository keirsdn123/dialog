package net.su.dialog.dataSet.domain;

import net.su.dialog.main.domain.PagingVo;

public class DataRequest extends PagingVo{
	
	private int daumNewsDataCollectRequestCode;
	private String daumNewsRequestCollectWord;	//다음 뉴스 수집 단어
	private String daumNewsRequestCollectStartDate;	//다음 뉴스 수집 시작 일시
	private String daumNewsRequestCollectEndDate;	//다음 뉴스 수집 종료 일시
	private String daumNewsRequestCollectStatus;	//다음 뉴스 수집 현재 상태
	private String daumNewsRequestCollectDate;	//다음 뉴스 수집 요청 날짜
	private String daumNewsRequestCollectPeriod; //수집 기간(시작 + 종료 일시)
	private String daumNewsRequestCollectRemarks;	//다음 뉴스 비고란
	
	private int actDataCollectRequestCode;	//기타 수집 요청seq
	private String actRequestCollectSiteUrl;	//기타 사이트 URL
	private String actRequestCollectSiteName;	//기타 사이트 명
	private String actRequestCollectDescription;	//기타 사이트 상세설명
	private String actRequestCollectStatus;	//기타 수집 상태
	private String actRequestCollectDate;	//기타 수집 요청 날짜
	private int memberCode;	//회원 코드
	private String memberId;	//회원 id
	private String rejectReason;	//승인 거부 사유
	
	private String datasetName;	//데이터셋명
	private int dataCode;	//데이터셋 seq
	private int dataExportRequestCode;	//데이터 반출 요청 seq
	private String exportCollectWord;	//반출 요청 수집 단어
	private String exportCollectStartDate;	//반출 요청 수집 시작 일시
	private String exportCollectEndDate;	//반출 요청 수집 종료 일시
	private String exportCollectDate;	//반출 요청 수집 요청 날짜
	private String exportCollectStatus;	//반출 요청 수집 상태
	private String exportCollectRemarks;	//반출 요청 비고란
	
	private int daumSort;	//다음 검색 정렬
	private int actSort;	//기타 검색 정렬
	private int rssSort;	//rss 검색 정렬
	private int shopSort;	//쇼핑 검색 정렬
	
	private String daumSearchWrd;	//다음 검색어
	private String actSearchWrd;	//기타 검색어
	private String rssSearchWrd;	//rss 검색어
	private String shopSearchWrd;	//쇼핑 검색어
	private int dataExportManagementCode; //데이터 반출 관리 요청 seq
	private int tabType;	//수집 요청 탭 타입
	
	//재훈 추가
	private int devSourceCode; //개발 소스 seq
	private String devSourceTitle; //개발 소스 제목
	private String devSourcefileRoute; //개발 소스 파일 경로
	private int scheduleCode;//스케줄 코드
	private String exportCollectType;
	
	
	public String getExportCollectType() {
		return exportCollectType;
	}

	public void setExportCollectType(String exportCollectType) {
		this.exportCollectType = exportCollectType;
	}

	public int getScheduleCode() {
		return scheduleCode;
	}

	public void setScheduleCode(int scheduleCode) {
		this.scheduleCode = scheduleCode;
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

	public String getDevSourcefileRoute() {
		return devSourcefileRoute;
	}

	public void setDevSourcefileRoute(String devSourcefileRoute) {
		this.devSourcefileRoute = devSourcefileRoute;
	}

	public String getExportCollectRemarks() {
		return exportCollectRemarks;
	}

	public void setExportCollectRemarks(String exportCollectRemarks) {
		this.exportCollectRemarks = exportCollectRemarks;
	}

	public String getDaumNewsRequestCollectRemarks() {
		return daumNewsRequestCollectRemarks;
	}

	public void setDaumNewsRequestCollectRemarks(String daumNewsRequestCollectRemarks) {
		this.daumNewsRequestCollectRemarks = daumNewsRequestCollectRemarks;
	}

	public int getTabType() {
		return tabType;
	}

	public void setTabType(int tabType) {
		this.tabType = tabType;
	}

	public int getDataExportManagementCode() {
		return dataExportManagementCode;
	}

	public void setDataExportManagementCode(int dataExportManagementCode) {
		this.dataExportManagementCode = dataExportManagementCode;
	}

	public int getDaumSort() {
		return daumSort;
	}

	public void setDaumSort(int daumSort) {
		this.daumSort = daumSort;
	}

	public int getActSort() {
		return actSort;
	}

	public void setActSort(int actSort) {
		this.actSort = actSort;
	}

	public int getRssSort() {
		return rssSort;
	}

	public void setRssSort(int rssSort) {
		this.rssSort = rssSort;
	}

	public int getShopSort() {
		return shopSort;
	}

	public void setShopSort(int shopSort) {
		this.shopSort = shopSort;
	}

	public String getDaumSearchWrd() {
		return daumSearchWrd;
	}

	public void setDaumSearchWrd(String daumSearchWrd) {
		this.daumSearchWrd = daumSearchWrd;
	}

	public String getActSearchWrd() {
		return actSearchWrd;
	}

	public void setActSearchWrd(String actSearchWrd) {
		this.actSearchWrd = actSearchWrd;
	}

	public String getRssSearchWrd() {
		return rssSearchWrd;
	}

	public void setRssSearchWrd(String rssSearchWrd) {
		this.rssSearchWrd = rssSearchWrd;
	}

	public String getShopSearchWrd() {
		return shopSearchWrd;
	}

	public void setShopSearchWrd(String shopSearchWrd) {
		this.shopSearchWrd = shopSearchWrd;
	}

	public String getDatasetName() {
		return datasetName;
	}

	public void setDatasetName(String datasetName) {
		this.datasetName = datasetName;
	}

	public String getRejectReason() {
		return rejectReason;
	}

	public void setRejectReason(String rejectReason) {
		this.rejectReason = rejectReason;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getDataCode() {
		return dataCode;
	}

	public void setDataCode(int dataCode) {
		this.dataCode = dataCode;
	}

	public int getDataExportRequestCode() {
		return dataExportRequestCode;
	}

	public void setDataExportRequestCode(int dataExportRequestCode) {
		this.dataExportRequestCode = dataExportRequestCode;
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

	public String getExportCollectDate() {
		return exportCollectDate;
	}

	public void setExportCollectDate(String exportCollectDate) {
		this.exportCollectDate = exportCollectDate;
	}

	public String getExportCollectStatus() {
		return exportCollectStatus;
	}

	public void setExportCollectStatus(String exportCollectStatus) {
		this.exportCollectStatus = exportCollectStatus;
	}

	public int getDaumNewsDataCollectRequestCode() {
		return daumNewsDataCollectRequestCode;
	}

	public void setDaumNewsDataCollectRequestCode(int daumNewsDataCollectRequestCode) {
		this.daumNewsDataCollectRequestCode = daumNewsDataCollectRequestCode;
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

	public String getDaumNewsRequestCollectStatus() {
		return daumNewsRequestCollectStatus;
	}

	public void setDaumNewsRequestCollectStatus(String daumNewsRequestCollectStatus) {
		this.daumNewsRequestCollectStatus = daumNewsRequestCollectStatus;
	}

	public String getDaumNewsRequestCollectDate() {
		return daumNewsRequestCollectDate;
	}

	public void setDaumNewsRequestCollectDate(String daumNewsRequestCollectDate) {
		this.daumNewsRequestCollectDate = daumNewsRequestCollectDate;
	}

	public String getDaumNewsRequestCollectPeriod() {
		return daumNewsRequestCollectPeriod;
	}

	public void setDaumNewsRequestCollectPeriod(String daumNewsRequestCollectPeriod) {
		this.daumNewsRequestCollectPeriod = daumNewsRequestCollectPeriod;
	}

	public int getActDataCollectRequestCode() {
		return actDataCollectRequestCode;
	}

	public void setActDataCollectRequestCode(int actDataCollectRequestCode) {
		this.actDataCollectRequestCode = actDataCollectRequestCode;
	}

	public String getActRequestCollectSiteUrl() {
		return actRequestCollectSiteUrl;
	}

	public void setActRequestCollectSiteUrl(String actRequestCollectSiteUrl) {
		this.actRequestCollectSiteUrl = actRequestCollectSiteUrl;
	}

	public String getActRequestCollectSiteName() {
		return actRequestCollectSiteName;
	}

	public void setActRequestCollectSiteName(String actRequestCollectSiteName) {
		this.actRequestCollectSiteName = actRequestCollectSiteName;
	}

	public String getActRequestCollectDescription() {
		return actRequestCollectDescription;
	}

	public void setActRequestCollectDescription(String actRequestCollectDescription) {
		this.actRequestCollectDescription = actRequestCollectDescription;
	}

	public String getActRequestCollectStatus() {
		return actRequestCollectStatus;
	}

	public void setActRequestCollectStatus(String actRequestCollectStatus) {
		this.actRequestCollectStatus = actRequestCollectStatus;
	}

	public String getActRequestCollectDate() {
		return actRequestCollectDate;
	}

	public void setActRequestCollectDate(String actRequestCollectDate) {
		this.actRequestCollectDate = actRequestCollectDate;
	}

	public int getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}
}