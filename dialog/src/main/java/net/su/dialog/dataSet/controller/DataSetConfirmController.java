package net.su.dialog.dataSet.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import net.su.dialog.main.domain.User;

//페이지 전환 controller
@Controller
@RequestMapping("/dataSetConfirmLink")
public class DataSetConfirmController {

	@RequestMapping("/infoViewMakeStandarData")
	public String infoViewMakeStandarData(int dataCode, String normalDataTableTiltle, Model model) {
		model.addAttribute("dataCode", dataCode);
		model.addAttribute("normalDataTableTitle", normalDataTableTiltle);
		return ".standarData";
	}
	
	//일시 데이터 시각화 요청 승인 거부 후 리스트로 화면 이동
	@RequestMapping("/selectDataRejectList")
	public String selectDataRejectList(HttpSession session, Model model) {
		if(session.getAttribute("memInfo")==null) {
			return ".login";
		}else{
			User user = (User) session.getAttribute("memInfo");
			if(user.getMemberRatingCode() < 3) {
				return ".main";
			}
		}
		model.addAttribute("collectTab", "now-tab");
		model.addAttribute("bigTab", "student");
		return ".dataApprovalManagement";
	}
	
	//시각화 요청 목록 조회
	@RequestMapping("/selectVizRequestList")
	public String selectVizRequestList(Model model, HttpSession session) {
		if(session.getAttribute("memInfo")==null) {
			return ".login";
		}else{
			User user = (User) session.getAttribute("memInfo");
			if(user.getMemberRatingCode() < 3) {
				return ".main";
			}
		}
		model.addAttribute("collectTab", "now-tab");
		model.addAttribute("bigTab", "student");
		return ".dataApprovalManagement";
	}
	
	//시각화 요청 목록 조회
	@RequestMapping("/selectDatabaseManagement")
	public String selectDatabaseManagement(HttpSession session) {
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
