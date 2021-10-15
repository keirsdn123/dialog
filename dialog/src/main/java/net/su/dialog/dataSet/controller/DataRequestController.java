package net.su.dialog.dataSet.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import net.su.dialog.dataSet.domain.DataRequest;
import net.su.dialog.dataSet.service.DataRequestService;
import net.su.dialog.main.domain.User;
import net.su.dialog.main.service.MainService;
import net.su.dialog.schedule.domain.SchVo;

@Controller
@RequestMapping (value = "myData")
public class DataRequestController {

	@Autowired
    private MainService mainService;
	
	@Autowired
	private DataRequestService dataRequestService;
	// 데이터 승인 관리 메뉴
	@RequestMapping("/dataApprovalManagement")
	public String dataApprovalManagement(Model model, DataRequest dataRequest, HttpSession session) {
		System.out.println("타입임니다" + dataRequest.getTabType());
		if(session.getAttribute("memInfo")==null) {
			return ".login";
		}
		else {
			if(dataRequest.getTabType() == 0) {
				model.addAttribute("collectTab", "daum-tab");
				model.addAttribute("bigTab", "collect");
			}
			else if(dataRequest.getTabType() == 1) {
				model.addAttribute("collectTab", "act-tab");
				model.addAttribute("bigTab", "collect");
			}
			else if(dataRequest.getTabType() == 2) {
				model.addAttribute("collectTab", "rss-tab");
				model.addAttribute("bigTab", "class");
			}
			else if(dataRequest.getTabType() == 3) {
				model.addAttribute("collectTab", "shop-tab");
				model.addAttribute("bigTab", "class");
			}
			else if(dataRequest.getTabType() == 4) {
				model.addAttribute("collectTab", "shop-tab");
				model.addAttribute("bigTab", "student");
			}
			else if(dataRequest.getTabType() == 5) {
				model.addAttribute("collectTab", "daumNews-tab");
				model.addAttribute("bigTab", "class");
			}
			return ".dataApprovalManagement";
		}
	}
	
	// 나의 요청 목록
	@RequestMapping("/listMyCollectList")
	public String listMyCollectList(HttpSession session, Model model, DataRequest dataRequest) throws Exception {
		System.out.println("타입임니다" + dataRequest.getTabType());
		if(session.getAttribute("memInfo")==null) {
			return ".login";
		}
		User user = mainService.SelectMemberInfo(session);
		if(user.getMemberRatingCode() == 2 || user.getMemberRatingCode() == 3 ) {
			if(dataRequest.getTabType() == 0) {
				model.addAttribute("collectTab", "daum-tab");
				model.addAttribute("bigTab", "collect");
			}
			else if(dataRequest.getTabType() == 1) {
				model.addAttribute("collectTab", "act-tab");
				model.addAttribute("bigTab", "collect");
			}
			else if(dataRequest.getTabType() == 2) {
				model.addAttribute("collectTab", "rss-tab");
				model.addAttribute("bigTab", "class");
			}
			else if(dataRequest.getTabType() == 3) {
				model.addAttribute("collectTab", "shop-tab");
				model.addAttribute("bigTab", "class");
			}
			else if(dataRequest.getTabType() == 4) {
				model.addAttribute("collectTab", "shop-tab");
				model.addAttribute("bigTab", "student");
			}
			else if(dataRequest.getTabType() == 5) {
				model.addAttribute("collectTab", "daumNews-tab");
				model.addAttribute("bigTab", "class");
			}
			return ".listMyCollectList";
		}
		else {
			return ".dataSetVizRequestList";
		}
	}
	
	
	
	// 수집 요청
	@RequestMapping("/insertViewCollectRequest")
	public String insertViewCollectRequest(HttpSession session) {
		if(session.getAttribute("memInfo")==null) {
			return ".login";
		}else{
			User user = (User) session.getAttribute("memInfo");
			if(user.getMemberRatingCode() < 2) {
				return ".main";
			}
		}
		return ".insertViewCollectRequest";
	}

	// 기타 데이터 상세 조회
	@RequestMapping("/infoViewMyCollectActRequest")
	public String infoViewMyCollectActRequest(Model model, DataRequest dataRequest, HttpSession session) throws Exception {
		User user = new User();
		if(session.getAttribute("memInfo")==null) {
			return ".login";
		}else{
			user = (User) session.getAttribute("memInfo");
			if(user.getMemberRatingCode() < 2) {
				return ".main";
			}
		}
		if(dataRequest.getActDataCollectRequestCode()==0) {
			return ".main";
		}
		dataRequest = dataRequestService.infoMyActCollectRequest(dataRequest);
		if(dataRequest.getMemberCode()!=user.getMemberCode()) {
			return ".main";
		}
		model.addAttribute("actDataCollectRequestCode", dataRequest.getActDataCollectRequestCode());
		return ".infoViewMyCollectActRequest";
	}
	
	// 기타 데이터 관리자 상세 조회
	@RequestMapping("/infoViewMCollectActRequest")
	public String infoViewMCollectActRequest(Model model, DataRequest dataRequest,HttpSession session) {
		if(session.getAttribute("memInfo")==null) {
			return ".login";
		}else{
			User user = (User) session.getAttribute("memInfo");
			if(user.getMemberRatingCode() < 3) {
				return ".main";
			}
		}
		if(dataRequest.getActDataCollectRequestCode()==0) {
			return ".main";
		}
		model.addAttribute("actDataCollectRequestCode", dataRequest.getActDataCollectRequestCode());
		return ".infoViewMCollectActRequest";
	}
	
	// 다음 뉴스 데이터 상세 조회
	@RequestMapping("/infoViewMyCollectDaumRequest")
	public String infoViewMyCollectDaumRequest(Model model, DataRequest dataRequest, HttpSession session) throws Exception {
		User user = new User();
		if(session.getAttribute("memInfo")==null) {
			return ".login";
		}else{
			user = (User) session.getAttribute("memInfo");
			if(user.getMemberRatingCode() < 2) {
				return ".main";
			}
		}
		if(dataRequest.getDaumNewsDataCollectRequestCode()==0) {
			return ".main";
		}
		dataRequest = dataRequestService.infoMyDaumCollectRequest(dataRequest);
		if(dataRequest.getMemberCode()!=user.getMemberCode()) {
			return ".main";
		}
		model.addAttribute("daumNewsDataCollectRequestCode", dataRequest.getDaumNewsDataCollectRequestCode());
		return ".infoViewMyCollectDaumRequest";
	}
	
	// 다음 뉴스 데이터 관리자 상세 조회
	@RequestMapping("/infoViewMCollectDaumRequest")
	public String infoViewMCollectDaumRequest(Model model, DataRequest dataRequest, HttpSession session) {
		if(session.getAttribute("memInfo")==null) {
			return ".login";
		}else{
			User user = (User) session.getAttribute("memInfo");
			if(user.getMemberRatingCode() < 3) {
				return ".main";
			}
		}
		if(dataRequest.getDaumNewsDataCollectRequestCode()==0) {
			return ".main";
		}
		model.addAttribute("daumNewsDataCollectRequestCode", dataRequest.getDaumNewsDataCollectRequestCode());
		return ".infoViewMCollectDaumRequest";
	}
	
	// 반출 요청 상세 조회
	@RequestMapping("/infoViewMyCollectRequest")
	public String infoViewMyCollectRequest(Model model, DataRequest dataRequest, HttpSession session) throws Exception {
		model.addAttribute("tabType", dataRequest.getTabType());
		System.out.println("타입임니다" + dataRequest.getTabType());
		model.addAttribute("dataExportRequestCode", dataRequest.getDataExportRequestCode());
		User user = new User();
		if(session.getAttribute("memInfo")==null) {
			System.out.println("케이스1");
			return ".login";
		}else{
			user = (User) session.getAttribute("memInfo");
			if(user.getMemberRatingCode() < 2) {
				System.out.println("케이스2");
				return ".main";
			}
		}
		if(dataRequest.getDataExportRequestCode()==0) {
			System.out.println("케이스3");
			return ".main";
		}
		dataRequest = dataRequestService.infoMyRssExportRequest(dataRequest);
		if(dataRequest.getMemberCode()!=user.getMemberCode()) {
			System.out.println("케이스4");
			return ".main";
		}
		return ".infoViewMyCollectRequest";
	}
	
	// 반출 요청 관리자 상세 조회
	@RequestMapping("/infoViewMExportRequest")
	public String infoViewMExportRequest(Model model, DataRequest dataRequest, HttpSession session) {
		model.addAttribute("tabType", dataRequest.getTabType());
		System.out.println("타입임니다" + dataRequest.getTabType());
		model.addAttribute("dataExportRequestCode", dataRequest.getDataExportRequestCode());
		if(session.getAttribute("memInfo")==null) {
			return ".login";
		}else{
			User user = (User) session.getAttribute("memInfo");
			if(user.getMemberRatingCode() < 3) {
				return ".main";
			}
		}
		if(dataRequest.getDataExportRequestCode()==0) {
			return ".main";
		}
		return ".infoViewMExportRequest";
	}
	
	// 반출 요청
	@RequestMapping("/insertViewExportRequest")
	public String insertViewExportRequest(HttpSession session) {
		if(session.getAttribute("memInfo")==null) {
			return ".login";
		}else{
			User user = (User) session.getAttribute("memInfo");
			if(user.getMemberRatingCode() < 2) {
				return ".main";
			}
		}
		return ".insertViewExportRequest";
	}
}
