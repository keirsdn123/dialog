package net.su.dialog.dataSet.domain;

public class Menulist {

	private int menuCode; //메뉴 코드
	private String menuTitle; // 메뉴명
	private String menuUrl; // 메뉴 url
	private int menuIndex; // 메뉴 index
	private int menuRoot; // 메뉴 root
	private int menuLevel; // 메뉴 뎁스
	private int memberRatingCode; 
	private String menuUse;
	
	
	
	


	public String getMenuUse() {
		return menuUse;
	}
	public void setMenuUse(String menuUse) {
		this.menuUse = menuUse;
	}
	public int getMemberRatingCode() {
		return memberRatingCode;
	}
	public void setMemberRatingCode(int memberRatingCode) {
		this.memberRatingCode = memberRatingCode;
	}
	public int getMenuRoot() {
		return menuRoot;
	}
	public void setMenuRoot(int menuRoot) {
		this.menuRoot = menuRoot;
	}
	public int getMenuCode() {
		return menuCode;
	}
	public void setMenuCode(int menuCode) {
		this.menuCode = menuCode;
	}
	public String getMenuTitle() {
		return menuTitle;
	}
	public void setMenuTitle(String menuTitle) {
		this.menuTitle = menuTitle;
	}
	public String getMenuUrl() {
		return menuUrl;
	}
	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}
	public int getMenuIndex() {
		return menuIndex;
	}
	public void setMenuIndex(int menuIndex) {
		this.menuIndex = menuIndex;
	}
	
	public int getMenuLevel() {
		return menuLevel;
	}
	public void setMenuLevel(int menuLevel) {
		this.menuLevel = menuLevel;
	}

}
