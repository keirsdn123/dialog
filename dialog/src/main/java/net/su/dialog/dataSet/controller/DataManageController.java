package net.su.dialog.dataSet.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import net.su.dialog.main.domain.User;


//페이지 전환 controller
@Controller
public class DataManageController {
	
	//데이터베이스관리 화면이동
	@RequestMapping("/dbManage")
	public String dbManage(HttpSession session) {
		if(session.getAttribute("memInfo")==null) {
			return ".login";
		}else{
			User user = (User) session.getAttribute("memInfo");
			if(user.getMemberRatingCode() < 3) {
				return ".main";
			}
		}
		return ".dbManage";
	} 
}
