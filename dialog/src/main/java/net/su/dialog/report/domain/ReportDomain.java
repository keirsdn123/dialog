package net.su.dialog.report.domain;

import java.util.List;

import net.su.dialog.main.domain.PagingVo;

public class ReportDomain extends PagingVo {
	
	private int reportCode;
	private String reportTypeNormalPaper;
	private String reportTitle;
	private String reportContent;
	private int memberCode;
	private String reportType;
	private String reportEnrollDate;
	private String reportModDate;
	private String reportEnrollName;
	private int cateCode1;
	private int cateCode2;
	private int memberRatingCode;
	private String fileOriginalTitle;
	private String reportName;
	private String memberName;
	private String memberId;
	private String cateTitle;
	private String cateTitle2;
	private int cateCode;
	private String originFileTitle;
	private int reportDisplaySet;
	private int reportViews;
	private int reportSort;
	private String reportSearchWrd;
	
	//카테고리
	private int categorySeq;
	private String categoryNme;
	private String lootSeq;	
	private int categoryList[];
	
	//보고서 데이터셋
	private int reportDatasetSeq;
	private int dataCode;
	//보고서 파일
	private int reportFileSeq;
	private String fileTitle;
	private String fileRoute;
	private int cateList[];
	private String reportInfo;
	private String reportFrom;
	private String typeNormalRegularly;
	private int dataCodeList[];
	private List<Integer> checkCode;

	//연관보고서
	
	
	public String getMemberName() {
		return memberName;
	}
	public List<Integer> getCheckCode() {
		return checkCode;
	}
	public void setCheckCode(List<Integer> checkCode) {
		this.checkCode = checkCode;
	}
	public String getCateTitle2() {
		return cateTitle2;
	}
	public void setCateTitle2(String cateTitle2) {
		this.cateTitle2 = cateTitle2;
	}
	public int getReportSort() {
		return reportSort;
	}
	public void setReportSort(int reportSort) {
		this.reportSort = reportSort;
	}
	public String getReportSearchWrd() {
		return reportSearchWrd;
	}
	public void setReportSearchWrd(String reportSearchWrd) {
		this.reportSearchWrd = reportSearchWrd;
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
	public String getLootSeq() {
		return lootSeq;
	}
	public void setLootSeq(String lootSeq) {
		this.lootSeq = lootSeq;
	}
	public int[] getCategoryList() {
		return categoryList;
	}
	public void setCategoryList(int[] categoryList) {
		this.categoryList = categoryList;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getReportInfo() {
		return reportInfo;
	}
	public void setReportInfo(String reportInfo) {
		this.reportInfo = reportInfo;
	}
	public String getReportFrom() {
		return reportFrom;
	}
	public void setReportFrom(String reportFrom) {
		this.reportFrom = reportFrom;
	}
	public String getTypeNormalRegularly() {
		return typeNormalRegularly;
	}
	public void setTypeNormalRegularly(String typeNormalRegularly) {
		this.typeNormalRegularly = typeNormalRegularly;
	}
	public String getReportName() {
		return reportName;
	}
	public void setReportName(String reportName) {
		this.reportName = reportName;
	}
	public String getFileOriginalTitle() {
		return fileOriginalTitle;
	}
	public void setFileOriginalTitle(String fileOriginalTitle) {
		this.fileOriginalTitle = fileOriginalTitle;
	}
	public int[] getCateList() {
		return cateList;
	}
	public void setCateList(int[] cateList) {
		this.cateList = cateList;
	}
	public String getFileTitle() {
		return fileTitle;
	}
	public void setFileTitle(String fileTitle) {
		this.fileTitle = fileTitle;
	}
	public int getReportCode() {
		return reportCode;
	}
	public void setReportCode(int reportCode) {
		this.reportCode = reportCode;
	}
	public String getReportTypeNormalPaper() {
		return reportTypeNormalPaper;
	}
	public void setReportTypeNormalPaper(String reportTypeNormalPaper) {
		this.reportTypeNormalPaper = reportTypeNormalPaper;
	}
	public String getReportTitle() {
		return reportTitle;
	}
	public void setReportTitle(String reportTitle) {
		this.reportTitle = reportTitle;
	}
	public String getReportContent() {
		return reportContent;
	}
	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}
	public int getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}
	public String getReportType() {
		return reportType;
	}
	public void setReportType(String reportType) {
		this.reportType = reportType;
	}
	public String getReportEnrollDate() {
		return reportEnrollDate;
	}
	public void setReportEnrollDate(String reportEnrollDate) {
		this.reportEnrollDate = reportEnrollDate;
	}
	public String getReportModDate() {
		return reportModDate;
	}
	public void setReportModDate(String reportModDate) {
		this.reportModDate = reportModDate;
	}
	public String getReportEnrollName() {
		return reportEnrollName;
	}
	public void setReportEnrollName(String reportEnrollName) {
		this.reportEnrollName = reportEnrollName;
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
	public int getMemberRatingCode() {
		return memberRatingCode;
	}
	public void setMemberRatingCode(int memberRatingCode) {
		this.memberRatingCode = memberRatingCode;
	}
	public int getReportDatasetSeq() {
		return reportDatasetSeq;
	}
	public void setReportDatasetSeq(int reportDatasetSeq) {
		this.reportDatasetSeq = reportDatasetSeq;
	}
	public int getDataCode() {
		return dataCode;
	}
	public void setDataCode(int dataCode) {
		this.dataCode = dataCode;
	}
	public int getReportFileSeq() {
		return reportFileSeq;
	}
	public void setReportFileSeq(int reportFileSeq) {
		this.reportFileSeq = reportFileSeq;
	}	
	public String getFileRoute() {
		return fileRoute;
	}
	public void setFileRoute(String fileRoute) {
		this.fileRoute = fileRoute;
	}
	public int[] getDataCodeList() {
		return dataCodeList;
	}
	public void setDataCodeList(int[] dataCodeList) {
		this.dataCodeList = dataCodeList;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getCateTitle() {
		return cateTitle;
	}
	public void setCateTitle(String cateTitle) {
		this.cateTitle = cateTitle;
	}
	public int getCateCode() {
		return cateCode;
	}
	public void setCateCode(int cateCode) {
		this.cateCode = cateCode;
	}
	public String getOriginFileTitle() {
		return originFileTitle;
	}
	public void setOriginFileTitle(String originFileTitle) {
		this.originFileTitle = originFileTitle;
	}
	public int getReportDisplaySet() {
		return reportDisplaySet;
	}
	public void setReportDisplaySet(int reportDisplaySet) {
		this.reportDisplaySet = reportDisplaySet;
	}
	public int getReportViews() {
		return reportViews;
	}
	public void setReportViews(int reportViews) {
		this.reportViews = reportViews;
	}
	
	
	
}
