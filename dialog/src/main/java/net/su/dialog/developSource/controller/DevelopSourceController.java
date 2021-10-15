package net.su.dialog.developSource.controller;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import net.su.dialog.developSource.domain.DevelopSource;

//페이지 전환 controller
@Controller
@RequestMapping(value="/developSource")
public class DevelopSourceController {
	
	//개발소스 파일 등록 화면 이동
	@RequestMapping("/developSourceInsertView")
	public String developSourceInsertView (HttpSession session) {
		if(session.getAttribute("memInfo")==null) {
			return ".login";
		}else{
			return ".developSourceInsertView";
		}
	}
	//개발소스 리스트 화면 이동
	@RequestMapping("/developSourceListView")
	public String developSourceListView (HttpSession session) {
		if(session.getAttribute("memInfo")==null) {
			return ".login";
		}else{
			return ".developSourceListView";
		}
	}
	//개발소스 상세조회 화면 이동
	@RequestMapping("/developSourceInfoView")
	public String developSourceInfoView (HttpSession session,DevelopSource dps, Model model) {
		if(session.getAttribute("memInfo")==null) {
			return ".login";
		}else{
			model.addAttribute("devSourceCode",dps.getDevSourceCode());
			return ".developSourceInfoView";
		}
	}
}
