package net.su.dialog.main.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.su.dialog.dataSet.domain.CategoryValueObject;
import net.su.dialog.dataSet.domain.DataSetConfirmVo;
import net.su.dialog.dataSet.domain.Dataset;
import net.su.dialog.developSource.domain.DevelopSource;
import net.su.dialog.main.domain.Question;
import net.su.dialog.main.domain.User;
import net.su.dialog.main.service.MainService;
import net.su.dialog.management.domain.Authority;
import net.su.dialog.report.domain.ReportDomain;

//@ResponseBody 안써도됨
//Ajax만
@RestController
public class MainAjaxController {

	@Autowired
    private MainService mainService;
	
	//탑메뉴
	
	//회원 정보 가져오기
	@RequestMapping("/SelectMemberInfo")
	public User SelectMemberInfo(HttpSession session) throws Exception {
		return mainService.SelectMemberInfo(session);
	}	
	// 읽지 않은 쪽지함 행수 읽기
	@RequestMapping("/selectUnMessage")
	public int selectUnMessage(HttpSession session) throws Exception{
		int rowCount = mainService.selectUnMessage(session);
		return rowCount;
	}
	
	//회원가입
	
	
	//회원가입 아이디 중복검사
	@RequestMapping(value = "/selectMemIdCheck")
	public User selectMemIdCheck(User user) throws Exception{
		User selectMemIdCheck = mainService.selectMemIdCheck(user);
		return selectMemIdCheck;
	}


	// 로그인 아이디 비밀번호 체크
	@RequestMapping(value = "/selectLoginCheck")
	public User selectLoginCheck(User user) throws Exception{
		return mainService.selectLoginCheck(user);
	}
	// 회원가입 등록버튼
	@RequestMapping("/insertViewInfo")
	public void insertViewInfo(User user) {
		mainService.insertViewInfo(user);
	}
	
//  아이디 /비밀번호 찾기
	
	//회원 아이디 조회
	@RequestMapping("/selectId")
	public User selectId(User user) throws Exception{
		return mainService.selectId(user);
	}
	//회원 비밀번호 조회
	@RequestMapping("/selectPw")
	public User selectPw(User user) throws Exception{
		return mainService.selectPw(user);
	}
	//비밀번호 수정
	@RequestMapping("/updatePw")
	public User updatePw(User user) throws Exception{
		return mainService.updatePw(user);
	}
	
	//마이페이지 회원정보 수정
	@RequestMapping("/updateInfo")
	public void updateInfo(User user,HttpSession session) throws Exception{
		 mainService.updateInfo(user,session);
	}
	
	//사용자 쪽지
	
	
	//쪽지조회
	@RequestMapping("/selectMessageList")
	public List<User> selectMessageList(User user,HttpSession session) throws Exception{
		return mainService.selectMessageList(user,session);
	}
	//보낸 쪽지조회
	@RequestMapping("/selectGiveMessageList")
	public List<User> selectGiveMessageList(HttpSession session,User user) throws Exception{
		return mainService.selectGiveMessageList(user,session);

	}


	//쪽지 보내기 등록 버튼
	@RequestMapping("/insertMessage")
	public void insertMessage(User user,HttpSession session) throws Exception {
		
		mainService.insertMessage(user,session);
	}
	//쪽지 상세  조회
	@RequestMapping("/selectMessageInfo")
	public User selectMessageInfo(User user) throws Exception{
		return mainService.selectMessageInfo(user);
	}
	//받은 쪽지함 상제조회시 쪽지 조회수 증가
	@RequestMapping("/updateMessageViews")
	public void updateMessageViews(HttpSession session,User user) throws Exception {
		mainService.updateMessageViews(session,user);
	}
	
	//쪽지 상세 조회 삭제 
	@RequestMapping("/delMessage")
	public void delMessage(HttpServletRequest request,User user) throws Exception {
		HttpSession session = request.getSession();
		user.setMessageSeq((int) session.getAttribute("messageSeq"));
		mainService.delMessage(user);
	}
	//받은 쪽지함  삭제(체크박스) 
	@RequestMapping("/recMessageDel")
	public void recMessageDel(@RequestParam(value="messageSeqs") List<String> messageSeqs) throws Exception {
		      mainService.recMessageDel(messageSeqs);  		
	}
	//보낸 쪽지함  삭제(체크박스) 
	@RequestMapping("/senMessageDel")
	public void senMessageDel(@RequestParam(value="messageSeqs") List<String> messageSeqs) throws Exception {
		      mainService.senMessageDel(messageSeqs);  		
	}
	// 사용자 받은 쪽지함 페이징 행읽기
	@RequestMapping("/selectGivenMessageRow")
	public int selectGivenMessageRow(HttpSession session) throws Exception{
		int rowCount = mainService.selectGivenMessageRow(session);
		return rowCount;
	}
	// 사용자 보낸 쪽지함 페이징 행읽기
	@RequestMapping("/selectGiveMessageRow")
	public int selectGiveMessageRow(HttpSession session) throws Exception{
		int rowCount = mainService.selectGiveMessageRow(session);
		return rowCount;
	}
	// 받은 쪽지함 페이징
	@RequestMapping("/selectGivenMessagePaging")
	public List<User> selectGivenMessagePaging(User user,HttpSession session) throws Exception{
		return mainService.selectGivenMessagePaging(user,session);
	}
	// 보낸 쪽지함 페이징
	@RequestMapping("/selectGiveMessagePaging")
	public List<User> selectGiveMessagePaging(User user,HttpSession session) throws Exception{
		return mainService.selectGiveMessagePaging(user,session);
	}
	
	
	//관리자  쪽지
	//쪽지조회
	@RequestMapping("/selectMessageAdmin")
	public List<User> selectMessageAdmin(User user) throws Exception{
		return mainService.selectMessageAdmin(user);
	}
	
	//관리자 쪽지함  삭제(체크박스) 
	@RequestMapping("/adminMessageDel")
	public void adminMessageDel(@RequestParam(value="messageSeqs") List<String> messageSeqs) throws Exception {
		      mainService.adminMessageDel(messageSeqs);  		
	}	
	//관리자 쪽지 상세  조회
	@RequestMapping("/adminMessageInfoView")
	public User adminMessageInfoView(User user) throws Exception{
		return mainService.adminMessageInfoView(user);
	}
	//쪽지조회
	@RequestMapping("/selectMemberRating")
	public User selectMemberRating(HttpSession session) throws Exception{
		System.out.println("가나요");
		return mainService.selectMemberRating(session);
	}
	// 쪽지 등록시 1차 등급 조회 
	@RequestMapping("/selectMember")
	public List<Authority> selectMember() throws Exception{
		return mainService.selectMember();
	}
	//관리자 쪽지 등록시 2차 아이디 조회
	@RequestMapping(value="/getMemberList", method = {RequestMethod.GET, RequestMethod.POST})
	public List<User> getMemberList(@RequestParam int inputseq) throws Exception {
		return mainService.getMemberList(inputseq);
	}
	// 관리자 쪽지함 페이징 행읽기
	@RequestMapping("/selectAdminMessageRow")
	public int selectAdminMessageRow(User user) throws Exception{
		int rowCount = mainService.selectAdminMessageRow(user);
		return rowCount;
	}
	// 관리자 쪽지함 페이징
	@RequestMapping("/selectMessagePaging")
	public List<User> selectMessagePaging(User user) throws Exception{
		return mainService.selectMessagePaging(user);
	}
	
	//마이페이지

	//내 회원 정보 조회
	@RequestMapping("/selectProFileList")
	public User selectProFileList(HttpSession session) throws Exception{
		return mainService.selectProFileList(session);
	}
	
	//비밀번호 변경 마이페이지
	@RequestMapping("/selectMyInfo")
	public User selectMyInfo(HttpSession session,User user) throws Exception {
		return mainService.selectMyInfo(session,user);
	}
	//쪽지 등로(관리자)
	@RequestMapping("/adminInsertMessage")
	public void adminInsertMessage(@RequestParam(value="memberList")List<String> memberList,User user,HttpSession session) throws Exception {
		mainService.adminInsertMessage(memberList, user, session);
	}
	//쪽지 상세 조회 삭제 
	@RequestMapping("/delNotice")
	public void delNotice(Question question) throws Exception {
		mainService.delNotice(question);
	}

	//관리자 쪽지함  삭제(체크박스) 
	@RequestMapping("/questionDel")
	public void questionDel(@RequestParam(value="questionObject") List<String> questionObject) throws Exception {
		      mainService.questionDel(questionObject);  		
	}
	
	
//	Q&A
	
	//Q&A 조회
	@RequestMapping("/selectQuestionList")
	public List<Question> selectQuestionList(Question question) throws Exception{
		return mainService.selectQuestionList(question);
	}
	//Q&A 등록
	@RequestMapping("/insertQuestion")
	public String insertQuestion(MultipartHttpServletRequest request, Question question,HttpSession session) throws Exception {
		System.out.println("Q&A등록");
		mainService.insertQuestion(request,question,session);
		return "등록이 완료되었습니다";
	}
	//상제조회시 Q&A 조회수 증가
	@RequestMapping("/updateQuestionViews")
	public void updateQuestionViews(Question question) throws Exception {
		mainService.updateQuestionViews(question);
	}
	// Q&A 상세조회
	@RequestMapping("/selectQuestionInfo")
	public Question selectQuestionInfo(Question question) throws Exception{
		return mainService.selectQuestionInfo(question);
	}
	// Q&A 답변 조회
	@RequestMapping("/reList")
	public List<Question> reList(Question question) throws Exception{
		return mainService.reList(question);
	}
	//Q&A 답글 등록
	@RequestMapping("/insertReNotice")
	public String insertReNotice(Question question,HttpSession session) throws Exception {
		mainService.insertReNotice(question,session);
		return "등록이 완료되었습니다";
	}
	// 관리자 Q&A 답글 삭제
	@RequestMapping("/deleteNoticeRe")
	public void deleteNoticeRe(Question question) throws Exception {
		      mainService.deleteNoticeRe(question);  		
	}
	// Q&A 상세조회 파일 다운로드
	@RequestMapping("/noticeFileDownload")
	public void noticeFileDownload(HttpServletResponse response, Question question) throws Exception{
		mainService.noticeFileDownload(response, question);
	}
	// Q&A 파일 조회
	@RequestMapping("/selectQuestionFile")
	public List<Question> selectQuestionFile(Question question) throws Exception{
		return mainService.selectQuestionFile(question);
	}
	
	// Q&A 페이징 행읽기
	@RequestMapping("/selectQuestionRow")
	public int selectNormalDataRowCount(Question question) throws Exception{
		int rowCount = mainService.selectQuestionRow(question);
		return rowCount;
	}
	
	// Q&A 페이징
	@RequestMapping("/selectQuestionPaging")
	public List<LinkedHashMap<String,Object>> selectQuestionPaging(Question question) throws Exception{
		List<LinkedHashMap<String,Object>> pagingQuestion = mainService.selectQuestionPaging(question);
		return pagingQuestion;
	}
	
	@RequestMapping("/selectMyData")
	public Map<String, Object> selectMyData(HttpSession session,Dataset dataset) throws Exception {
		System.out.println("나의 데이터셋 리스트 불러오기");
		return mainService.selectMyData(session,dataset);
	}


}
