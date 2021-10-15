package net.su.dialog.dataSet.domain;

import java.util.List;

public class DataSetListViewVo {

	private int dataCode; 
	private String datasetName;
	private String dataEnrollDate;
	private String dataEnrollName;
	private String dataModDate;
	private String dataModName;
	private String normalDataSum;
	private String memberName;
	
	private int datasetViews;
	private String datasetFrom;
	private String fileName;
	private String fileOriginalName;
	private int fileSize;
	private String filePath;
	private String vizRequests;
	private String vizWhether;
	private String typeNormalRegular;	
	private String cateTitle;	
	private String datasetInfo;
	private List<Integer> checkedColumnIndex;
	private List<String> fileColNameList;
	private List<String> fileColTypeList;
	private List<List<String>> fileDataList;
	private String status;
	//1차 카테고리 이름
	private String cateTitle1;
	//2차 카테고리 이름
	private String cateTitle2;
	
	
	//규철이가함
	private int memberCode;
	private String memberId;
	
	
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
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
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public int getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getFileOriginalName() {
		return fileOriginalName;
	}
	public void setFileOriginalName(String fileOriginalName) {
		this.fileOriginalName = fileOriginalName;
	}
	public String getDatasetInfo() {
		return datasetInfo;
	}
	public void setDatasetInfo(String datasetInfo) {
		this.datasetInfo = datasetInfo;
	}
	public String getVizWhether() {
		return vizWhether;
	}
	public void setVizWhether(String vizWhether) {
		this.vizWhether = vizWhether;
	}
	public long getDataCode() {
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
	public String getNormalDataSum() {
		return normalDataSum;
	}
	public void setNormalDataSum(String normalDataSum) {
		this.normalDataSum = normalDataSum;
	}
	public int getDatasetViews() {
		return datasetViews;
	}
	public void setDatasetViews(int datasetViews) {
		this.datasetViews = datasetViews;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
	public String getVizRequests() {
		return vizRequests;
	}
	public void setVizRequests(String vizRequests) {
		this.vizRequests = vizRequests;
	}
	public String getTypeNormalRegular() {
		return typeNormalRegular;
	}
	public void setTypeNormalRegular(String typeNormalRegular) {
		this.typeNormalRegular = typeNormalRegular;
	}
	public String getCateTitle() {
		return cateTitle;
	}
	public void setCateTitle(String cateTitle) {
		this.cateTitle = cateTitle;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
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
	public String getDatasetFrom() {
		return datasetFrom;
	}
	public void setDatasetFrom(String datasetFrom) {
		this.datasetFrom = datasetFrom;
	}
	
	
	
	
	
}
