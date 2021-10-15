package net.su.dialog.main.domain;

import java.util.List;

public class User extends PagingVo  {
	

	private String memberId;        //회원 아이디
	private String memberPassword;  //회원 비번
	private String memberName;      //회원 이름
	private String memberEmail1;    //회원가입용 이메일 1
	private String memberEmail2;    //회원가입용 이메일2
	private int memberCode;         //회원고유번호
	private String memberEmailAddress; //회원 이메일주소
	private int memberRatingCode;  //회원 권한 번호
	private int memberSeqList[];
	private String memberStatus;
	private String memberList[];

	private int messageSeq;        //회원 편지 번호
	private List<String> messageSeqs;        //회원 편지 번호
	private int recSeq;          // 받은이 번호
	private int senSeq;          // 보낸이 번호
	private String recId;		// 받은이 아이디
	private String senId;		// 보낸이 아이디
	private String mesContent;   // 쪽지내용
	private String mesDate;      // 등록 날짜
	private String recMesDeleteWhether;  // 받은이 삭제여부
	private String senMesDeleteWhether;  // 보낸이 삭제 여부
	private String messageViews;
	private String searchType; //검색 타입
	private String searchContent; //검색 내용
	
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchContent() {
		return searchContent;
	}
	public void setSearchContent(String searchContent) {
		this.searchContent = searchContent;
	}

	
	

	public int[] getMemberSeqList() {
		return memberSeqList;
	}
	public void setMemberSeqList(int[] memberSeqList) {
		this.memberSeqList = memberSeqList;
	}
	public String getMemberStatus() {
		return memberStatus;
	}
	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPassword() {
		return memberPassword;
	}
	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberEmail1() {
		return memberEmail1;
	}
	public void setMemberEmail1(String memberEmail1) {
		this.memberEmail1 = memberEmail1;
	}
	public String getMemberEmail2() {
		return memberEmail2;
	}
	public void setMemberEmail2(String memberEmail2) {
		this.memberEmail2 = memberEmail2;
	}
	public int getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}
	public String getMemberEmailAddress() {
		return memberEmailAddress;
	}
	public void setMemberEmailAddress(String memberEmailAddress) {
		this.memberEmailAddress = memberEmailAddress;
	}
	public int getMemberRatingCode() {
		return memberRatingCode;
	}
	public void setMemberRatingCode(int memberRatingCode) {
		this.memberRatingCode = memberRatingCode;
	}
	public int getMessageSeq() {
		return messageSeq;
	}
	public void setMessageSeq(int messageSeq) {
		this.messageSeq = messageSeq;
	}
	public int getRecSeq() {
		return recSeq;
	}
	public void setRecSeq(int recSeq) {
		this.recSeq = recSeq;
	}
	public int getSenSeq() {
		return senSeq;
	}
	public void setSenSeq(int senSeq) {
		this.senSeq = senSeq;
	}
	public String getMesContent() {
		return mesContent;
	}
	public void setMesContent(String mesContent) {
		this.mesContent = mesContent;
	}
	public String getMesDate() {
		return mesDate;
	}
	public void setMesDate(String mesDate) {
		this.mesDate = mesDate;
	}
	public String getRecMesDeleteWhether() {
		return recMesDeleteWhether;
	}
	public void setRecMesDeleteWhether(String recMesDeleteWhether) {
		this.recMesDeleteWhether = recMesDeleteWhether;
	}
	public String getSenMesDeleteWhether() {
		return senMesDeleteWhether;
	}
	public void setSenMesDeleteWhether(String senMesDeleteWhether) {
		this.senMesDeleteWhether = senMesDeleteWhether;
	}
	public String getRecId() {
		return recId;
	}
	public void setRecId(String recId) {
		this.recId = recId;
	}
	public String getSenId() {
		return senId;
	}
	public void setSenId(String senId) {
		this.senId = senId;
	}
	public List<String> getMessageSeqs() {
		return messageSeqs;
	}
	public void setMessageSeqs(List<String> messageSeqs) {
		this.messageSeqs = messageSeqs;
	}
	public String[] getMemberList() {
		return memberList;
	}
	public void setMemberList(String[] memberList) {
		this.memberList = memberList;
	}
	public String getMessageViews() {
		return messageViews;
	}
	public void setMessageViews(String messageViews) {
		this.messageViews = messageViews;
	}

}
