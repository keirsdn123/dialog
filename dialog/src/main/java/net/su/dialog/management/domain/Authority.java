package net.su.dialog.management.domain;

public class Authority {

	private int memberRatingCode;
	private String ratingName;
	private int menuCode;
	private String menuTitle;
	private String menuUse;
	
	

	public String getMenuUse() {
		return menuUse;
	}
	public void setMenuUse(String menuUse) {
		this.menuUse = menuUse;
	}
	public String getMenuTitle() {
		return menuTitle;
	}
	public void setMenuTitle(String menuTitle) {
		this.menuTitle = menuTitle;
	}
	public int getMenuCode() {
		return menuCode;
	}
	public void setMenuCode(int menuCode) {
		this.menuCode = menuCode;
	}
	public int getMemberRatingCode() {
		return memberRatingCode;
	}
	public void setMemberRatingCode(int memberRatingCode) {
		this.memberRatingCode = memberRatingCode;
	}
	public String getRatingName() {
		return ratingName;
	}
	public void setRatingName(String ratingName) {
		this.ratingName = ratingName;
	}
}
