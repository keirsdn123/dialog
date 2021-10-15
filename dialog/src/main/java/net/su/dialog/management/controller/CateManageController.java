package net.su.dialog.management.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import net.su.dialog.main.domain.User;

//페이지 전환 controller
@Controller
public class CateManageController {
	
	//카테고리관리 화면이동
	@RequestMapping("/cateManage")
	public String cateManage(HttpSession session) {
		if(session.getAttribute("memInfo")==null) {
			return ".login";
		}else{
			User user = (User) session.getAttribute("memInfo");
			if(user.getMemberRatingCode() < 3) {
				return ".main";
			}
		}
		return ".cateManage";
	}
}
