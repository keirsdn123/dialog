package net.su.dialog.main.mapper;

import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Repository;

import net.su.dialog.dataSet.domain.DataManage;
import net.su.dialog.dataSet.domain.Dataset;
import net.su.dialog.main.domain.Question;
import net.su.dialog.main.domain.User;
import net.su.dialog.management.domain.Authority;


@Repository("net.su.dialog.main.mapper.MainMapper")
public interface MainMapper {

	public List<User> getTestList(User user) throws Exception;
	
	public List<User> getFileList(User user) throws Exception;

	public void insertViewInfo(User user);
	
	public User selectMemIdCheck(User user) throws Exception;

	public User selectLoginCheck(User user) throws Exception;
	
    public List<User> selectMessageList(User user) throws Exception;
	
	//아이디 찾기
	public User selectId(User user)throws Exception;
	//비밀번호 찾기
	public User selectPw(User user)throws Exception;
	
	//비밀번호 수정
	public User updatePw(User user)throws Exception;
	
	public void insertMessage(User user) throws Exception;
	
	public User selectMessageInfo(User user)throws Exception;
	
	public List<User> selectGiveMessageList(User user) throws Exception;
	
	public void delMessage(User user) throws Exception;
	
	public void senMessageDel(String messageSeq) throws Exception;
	
	public void recMessageDel(String messageSeq) throws Exception;
	
	//관리자 
	//쪽지 조회
	public List<User> selectMessageAdmin(User user)throws Exception;
	
	//쪽지 삭제
	public void adminMessageDel(String messageSeq)throws Exception;
	
	//쪽지등록 (회원조회)
	public List<Authority> selectMember() throws Exception; // raw데이터 레코드 조회

	
	//Q&A조회
	 public List<Question> selectQuestionList(Question question) throws Exception;
	 //Q&A 등록
	public void insertQuestion(Question question) throws Exception;
	//Q&A 파일 등록
	public void insertQuestionFile(Question question) throws Exception;
	
	//Q&A 조회수 1증가
	public void updateQuestionViews(Question question) throws Exception;

	//Q&A 상세조회
	public Question selectQuestionInfo(Question question) throws Exception;
	
	//Q&A 삭제
	public void delNotice(Question question) throws Exception;
	
	//Q&A 파일 삭제
	public void delNoticeFile(Question question)throws Exception;

	public User selectMemberRating(User user) throws Exception;
	//Q&A 답변 조회
	public List<Question> reList(Question question) throws Exception;
	// Q&A 답변 등록
	public void insertReNotice(Question question) throws Exception;
	//Q&A 삭제
	public void questionDel(String noticeCode)throws Exception;
	//Q&A 파일 삭제
	public void questionFileDel(String noticeCode)throws Exception;

	public List<Question> selectQuestionFile(Question question)throws Exception;
	//2차 아이디 조회
	public List<User> getMemberList(User user)throws Exception;
	// 관리자 다중 메세지 등록
	public void adminInsertMessage(User user) throws Exception;
	//내 회원 정보 조회
	public User selectProFileList(User user)throws Exception;
	//답글 등록시 문의사항 상태변경
	public void updateNoticeStatus(Question question)throws Exception;
	//마이페이지 회원 정보 수정
	public void updateInfo(User user)throws Exception;

	public List<LinkedHashMap<String, Object>> selectQuestionPaging(Question question)throws Exception;
	//문의사항 행수 읽기
	public int selectQuestionRow(Question question)throws Exception;
	//관리자 전체 쪽지함 행수
	public int selectAdminMessageRow(User user)throws Exception;
	//사용자 받은 쪽지함 행수
	public int selectGivenMessageRow(User user)throws Exception;
	//사용자 보낸 쪽지함 행수 
	public int selectGiveMessageRow(User user)throws Exception;
	//읽지않은 쪽지함 조회
	public int selectUnMessage(User user)throws Exception;

	public void updateMessageViews(User user)throws Exception;

	public void deleteNoticeRe(Question question)throws Exception;

	public List<Dataset> selectMyData(Dataset dataset)throws Exception;


	




}
