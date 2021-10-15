package net.su.dialog.dataSet.domain;

import java.util.List;

import net.su.dialog.main.domain.PagingVo;

public class Dataset extends PagingVo {
	//데이터 셋 리스트tb 
	private int dataCode; //데이터 셋 코드
	private String datasetName; // 데이터 명
	private String datasetInfo; // 데이터 정보(설명)
	private String datasetFrom; // 데이터 출처
	private String typeNormalRegularly; // 데이터 타입(구분)
	private String dataEnrollDate; // 데이터 등록일
	private String dataEnrollName; // 데이터 등록자
	private String dataModDate; // 데이터 수정일
	private String dataModName; // 데이터 수정자
	private String vizWhether; // 시각화 여부
	private String dataUseWhether; // 데이터 사용여부
	private String processingWhether; // 데이터 가공여부
	private int datasetViews;

   private String memberName;
   private String memberId;
   private int memberRatingCode; // 데이터 권한등급
   private int memberCode; // 회원코드
   
   //데이터 셋 일시tb
   private String normalDataTableTitle; // 일시 테이블 명
   private String normalDataSum; // 데이터 요약
   private String normalDataStandardTableTitle; //일시 표준 테이블 명
   private String status; // 상태(시각화 요청)
   
   //데이터셋 파일tb
   private int fileSeq; // 파일 seq
   private String fileTitle; //파일 이름
   private String fileOriginalTitle;//오리지날파일이름
   private String fileExtension;//파일 유형
   private String fileRoute; //파일 경로
   private long fileSize; // 파일 크기

   //카테고리 
   private int cateCode1;
   private int cateCode2;
   private int cateList[];
   private int cateCode;
   private List<Integer> cateList2;
   
   private int vizSort;   //시각화 검색 정렬
   private String vizSearchWrd;   //시각화 검색어
   
   //데이터 셋 검색
   private String dataSetSearchWrd;
   private String dataSetSearchType;
   
   
   private String devSourceType;   //개발 소스 타입
   private String devSourceTitle;   //개발 소스 제목
   private String devSourceEnrollmentDate;   //개발 소스 등록일
   private int devSourceCode;   //개발 소스 seq
   private String regularDataTableTitle;   //정기 데이터 테이블 명
   private String regularDataStandardTableTitle;   //정기 데이터 표준 테이블 명
   private int categorySeq; // 카테고리 seq

   //데이터셋 검색(보고서 팝업)
   private String dataSearchWrd;
   private int dataSort;
   
   //연관데이터셋
   private int reportCode;
   private int compareCode;
   
	//스케줄 
	private int scheCode;	//스케줄 SEQ
	private String dataSetType; //정기데이터 타입
	
	

	public String getDataSetType() {
		return dataSetType;
	}

	public void setDataSetType(String dataSetType) {
		this.dataSetType = dataSetType;
	}

	public int getDataCode() {
		return dataCode;
	}

	public void setDataCode(int dataCode) {
		this.dataCode = dataCode;
	}

	public String getDatasetName() {
		return datasetName;
	}

	public void setDatasetName(String datasetName) {
		this.datasetName = datasetName;
	}

	public String getDatasetInfo() {
		return datasetInfo;
	}

	public void setDatasetInfo(String datasetInfo) {
		this.datasetInfo = datasetInfo;
	}

	public String getDatasetFrom() {
		return datasetFrom;
	}

	public void setDatasetFrom(String datasetFrom) {
		this.datasetFrom = datasetFrom;
	}

	public String getTypeNormalRegularly() {
		return typeNormalRegularly;
	}

	public void setTypeNormalRegularly(String typeNormalRegularly) {
		this.typeNormalRegularly = typeNormalRegularly;
	}

	public String getDataEnrollDate() {
		return dataEnrollDate;
	}

	public void setDataEnrollDate(String dataEnrollDate) {
		this.dataEnrollDate = dataEnrollDate;
	}

	public String getDataEnrollName() {
		return dataEnrollName;
	}

	public void setDataEnrollName(String dataEnrollName) {
		this.dataEnrollName = dataEnrollName;
	}

	public String getDataModDate() {
		return dataModDate;
	}

	public void setDataModDate(String dataModDate) {
		this.dataModDate = dataModDate;
	}

	public String getDataModName() {
		return dataModName;
	}

	public void setDataModName(String dataModName) {
		this.dataModName = dataModName;
	}

	public String getVizWhether() {
		return vizWhether;
	}

	public void setVizWhether(String vizWhether) {
		this.vizWhether = vizWhether;
	}

	public String getDataUseWhether() {
		return dataUseWhether;
	}

	public void setDataUseWhether(String dataUseWhether) {
		this.dataUseWhether = dataUseWhether;
	}

	public String getProcessingWhether() {
		return processingWhether;
	}

	public void setProcessingWhether(String processingWhether) {
		this.processingWhether = processingWhether;
	}

	public int getDatasetViews() {
		return datasetViews;
	}

	public void setDatasetViews(int datasetViews) {
		this.datasetViews = datasetViews;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getMemberRatingCode() {
		return memberRatingCode;
	}

	public void setMemberRatingCode(int memberRatingCode) {
		this.memberRatingCode = memberRatingCode;
	}

	public int getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}

	public String getNormalDataTableTitle() {
		return normalDataTableTitle;
	}

	public void setNormalDataTableTitle(String normalDataTableTitle) {
		this.normalDataTableTitle = normalDataTableTitle;
	}

	public String getNormalDataSum() {
		return normalDataSum;
	}

	public void setNormalDataSum(String normalDataSum) {
		this.normalDataSum = normalDataSum;
	}

	public String getNormalDataStandardTableTitle() {
		return normalDataStandardTableTitle;
	}

	public void setNormalDataStandardTableTitle(String normalDataStandardTableTitle) {
		this.normalDataStandardTableTitle = normalDataStandardTableTitle;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getFileSeq() {
		return fileSeq;
	}

	public void setFileSeq(int fileSeq) {
		this.fileSeq = fileSeq;
	}

	public String getFileTitle() {
		return fileTitle;
	}

	public void setFileTitle(String fileTitle) {
		this.fileTitle = fileTitle;
	}

	public String getFileOriginalTitle() {
		return fileOriginalTitle;
	}

	public void setFileOriginalTitle(String fileOriginalTitle) {
		this.fileOriginalTitle = fileOriginalTitle;
	}

	public String getFileExtension() {
		return fileExtension;
	}

	public void setFileExtension(String fileExtension) {
		this.fileExtension = fileExtension;
	}

	public String getFileRoute() {
		return fileRoute;
	}

	public void setFileRoute(String fileRoute) {
		this.fileRoute = fileRoute;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public int getCateCode1() {
		return cateCode1;
	}

	public void setCateCode1(int cateCode1) {
		this.cateCode1 = cateCode1;
	}

	public int getCateCode2() {
		return cateCode2;
	}

	public void setCateCode2(int cateCode2) {
		this.cateCode2 = cateCode2;
	}

	public int[] getCateList() {
		return cateList;
	}

	public void setCateList(int[] cateList) {
		this.cateList = cateList;
	}

	public int getCateCode() {
		return cateCode;
	}

	public void setCateCode(int cateCode) {
		this.cateCode = cateCode;
	}

	public List<Integer> getCateList2() {
		return cateList2;
	}

	public void setCateList2(List<Integer> cateList2) {
		this.cateList2 = cateList2;
	}

	public int getVizSort() {
		return vizSort;
	}

	public void setVizSort(int vizSort) {
		this.vizSort = vizSort;
	}

	public String getVizSearchWrd() {
		return vizSearchWrd;
	}

	public void setVizSearchWrd(String vizSearchWrd) {
		this.vizSearchWrd = vizSearchWrd;
	}

	public String getDataSetSearchWrd() {
		return dataSetSearchWrd;
	}

	public void setDataSetSearchWrd(String dataSetSearchWrd) {
		this.dataSetSearchWrd = dataSetSearchWrd;
	}

	public String getDataSetSearchType() {
		return dataSetSearchType;
	}

	public void setDataSetSearchType(String dataSetSearchType) {
		this.dataSetSearchType = dataSetSearchType;
	}

	public String getDevSourceType() {
		return devSourceType;
	}

	public void setDevSourceType(String devSourceType) {
		this.devSourceType = devSourceType;
	}

	public String getDevSourceTitle() {
		return devSourceTitle;
	}

	public void setDevSourceTitle(String devSourceTitle) {
		this.devSourceTitle = devSourceTitle;
	}

	public String getDevSourceEnrollmentDate() {
		return devSourceEnrollmentDate;
	}

	public void setDevSourceEnrollmentDate(String devSourceEnrollmentDate) {
		this.devSourceEnrollmentDate = devSourceEnrollmentDate;
	}

	public int getDevSourceCode() {
		return devSourceCode;
	}

	public void setDevSourceCode(int devSourceCode) {
		this.devSourceCode = devSourceCode;
	}

	public String getRegularDataTableTitle() {
		return regularDataTableTitle;
	}

	public void setRegularDataTableTitle(String regularDataTableTitle) {
		this.regularDataTableTitle = regularDataTableTitle;
	}

	public String getRegularDataStandardTableTitle() {
		return regularDataStandardTableTitle;
	}

	public void setRegularDataStandardTableTitle(String regularDataStandardTableTitle) {
		this.regularDataStandardTableTitle = regularDataStandardTableTitle;
	}

	public int getCategorySeq() {
		return categorySeq;
	}

	public void setCategorySeq(int categorySeq) {
		this.categorySeq = categorySeq;
	}

	public String getDataSearchWrd() {
		return dataSearchWrd;
	}

	public void setDataSearchWrd(String dataSearchWrd) {
		this.dataSearchWrd = dataSearchWrd;
	}

	public int getDataSort() {
		return dataSort;
	}

	public void setDataSort(int dataSort) {
		this.dataSort = dataSort;
	}

	public int getReportCode() {
		return reportCode;
	}

	public void setReportCode(int reportCode) {
		this.reportCode = reportCode;
	}

	public int getCompareCode() {
		return compareCode;
	}

	public void setCompareCode(int compareCode) {
		this.compareCode = compareCode;
	}

	public int getScheCode() {
		return scheCode;
	}

	public void setScheCode(int scheCode) {
		this.scheCode = scheCode;
	}
   
   
   
  
	
	
}
