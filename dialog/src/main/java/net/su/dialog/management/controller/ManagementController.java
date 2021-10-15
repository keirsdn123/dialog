package net.su.dialog.management.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import net.su.dialog.main.domain.User;


//페이지 전환 controller
@Controller
@RequestMapping(value="/management")
public class ManagementController {

	
	//회원 관리 화면이동
	@RequestMapping("/listViewMember")
	public String listViewMember(HttpSession session) {
		if(session.getAttribute("memInfo")==null) {
			return ".login";
		} else {
			User user = (User) session.getAttribute("memInfo");
			if(user.getMemberRatingCode() != 3) {
				return ".main";
			}
		}
		return ".listViewMember";
	}
	
	//메뉴 관리 화면이동
	@RequestMapping("/listViewMenu")
	public String listViewMenu(HttpSession session) {
		if(session.getAttribute("memInfo")==null) {
			return ".login";
		} else {
			User user = (User) session.getAttribute("memInfo");
			if(user.getMemberRatingCode() != 3) {
				return ".main";
			}
		}
		return ".listViewMenu";
	}
}
