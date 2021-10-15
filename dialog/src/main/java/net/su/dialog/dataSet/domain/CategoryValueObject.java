package net.su.dialog.dataSet.domain;

public class CategoryValueObject {

	private int categorySeq;
	private String categoryNme;
	private String lootSeq;	
	private int categoryList[];
	
	private int dataCode;
	private String datasetName;	
	private String typeNormalRegularly;
	private int reportCode;
	private int seCategorySeq;
	private int memberRatingCode;
	
	
	public int getMemberRatingCode() {
		return memberRatingCode;
	}
	public void setMemberRatingCode(int memberRatingCode) {
		this.memberRatingCode = memberRatingCode;
	}
	public int getSeCategorySeq() {
		return seCategorySeq;
	}
	public void setSeCategorySeq(int seCategorySeq) {
		this.seCategorySeq = seCategorySeq;
	}
	public int getReportCode() {
		return reportCode;
	}
	public void setReportCode(int reportCode) {
		this.reportCode = reportCode;
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
	public String getTypeNormalRegularly() {
		return typeNormalRegularly;
	}
	public void setTypeNormalRegularly(String typeNormalRegularly) {
		this.typeNormalRegularly = typeNormalRegularly;
	}
	
	
	
	public int[] getCategoryList() {
		return categoryList;
	}
	public void setCategoryList(int[] categoryList) {
		this.categoryList = categoryList;
	}
	public String getLootSeq() {
		return lootSeq;
	}
	public void setLootSeq(String lootSeq) {
		this.lootSeq = lootSeq;
	}
	public int getCategorySeq() {
		return categorySeq;
	}
	public void setCategorySeq(int categorySeq) {
		this.categorySeq = categorySeq;
	}
	public String getCategoryNme() {
		return categoryNme;
	}
	public void setCategoryNme(String categoryNme) {
		this.categoryNme = categoryNme;
	}
	
}
