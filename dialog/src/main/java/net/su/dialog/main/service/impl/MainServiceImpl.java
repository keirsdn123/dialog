package net.su.dialog.main.service.impl;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.su.dialog.dataSet.domain.DataManage;
import net.su.dialog.dataSet.domain.DataSetConfirmVo;
import net.su.dialog.dataSet.domain.Dataset;
import net.su.dialog.main.domain.Question;
import net.su.dialog.main.domain.User;
import net.su.dialog.main.mapper.MainMapper;
import net.su.dialog.main.service.MainService;
import net.su.dialog.management.domain.Authority;

@Service
public class MainServiceImpl implements MainService{
	
	@Resource(name="net.su.dialog.main.mapper.MainMapper")
    private MainMapper mainMapper;
	//회원정보 등록
	public void insertViewInfo(User user) {
		mainMapper.insertViewInfo(user);
	}
	
//아이디 중복검사
	public User selectMemIdCheck(User user) throws Exception{
		return mainMapper.selectMemIdCheck(user);
	}
	//아이디 찾기
	public User selectId(User user) throws Exception{		
		return mainMapper.selectId(user);
	}
	//비밀번호 찾기
	public User selectPw(User user) throws Exception{		
		return mainMapper.selectPw(user);
	}
	//비밀번호 수정
	public User updatePw(User user) throws Exception{		
		return mainMapper.updatePw(user);
	}
	//로그인 체크	
	public User selectLoginCheck(User user) throws Exception{
		return mainMapper.selectLoginCheck(user);	
	}
	//메세지 리스트 조회
	public List<User> selectMessageList(User user,HttpSession session) throws Exception {
		User userInfo = (User) session.getAttribute("memInfo");
		user.setMemberCode(userInfo.getMemberCode());
		return mainMapper.selectMessageList(user);
	}
	//메세지 보낸 리스트 조회
	public List<User> selectGiveMessageList(User user,HttpSession session) throws Exception {
		User userInfo = (User) session.getAttribute("memInfo");
		user.setMemberCode(userInfo.getMemberCode());
		return mainMapper.selectGiveMessageList(user);
	}
	// 쪽지 등록 버튼
	public void insertMessage(User user,HttpSession session) throws Exception {
		User userInfo= (User) session.getAttribute("memInfo");
		user.setMemberCode(userInfo.getMemberCode());
		mainMapper.insertMessage(user);
	}
	//쪽지 상세조회
	public User selectMessageInfo(User user) throws Exception{
		
		return mainMapper.selectMessageInfo(user);
	}
	//쪽지 삭제
	public void delMessage(User user) throws Exception{
		mainMapper.delMessage(user);
	}	
	public void recMessageDel(List<String> messageSeqs) throws Exception{

		for(String messageSeq: messageSeqs) {
			mainMapper.recMessageDel(messageSeq.replaceAll("[^\uAC00-\uD7A3xfe0-9a-zA-Z\\s]", ""));
		}
	}
	//보낸쪽지함 삭제(체크박스)
	public void senMessageDel(List<String> messageSeqs) throws Exception{
		for(String messageSeq: messageSeqs) {
			mainMapper.senMessageDel(messageSeq.replaceAll("[^\uAC00-\uD7A3xfe0-9a-zA-Z\\s]", ""));
		}
	}
	
	public User SelectMemberInfo(HttpSession session) throws Exception{
		User memberInfo = new User();
		if(session.getAttribute("memInfo")!=null) {
		
			memberInfo = (User) session.getAttribute("memInfo");
		}
		return memberInfo;
	}
	
	//관리자
	//쪽지  리스트 조회
	public List<User> selectMessageAdmin(User user) throws Exception {
		return mainMapper.selectMessageAdmin(user);
	}
	
	
	// 쪽지 삭제
	public void adminMessageDel(List<String> messageSeqs) throws Exception {
		for(String messageSeq: messageSeqs) {
			mainMapper.adminMessageDel(messageSeq.replaceAll("[^\uAC00-\uD7A3xfe0-9a-zA-Z\\s]", ""));
		}
	}	
	// 쪽지 상세조회
	public User adminMessageInfoView(User user) throws Exception {
		return mainMapper.selectMessageInfo(user);
	}
	//Q&A 조회수 증가
	public void updateMessageViews(HttpSession session,User user)throws Exception{
		User userInfo= (User) session.getAttribute("memInfo");
		user.setMemberCode(userInfo.getMemberCode());
		mainMapper.updateMessageViews(user);
	}
	
	//QNA 조회
	public List<Question> selectQuestionList(Question question)throws Exception{
		return mainMapper.selectQuestionList(question);
	}						
	// Q&A 등록
	public void insertQuestion(MultipartHttpServletRequest request, Question question,HttpSession session) throws Exception {
		User user = (User) session.getAttribute("memInfo");
		try {
			System.out.println("유저 아이디"+user.getMemberCode());
			MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
			Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
			MultipartFile multipartFile = null;
			String originalFileName = null;
			String originalFileExtension = null;
			String storedFileName="";
			String fileName="";
			String filePath = request.getSession().getServletContext().getRealPath("/");
			filePath = filePath.substring(0, filePath.indexOf("webapp"));
			filePath += "resources/static/noticeFile/";  //resource경로 만들기
			File dir = new File(filePath);
			if(!dir.isDirectory()) { //해당 경로의 폴더가 없다면 폴더를 생성
				dir.mkdirs();
			}
			while (iterator.hasNext()) {
				fileName = iterator.next();
				System.out.println("fileName : " + fileName);
				multipartFile = multipartHttpServletRequest.getFile(fileName);
				System.out.println("비었냐?? : " + multipartFile.isEmpty());
				if (multipartFile.isEmpty() == false) {//파일의 내용이 있는지 없는지 체크 빈 파일을 업로드할거면 없어도 됨
					originalFileName = multipartFile.getOriginalFilename();
					originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
					long fileSize =multipartFile.getSize();
					
					System.out.println("원본 파일이름 : " + originalFileName);
					System.out.println("원본 파일 확장자 명 : " + originalFileExtension);
					System.out.println("파일 사이즈 : "  + multipartFile.getSize());
					Random rnd = new Random();
					for (int i = 0; i < 15; i++) { //15자리 랜덤 파일명 생성
						int rIndex = rnd.nextInt(3);
						switch (rIndex) {
						case 0:
							// a-z
							storedFileName += (char) ((int) (rnd.nextInt(26)) + 97);
							break;
						case 1:
							// A-Z
							storedFileName += (char) ((int) (rnd.nextInt(26)) + 65);
							break;
						case 2:
							// 0-9
							storedFileName += rnd.nextInt(10);
							break;
						}
					}
					
					storedFileName += originalFileExtension;
					File file = new File(filePath+ storedFileName);
					multipartFile.transferTo(file);
					question.setNoticeFileOriginalTitle(originalFileName);
					question.setNoticeFileTitle(storedFileName);
					question.setNoticeFileRoute(file.getPath());
					question.setNoticeFileExtension(originalFileExtension);


				}
				question.setMemberCode(user.getMemberCode());
				mainMapper.insertQuestion(question);	// Q&A 제목 내용
				question.setNotice_code(question.getNotice_code());
				mainMapper.insertQuestionFile(question); // Q&A 파일 등록
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	//Q&A 조회수 증가
	public void updateQuestionViews(Question question)throws Exception{
		mainMapper.updateQuestionViews(question);
	}
	//Q&A 상세조회
	public Question selectQuestionInfo(Question question) throws Exception{
		
		return mainMapper.selectQuestionInfo(question);
	}
	
	//Q&A 삭제
	public void delNotice(Question question) throws Exception{
		mainMapper.delNotice(question);
		mainMapper.delNoticeFile(question);
	}

	//회원 조회
	public List<Authority> selectMember() throws Exception {
		return mainMapper.selectMember(); // raw데이터 레코드 조회

	}

	
	public User selectMemberRating(HttpSession session) throws Exception {
		User user = (User) session.getAttribute("memInfo");
		return mainMapper.selectMemberRating(user);
	}


	//Q&A 답글 조회
	public List<Question> reList(Question question) throws Exception {
		return mainMapper.reList(question);
	}

	//Q&A 답글 등록(관리자)
	public void insertReNotice(Question question, HttpSession session) throws Exception {
		User userInfo= (User) session.getAttribute("memInfo");
		question.setMemberCode(userInfo.getMemberCode());
		mainMapper.insertReNotice(question);
		mainMapper.updateNoticeStatus(question);
		
	}
	//Q&A 답글 삭제
	public void deleteNoticeRe(Question question) throws Exception{
		mainMapper.deleteNoticeRe(question);
	}

	//Q&A 다중 삭제
	public void questionDel(List<String> questionObject) throws Exception {
		for(String noticeCode: questionObject) {
			mainMapper.questionDel(noticeCode.replaceAll("[^\uAC00-\uD7A3xfe0-9a-zA-Z\\s]", ""));
			mainMapper.questionFileDel(noticeCode.replaceAll("[^\uAC00-\uD7A3xfe0-9a-zA-Z\\s]", ""));
		}		
	}

	//Q&A 파일다운
	
	public void noticeFileDownload(HttpServletResponse response, Question question) throws Exception {
		byte fileByte[] = FileUtils.readFileToByteArray(new File(question.getNoticeFileRoute()));
		response.setHeader("Set-Cookie", "fileDownload=true; path=/");
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition","attachment; fileName=\"" + URLEncoder.encode(question.getNoticeFileTitle()+question.getNoticeFileExtension(), "UTF-8") + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
		
	}

	//파일 조회
	public List<Question> selectQuestionFile(Question question) throws Exception {
		return mainMapper.selectQuestionFile(question);
	}

	// 2차 아이디 조회
	public List<User> getMemberList(int inputseq) throws Exception {
		User user= new User();
		user.setMemberRatingCode(inputseq);
		return mainMapper.getMemberList(user);
	}
	

	
	//쪽지 등록(관리자)
	public void adminInsertMessage(List<String> memberList,User user,HttpSession session) throws Exception {
		
		User userInfo = (User) session.getAttribute("memInfo");
		user.setMemberId(userInfo.getMemberId());
		System.out.println("ddd"+user.getMesContent());
		System.out.println(user.getMemberId());
		for(String member : memberList) {
	 		user.setRecSeq(Integer.parseInt(member.replaceAll("[^\uAC00-\uD7A3xfe0-9a-zA-Z\\s]", "")));
	 		user.setMesContent(user.getMesContent());
	 		mainMapper.adminInsertMessage(user);
			}

	}

	//내 회원 정보 조회
	public User selectProFileList(HttpSession session) throws Exception {
		User user = (User) session.getAttribute("memInfo");
		System.out.println("아 된다"+user.getMemberCode());
		return mainMapper.selectProFileList(user);
	}
	//마이페이지 회원정보 수정
	public void updateInfo(User user,HttpSession session) throws Exception{	
		User userCode= (User) session.getAttribute("memInfo");
		user.setMemberCode(userCode.getMemberCode());
		System.out.println("dflkjahdflksahf"+user.getMemberEmailAddress());
		mainMapper.updateInfo(user);
	}
	
	// 문의사항 페이징
	public List<LinkedHashMap<String,Object>> selectQuestionPaging(Question question) throws Exception{
		
		List<LinkedHashMap<String,Object>> pagingQuestion = mainMapper.selectQuestionPaging(question);
		
		return pagingQuestion;
	}
	//마이페이지 비밀번호 변경
	public User selectMyInfo(HttpSession session,User user) throws Exception {
		User userInfo = (User) session.getAttribute("memInfo");
		user.setMemberId(userInfo.getMemberId());
		return mainMapper.selectLoginCheck(user);
	}

	//문의사항 페이징 행읽기
	public int selectQuestionRow(Question question) throws Exception {
		int allRecords = mainMapper.selectQuestionRow(question);
		return allRecords;
	}

	//쪽지함 관리자 페이징 행읽기
	public int selectAdminMessageRow(User user) throws Exception {
		int allRecords = mainMapper.selectAdminMessageRow(user);
		return allRecords;
	}

	//쪽지함 관리자 페이징
	public List<User> selectMessagePaging(User user) throws Exception {
		return mainMapper.selectMessageAdmin(user);
	}

	//받은 쪽지함 행수
	public int selectGivenMessageRow(HttpSession session) throws Exception {
		User user = (User) session.getAttribute("memInfo");
		int allRecords = mainMapper.selectGivenMessageRow(user);
		return allRecords;
	}
	//보낸 쪽지함 행수
	public int selectGiveMessageRow(HttpSession session) throws Exception {
		User user = (User) session.getAttribute("memInfo");
		int allRecords = mainMapper.selectGiveMessageRow(user);
		return allRecords;
	}
	//받은 쪽지함 페이징
	public List<User> selectGivenMessagePaging(User user,HttpSession session) throws Exception {
		User userInfo = (User) session.getAttribute("memInfo");
		user.setMemberCode(userInfo.getMemberCode());
		return mainMapper.selectMessageList(user);
	}


	//보낸 쪽지함 페이징
	public List<User> selectGiveMessagePaging(User user,HttpSession session) throws Exception {
		User userInfo = (User) session.getAttribute("memInfo");
		user.setMemberCode(userInfo.getMemberCode());
		return mainMapper.selectGiveMessageList(user);
	}
	
	//보낸 쪽지함 행수
	public int selectUnMessage(HttpSession session) throws Exception {
		User user = (User) session.getAttribute("memInfo");
		int allRecords = mainMapper.selectUnMessage(user);
		return allRecords;
	}

	public Map<String, Object> selectMyData(HttpSession session, Dataset dataset) throws Exception {
		mainMapper.selectMyData(dataset);
		User userInfo = (User) session.getAttribute("memInfo");
		dataset.setMemberCode(userInfo.getMemberCode());
		List<Dataset> selectMyData = mainMapper.selectMyData(dataset);
		Map<String, Object> MyDataListMap = new HashMap<String, Object>();
		MyDataListMap.put("selectMyData", selectMyData);
		
		return MyDataListMap;
	}

}
