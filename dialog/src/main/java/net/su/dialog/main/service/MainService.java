package net.su.dialog.main.service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.su.dialog.dataSet.domain.Dataset;
import net.su.dialog.main.domain.Question;
import net.su.dialog.main.domain.User;
import net.su.dialog.management.domain.Authority;

public interface MainService {
	
	public void insertViewInfo(User user);
	
	public User selectMemIdCheck(User user) throws Exception;
	
	public User selectLoginCheck(User user) throws Exception;
	
	public List<User> selectMessageList(User user, HttpSession session)throws Exception;
	
	//회원 아이디 찾기
	public User selectId(User user) throws Exception;
	//회원 비밀번호 찾기
	public User selectPw(User user) throws Exception;
	//회원 비밀번호 수정
	public User updatePw(User user) throws Exception;
	
	//메세지 등록
	public void insertMessage(User user,HttpSession session) throws Exception;
	
	//보낸 쪽지함 리스트
	public List<User> selectGiveMessageList(User user, HttpSession session)throws Exception;
	
	//쪽지함 상세 조회
	public User selectMessageInfo(User user) throws Exception;
	
	//회원 정보 조회
	public User SelectMemberInfo(HttpSession session)throws Exception;
	
	//쪽지 삭제(상세 조회창에서)
	public void delMessage(User user)throws Exception;
	//받은 쪽지삭제(체크박스)
	public void recMessageDel(List<String> messageSeqs) throws Exception;
	//보낸 쪽지삭제(체크박스)
	public void senMessageDel(List<String> messageSeqs) throws Exception;
	
	
	//관리자 
	//쪽지 조회
	public List<User> selectMessageAdmin(User user)throws Exception;
	
	//쪽지 삭제
	public void adminMessageDel(List<String> messageSeqs) throws Exception;
	
	//관리자 쪽지 상세조회
	public User adminMessageInfoView(User user) throws Exception;
	
	// Q&A 조회
	public List<Question> selectQuestionList(Question question)throws Exception;
	//Q&A 등록
	public void insertQuestion(MultipartHttpServletRequest request, Question question,HttpSession session) throws Exception;
	
	//Q&A 조회수 증가 
	public void updateQuestionViews(Question question)throws Exception;
	
	//Q&A 상세조회
	public Question selectQuestionInfo(Question question) throws Exception;
	
	//Q&A 삭제(상세 조회)
	public void delNotice(Question question)throws Exception;

	public List<Authority> selectMember()throws Exception;
	//멤버 코드 조회
	public User selectMemberRating(HttpSession session) throws Exception;

	public List<Question> reList(Question question) throws Exception;
	//관리자 Q&A 답글 등록
	public void insertReNotice(Question question, HttpSession session) throws Exception;
	//관리자 Q&A 삭제 
	public void questionDel(List<String> questionObject)throws Exception;
	//Q&A 파일 다운
	public void noticeFileDownload(HttpServletResponse response, Question question) throws Exception;
	//Q&A 파일 조회
	public List<Question> selectQuestionFile(Question question)throws Exception;
	//관리자 쪽지 등록시 아이디 조회
	public List<User> getMemberList(int inputseq)throws Exception;

	public void adminInsertMessage(List<String> memberList, User user, HttpSession session) throws Exception;
	//내 회원  정보 조회
	public User selectProFileList(HttpSession session)throws Exception;
	//마이페이지 회원정보 수정
	public void updateInfo(User user, HttpSession session)throws Exception;

	public List<LinkedHashMap<String, Object>> selectQuestionPaging(Question question) throws Exception;
	//마이페이지 비밀번호 변경
	public User selectMyInfo(HttpSession session, User user) throws Exception;
	// 문의사항 행수 
	public int selectQuestionRow(Question question)throws Exception;
	//관리자 쪽지함 행수 
	public int selectAdminMessageRow(User user)throws Exception;
	//관리자 쪽지함 페이징
	public List<User> selectMessagePaging(User user)throws Exception;
	//받은 쪽지함 행수 
	public int selectGivenMessageRow(HttpSession session)throws Exception;
	//보낸 쪽지함 행수 
	public int selectGiveMessageRow(HttpSession session)throws Exception;

	public List<User> selectGivenMessagePaging(User user, HttpSession session)throws Exception;

	public List<User> selectGiveMessagePaging(User user, HttpSession session)throws Exception;
	//읽지 않은 쪽지함 행수 조회
	public int selectUnMessage(HttpSession session)throws Exception;
	//받은 쪽지함 상세 조회시 조회뷰 변경
	public void updateMessageViews(HttpSession session,User user)throws Exception;
	//관리자 Q&A 답글 삭제
	public void deleteNoticeRe(Question question)throws Exception;

	public Map<String, Object> selectMyData(HttpSession session, Dataset dataset) throws Exception;






}

