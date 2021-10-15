package net.su.dialog.management.domain;

public class CateManage {
	
	private int cateCode; // 카테고리seq
	private String cateTitle; // 카테고리명
	private String cateRoot; // 카테고리관계
	private int cateCount; // 카테고리별 데이터셋 갯수
	private int cateType; //카테고리 타입
	private int countChild; //하위카테고리갯수
	private int memberCode;
	
	public int getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}
	public int getCountChild() {
		return countChild;
	}
	public void setCountChild(int countChild) {
		this.countChild = countChild;
	}
	public int getCateType() {
		return cateType;
	}
	public void setCateType(int cateType) {
		this.cateType = cateType;
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
	public int getCateCount() {
		return cateCount;
	}
	public void setCateCount(int cateCount) {
		this.cateCount = cateCount;
	}
	
}
