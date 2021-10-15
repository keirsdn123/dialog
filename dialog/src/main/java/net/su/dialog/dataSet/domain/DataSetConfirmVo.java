package net.su.dialog.dataSet.domain;

import java.util.List;

import net.su.dialog.main.domain.PagingVo;

public class DataSetConfirmVo extends PagingVo {

	//데이터셋 코드(번호)
	private int dataCode;
	//데이터셋 제목
	private String datasetName;
	//데이터셋 등록일
	private String dataEnrollDate;
	//등록자 아이디
	private String memberId;
	//데이터셋 등록자 이름
	private String dataEnrollName;
	//데이터셋 수정일
	private String dataModDate;
	//데이터셋 수정자 이름
	private String dataModName;
	//일시데이터 요약 설명
	private String datasetInfo;
	
	//데이터셋 조회수
	private int datasetViews;
	//데이터셋 출처
	private String datasetFrom;
	//데이터셋 파일 이름
	private String fileName;
	//데이터셋 파일 이름
	private String fileOriginalName;
	//데이터셋 파일 사이즈
	private long fileSize;
	//데이터셋 파일 경로
	private String filePath;
	//데이터셋 파일 유형 (xls, xlsx, csv 등)
	private String fileExtension;
	//데이터셋 시각화 요청 내용
	private String vizRequests;
	//시각화 요청 승인 상태
	private String status;
	//데이터셋 타입
	private String typeNormalRegular;
	//1차 카테고리 이름
	private String cateTitle1;
	//2차 카테고리 이름
	private String cateTitle2;
	
	//시각화 요청 데이터 선택한 칼럼 인덱스 번호 리스트
	private List<Integer> checkedColumnIndex;
	//시각화 요청 데이터 파일 칼럼 이름 리스트
	private List<String> fileColNameList;
	//시각화 요청 데이터 파일 칼럼 데이터 타입 리스트
	private List<String> fileColTypeList;
	//시각화 요청 데이터 파일 데이터 행별 리스트
	private List<List<String>> fileDataList;
	
	//시각화 파일 db화 테이블 이름
	private String normalDataTableTiltle;
	
	//일시 데이터 시각화 승인 요청 거부 사유
	private String rejectReason;
	
	
	
	
	
	public String getFileOriginalName() {
		return fileOriginalName;
	}
	public void setFileOriginalName(String fileOriginalName) {
		this.fileOriginalName = fileOriginalName;
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
	public String getDataEnrollDate() {
		return dataEnrollDate;
	}
	public void setDataEnrollDate(String dataEnrollDate) {
		this.dataEnrollDate = dataEnrollDate;
	}
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
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
	
	public String getDatasetInfo() {
		return datasetInfo;
	}
	public void setDatasetInfo(String datasetInfo) {
		this.datasetInfo = datasetInfo;
	}
	public int getDatasetViews() {
		return datasetViews;
	}
	public void setDatasetViews(int datasetViews) {
		this.datasetViews = datasetViews;
	}
	
	public String getDatasetFrom() {
		return datasetFrom;
	}
	public void setDatasetFrom(String datasetFrom) {
		this.datasetFrom = datasetFrom;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public String getVizRequests() {
		return vizRequests;
	}
	public void setVizRequests(String vizRequests) {
		this.vizRequests = vizRequests;
	}
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTypeNormalRegular() {
		return typeNormalRegular;
	}
	public void setTypeNormalRegular(String typeNormalRegular) {
		this.typeNormalRegular = typeNormalRegular;
	}
	
	public String getCateTitle1() {
		return cateTitle1;
	}
	public void setCateTitle1(String cateTitle1) {
		this.cateTitle1 = cateTitle1;
	}
	public String getCateTitle2() {
		return cateTitle2;
	}
	public void setCateTitle2(String cateTitle2) {
		this.cateTitle2 = cateTitle2;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	
	public String getFileExtension() {
		return fileExtension;
	}
	public void setFileExtension(String fileExtension) {
		this.fileExtension = fileExtension;
	}
	public List<Integer> getCheckedColumnIndex() {
		return checkedColumnIndex;
	}
	public void setCheckedColumnIndex(List<Integer> checkedColumnIndex) {
		this.checkedColumnIndex = checkedColumnIndex;
	}
	public List<String> getFileColNameList() {
		return fileColNameList;
	}
	public void setFileColNameList(List<String> fileColNameList) {
		this.fileColNameList = fileColNameList;
	}
	public List<String> getFileColTypeList() {
		return fileColTypeList;
	}
	public void setFileColTypeList(List<String> fileColTypeList) {
		this.fileColTypeList = fileColTypeList;
	}
	public List<List<String>> getFileDataList() {
		return fileDataList;
	}
	public void setFileDataList(List<List<String>> fileDataList) {
		this.fileDataList = fileDataList;
	}
	public String getNormalDataTableTiltle() {
		return normalDataTableTiltle;
	}
	public void setNormalDataTableTiltle(String normalDataTableTiltle) {
		this.normalDataTableTiltle = normalDataTableTiltle;
	}
	public String getRejectReason() {
		return rejectReason;
	}
	public void setRejectReason(String rejectReason) {
		this.rejectReason = rejectReason;
	}
	
	
	
	
	
}
