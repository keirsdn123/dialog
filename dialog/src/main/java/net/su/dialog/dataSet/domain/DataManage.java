package net.su.dialog.dataSet.domain;

import net.su.dialog.main.domain.PagingVo;

public class DataManage {

	private int cateCode; // 카테고리seq
	private String cateTitle; // 카테고리명
	private String cateRoot; // 카테고리관계
	private int cateCount; //카테고리 별 데이터셋 갯수
	
	private int dataCode;  // 데이터셋seq
	private String dataName; //데이터셋명
	private String dataType; //데이터셋 타입
	private String dataEnrollmentName; //데이터셋 등록자
	private String dataEnrollmentDate; //데이터셋 등록일

	private String normalDataTableTitle;
	private String normalDataStandardTableTitle; // 데이터셋일시

	private int regularDataCode;
	private String regularDataTableTitle;
	private String regularDataTableLoot; // 데이터셋정기
	
	private int selected; // 검색조건
	private String searchWrd; //검색어
	
	private int recodeCount; //raw데이터 행 수
	private int recodeStandardCount; // 표준데이터 행 수
	private int limit;
	private int standardLimit;
	
	private String processingWhether; //db화여부
	private String vizWhether; //시각화여부
	
	//  표준데이터정보
	private int pauseStandarSeq;	//시각화 코드
	private String pauseStandarColumn1;
	private String pauseStandarColumn1Lable;
	private String pauseStandarColumn2;
	private String pauseStandarColumn2Lable;
	private String pauseStandarColumn3;
	private String pauseStandarColumn3Lable;
	private String pauseStandarColumn4;
	private String pauseStandarColumn4Lable;
	private String pauseStandarColumn5;
	private String pauseStandarColumn5Lable;
	private String pauseStandarColumn6;
	private String pauseStandarColumn7;
	private String pauseStandarColumn8;
	private String pauseStandarColumn9;
	private String pauseStandarColumn10;

	// 표준데이터 상세 - 생성DB
	private int pauseStandarDetailSeq;
	private double pauseStandarColumn1d;
	private double pauseStandarColumn2d;
	private double pauseStandarColumn3d;
	private double pauseStandarColumn4d;
	private double pauseStandarColumn5d;
	private String pauseStandarColumn6d;
	private String pauseStandarColumn7d;
	private String pauseStandarColumn8d;
	private String pauseStandarColumn9d;
	private String pauseStandarColumn10d;
	
	private int currentPage1;
	private int perPage1;
	private int currentPage2;
	private int perPage2;
	
	public int getCurrentPage2() {
		return currentPage2;
	}

	public void setCurrentPage2(int currentPage2) {
		this.currentPage2 = currentPage2;
	}

	public int getPerPage2() {
		return perPage2;
	}

	public void setPerPage2(int perPage2) {
		this.perPage2 = perPage2;
	}

	public int getCurrentPage1() {
		return currentPage1;
	}

	public void setCurrentPage1(int currentPage1) {
		this.currentPage1 = currentPage1;
	}

	public int getPerPage1() {
		return perPage1;
	}

	public void setPerPage1(int perPage1) {
		this.perPage1 = perPage1;
	}
	
	public int getPauseStandarSeq() {
		return pauseStandarSeq;
	}

	public void setPauseStandarSeq(int pauseStandarSeq) {
		this.pauseStandarSeq = pauseStandarSeq;
	}

	public String getPauseStandarColumn1() {
		return pauseStandarColumn1;
	}

	public void setPauseStandarColumn1(String pauseStandarColumn1) {
		this.pauseStandarColumn1 = pauseStandarColumn1;
	}

	public String getPauseStandarColumn1Lable() {
		return pauseStandarColumn1Lable;
	}

	public void setPauseStandarColumn1Lable(String pauseStandarColumn1Lable) {
		this.pauseStandarColumn1Lable = pauseStandarColumn1Lable;
	}

	public String getPauseStandarColumn2() {
		return pauseStandarColumn2;
	}

	public void setPauseStandarColumn2(String pauseStandarColumn2) {
		this.pauseStandarColumn2 = pauseStandarColumn2;
	}

	public String getPauseStandarColumn2Lable() {
		return pauseStandarColumn2Lable;
	}

	public void setPauseStandarColumn2Lable(String pauseStandarColumn2Lable) {
		this.pauseStandarColumn2Lable = pauseStandarColumn2Lable;
	}

	public String getPauseStandarColumn3() {
		return pauseStandarColumn3;
	}

	public void setPauseStandarColumn3(String pauseStandarColumn3) {
		this.pauseStandarColumn3 = pauseStandarColumn3;
	}

	public String getPauseStandarColumn3Lable() {
		return pauseStandarColumn3Lable;
	}

	public void setPauseStandarColumn3Lable(String pauseStandarColumn3Lable) {
		this.pauseStandarColumn3Lable = pauseStandarColumn3Lable;
	}

	public String getPauseStandarColumn4() {
		return pauseStandarColumn4;
	}

	public void setPauseStandarColumn4(String pauseStandarColumn4) {
		this.pauseStandarColumn4 = pauseStandarColumn4;
	}

	public String getPauseStandarColumn4Lable() {
		return pauseStandarColumn4Lable;
	}

	public void setPauseStandarColumn4Lable(String pauseStandarColumn4Lable) {
		this.pauseStandarColumn4Lable = pauseStandarColumn4Lable;
	}

	public String getPauseStandarColumn5() {
		return pauseStandarColumn5;
	}

	public void setPauseStandarColumn5(String pauseStandarColumn5) {
		this.pauseStandarColumn5 = pauseStandarColumn5;
	}

	public String getPauseStandarColumn5Lable() {
		return pauseStandarColumn5Lable;
	}

	public void setPauseStandarColumn5Lable(String pauseStandarColumn5Lable) {
		this.pauseStandarColumn5Lable = pauseStandarColumn5Lable;
	}

	public String getPauseStandarColumn6() {
		return pauseStandarColumn6;
	}

	public void setPauseStandarColumn6(String pauseStandarColumn6) {
		this.pauseStandarColumn6 = pauseStandarColumn6;
	}

	public String getPauseStandarColumn7() {
		return pauseStandarColumn7;
	}

	public void setPauseStandarColumn7(String pauseStandarColumn7) {
		this.pauseStandarColumn7 = pauseStandarColumn7;
	}

	public String getPauseStandarColumn8() {
		return pauseStandarColumn8;
	}

	public void setPauseStandarColumn8(String pauseStandarColumn8) {
		this.pauseStandarColumn8 = pauseStandarColumn8;
	}

	public String getPauseStandarColumn9() {
		return pauseStandarColumn9;
	}

	public void setPauseStandarColumn9(String pauseStandarColumn9) {
		this.pauseStandarColumn9 = pauseStandarColumn9;
	}

	public String getPauseStandarColumn10() {
		return pauseStandarColumn10;
	}

	public void setPauseStandarColumn10(String pauseStandarColumn10) {
		this.pauseStandarColumn10 = pauseStandarColumn10;
	}

	public int getPauseStandarDetailSeq() {
		return pauseStandarDetailSeq;
	}

	public void setPauseStandarDetailSeq(int pauseStandarDetailSeq) {
		this.pauseStandarDetailSeq = pauseStandarDetailSeq;
	}

	public double getPauseStandarColumn1d() {
		return pauseStandarColumn1d;
	}

	public void setPauseStandarColumn1d(double pauseStandarColumn1d) {
		this.pauseStandarColumn1d = pauseStandarColumn1d;
	}

	public double getPauseStandarColumn2d() {
		return pauseStandarColumn2d;
	}

	public void setPauseStandarColumn2d(double pauseStandarColumn2d) {
		this.pauseStandarColumn2d = pauseStandarColumn2d;
	}

	public double getPauseStandarColumn3d() {
		return pauseStandarColumn3d;
	}

	public void setPauseStandarColumn3d(double pauseStandarColumn3d) {
		this.pauseStandarColumn3d = pauseStandarColumn3d;
	}

	public double getPauseStandarColumn4d() {
		return pauseStandarColumn4d;
	}

	public void setPauseStandarColumn4d(double pauseStandarColumn4d) {
		this.pauseStandarColumn4d = pauseStandarColumn4d;
	}

	public double getPauseStandarColumn5d() {
		return pauseStandarColumn5d;
	}

	public void setPauseStandarColumn5d(double pauseStandarColumn5d) {
		this.pauseStandarColumn5d = pauseStandarColumn5d;
	}

	public String getPauseStandarColumn6d() {
		return pauseStandarColumn6d;
	}

	public void setPauseStandarColumn6d(String pauseStandarColumn6d) {
		this.pauseStandarColumn6d = pauseStandarColumn6d;
	}

	public String getPauseStandarColumn7d() {
		return pauseStandarColumn7d;
	}

	public void setPauseStandarColumn7d(String pauseStandarColumn7d) {
		this.pauseStandarColumn7d = pauseStandarColumn7d;
	}

	public String getPauseStandarColumn8d() {
		return pauseStandarColumn8d;
	}

	public void setPauseStandarColumn8d(String pauseStandarColumn8d) {
		this.pauseStandarColumn8d = pauseStandarColumn8d;
	}

	public String getPauseStandarColumn9d() {
		return pauseStandarColumn9d;
	}

	public void setPauseStandarColumn9d(String pauseStandarColumn9d) {
		this.pauseStandarColumn9d = pauseStandarColumn9d;
	}

	public String getPauseStandarColumn10d() {
		return pauseStandarColumn10d;
	}

	public void setPauseStandarColumn10d(String pauseStandarColumn10d) {
		this.pauseStandarColumn10d = pauseStandarColumn10d;
	}

	public String getProcessingWhether() {
		return processingWhether;
	}

	public void setProcessingWhether(String processingWhether) {
		this.processingWhether = processingWhether;
	}

	public String getVizWhether() {
		return vizWhether;
	}

	public void setVizWhether(String vizWhether) {
		this.vizWhether = vizWhether;
	}

	public int getStandardLimit() {
		standardLimit = getRecodeStandardCount() - 100;
		return standardLimit;
	}

//	public void setStandardLimit(int standardLimit) {
//		this.standardLimit = standardLimit;
//	}

	public int getRecodeCount() {
		return recodeCount;
	}

	public void setRecodeCount(int recodeCount) {
		this.recodeCount = recodeCount;
	}
	
	public int getLimit() {
		limit = getRecodeCount() - 100;
		return limit;
	}

//	public void setLimit(int limit) {
//		this.limit = limit;
//	}

	public int getRecodeStandardCount() {
		return recodeStandardCount;
	}

	public void setRecodeStandardCount(int recodeStandardCount) {
		this.recodeStandardCount = recodeStandardCount;
	}

	public int getCateCount() {
		return cateCount;
	}

	public void setCateCount(int cateCount) {
		this.cateCount = cateCount;
	}

	public String getSearchWrd() {
		return searchWrd;
	}

	public void setSearchWrd(String searchWrd) {
		this.searchWrd = searchWrd;
	}

	public int getSelected() {
		return selected;
	}

	public void setSelected(int selected) {
		this.selected = selected;
	}

	public int getRegularDataCode() {
		return regularDataCode;
	}

	public void setRegularDataCode(int regularDataCode) {
		this.regularDataCode = regularDataCode;
	}

	public String getRegularDataTableTitle() {
		return regularDataTableTitle;
	}

	public void setRegularDataTableTitle(String regularDataTableTitle) {
		this.regularDataTableTitle = regularDataTableTitle;
	}

	public String getRegularDataTableLoot() {
		return regularDataTableLoot;
	}

	public void setRegularDataTableLoot(String regularDataTableLoot) {
		this.regularDataTableLoot = regularDataTableLoot;
	}

	public String getNormalDataStandardTableTitle() {
		return normalDataStandardTableTitle;
	}

	public void setNormalDataStandardTableTitle(String normalDataStandardTableTitle) {
		this.normalDataStandardTableTitle = normalDataStandardTableTitle;
	}

	public String getNormalDataTableTitle() {
		return normalDataTableTitle;
	}

	public void setNormalDataTableTitle(String normalDataTableTitle) {
		this.normalDataTableTitle = normalDataTableTitle;
	}

	public int getCateCode() {
		return cateCode;
	}

	public void setCateCode(int cateCode) {
		this.cateCode = cateCode;
	}

	public String getCateTitle() {
		return cateTitle;
	}

	public void setCateTitle(String cateTitle) {
		this.cateTitle = cateTitle;
	}

	public String getCateRoot() {
		return cateRoot;
	}

	public void setCateRoot(String cateRoot) {
		this.cateRoot = cateRoot;
	}

	public int getDataCode() {
		return dataCode;
	}

	public void setDataCode(int dataCode) {
		this.dataCode = dataCode;
	}

	public String getDataName() {
		return dataName;
	}

	public void setDataName(String dataName) {
		this.dataName = dataName;
	}

	public String getDataType() {
		return dataType;
	}

	public void setDataType(String dataType) {
		this.dataType = dataType;
	}

	public String getDataEnrollmentName() {
		return dataEnrollmentName;
	}

	public void setDataEnrollmentName(String dataEnrollmentName) {
		this.dataEnrollmentName = dataEnrollmentName;
	}

	public String getDataEnrollmentDate() {
		return dataEnrollmentDate;
	}

	public void setDataEnrollmentDate(String dataEnrollmentDate) {
		this.dataEnrollmentDate = dataEnrollmentDate;
	}

}
