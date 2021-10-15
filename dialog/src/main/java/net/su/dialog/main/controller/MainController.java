package net.su.dialog.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import net.su.dialog.main.domain.Question;
import net.su.dialog.main.domain.User;
import net.su.dialog.main.service.MainService;

//페이지 전환 controller
@Controller
public class MainController {

	

	@Autowired
	private MainService mainService;

	@RequestMapping("/")
	public String main() {
		return ".main";
	}	
	// 로그인 창이동
	@RequestMapping("/login")
	public String Login() {
		return ".login";
	}
	// 아이디/비밀번호 찾기 창이동
	@RequestMapping("/selectInfo")
	public String selectInfo() {
		return ".selectInfo";
	}

	// 로그아웃 버튼
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("memInfo");
		return ".main";
	}

	// 회원가입창 이동
	@RequestMapping("/info")
	public String info() {
		return ".info";
	}
	// 아이디 찾기 이동
	@RequestMapping("/selectInfoList")
	public String selectInfoList(User user,Model model) {
		model.addAttribute("memberId",user.getMemberId());
		return ".infoList";
	}
	// 비밀번호 찾기 이동
	@RequestMapping("/updatePassword")
	public String updatePassword(User user,Model model) {
		model.addAttribute("memberCode",user.getMemberCode());
		System.out.println("memberCode는 "+user.getMemberCode());
		return ".updatePassword";
	}
	// 회원 로그인 세션설정
	@RequestMapping(value = "/memLogin")
	public String memLogin(User user, HttpSession session) throws Exception {
		User selectLoginCheck = mainService.selectLoginCheck(user);
		session.setAttribute("memInfo", selectLoginCheck);
		return ".main";
	}
	
	@RequestMapping("/selectmyPage")
	public String selectmyPage() {
		return ".myPage";
	}

	// 쪽지 등록 이동
	@RequestMapping("/messageInsert")
	public String messageInsert() {
		return ".messageInsert";
	}
	// 쪽지 답글 이동
	@RequestMapping("/messageReSend")
	public String messageReSend(User user, Model model) {
		model.addAttribute("memberId",user.getMemberId());
		System.out.println("memem" +user.getMemberId());
		return ".messageInsert";
	}

	// 쪽지 상세조회창 이동
	@RequestMapping("/messageInfoView")
	public String messageInfoView(User user,Model model,HttpSession session) {
		model.addAttribute("messageSeq",user.getMessageSeq());
		User userInfo= (User) session.getAttribute("memInfo");
		user.setMemberCode(userInfo.getMemberCode());
		model.addAttribute("memberCode",user.getMemberCode());
		return ".messageInfo";
	}
	

	// 쪽지 조회 이동
	@RequestMapping("/selectMessage")
	public String selectMessage(HttpSession session, User user) throws Exception {
		session.setAttribute("memberCode", user.getMemberCode());
		return ".messageList";
	}
	
	// 관리자 쪽지 조회 이동
	@RequestMapping("/selectMessageManage")
	public String selectMessageManage(HttpSession session, User user) throws Exception {
		session.setAttribute("memberCode", user.getMemberCode());
		return ".messageListManage";
	}
	// 관리자 쪽지 상세조회창 이동
	@RequestMapping("/messageInfoManage")
	public String messageInfoManage(User user,Model model,HttpSession session) {
		model.addAttribute("messageSeq",user.getMessageSeq());
		User userInfo= (User) session.getAttribute("memInfo");
		user.setMemberCode(userInfo.getMemberCode());
		model.addAttribute("memberCode",user.getMemberCode());
		return ".messageInfoManage";
	}
	
	// 관리자 쪽지 등록 이동
	@RequestMapping("/adminMessageInsert")
	public String adminMessageInsert() {
		return ".adminMessageInsert";
	}
	// 관리자 권한관리 이동
	@RequestMapping("/userPower")
	public String userPower(HttpSession session, User user) throws Exception {
		return ".userPower";
	}
	// 문의사항 이동
	@RequestMapping("/question")
	public String question(User user,HttpSession session) throws Exception {
		if(session.getAttribute("memInfo")==null) {
			return ".login";
		}else{
			session.setAttribute("memberCode", user.getMemberCode());
			return ".question";
		}

	}
	// 문의사항 등록이동
	@RequestMapping("/questionInsert")
	public String questionInsert() {
		return ".questionInsert";
	}
	// 문의사항 상세조회
	@RequestMapping("/questionInfo")
	public String questionInfo(HttpSession session, Question question,Model model,User user) {
		model.addAttribute("noticeCode",question.getNoticeCode());
		User userInfo= (User) session.getAttribute("memInfo");
		question.setMemberCode(userInfo.getMemberCode());
		question.setMemberRatingCode(userInfo.getMemberRatingCode());
		model.addAttribute("memberCode",question.getMemberCode());
		model.addAttribute("memberRatingCode",question.getMemberRatingCode());
		return ".questionInfo";
	}
	// 회원정보 
	@RequestMapping("/proFileList")
	public String proFileList(HttpSession session, User user,Model model) throws Exception {
		session.setAttribute("memberCode", user.getMemberCode());
		model.addAttribute("memberCode",user.getMemberCode());
		return ".proFileList";
	}
	// 마이페이지 비밀번호 변경
	@RequestMapping("/updateMyPassword")
	public String User(User user,HttpSession session) throws Exception {
		session.setAttribute("memberCode", user.getMemberCode());
		return ".updateMyPassword";
	}
}
