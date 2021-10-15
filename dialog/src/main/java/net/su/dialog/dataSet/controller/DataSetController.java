package net.su.dialog.dataSet.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import net.su.dialog.dataSet.domain.Dataset;
import net.su.dialog.dataSet.service.DataSetService;
import net.su.dialog.main.domain.User;
import net.su.dialog.main.service.MainService;
import net.su.dialog.report.domain.ReportDomain;


//페이지 전환 controller
@Controller
@RequestMapping(value="/dataSet")
public class DataSetController {
	
	@Autowired
    private MainService mainService;
	
	@Autowired
    private DataSetService dataSetService;
	
	//데이터 셋 등록화면
	@RequestMapping("/dataSetInsertView")
	public String dataSetInsertView(HttpSession session) {
		if(session.getAttribute("memInfo")==null) {
			return ".login";
		}else{
			User user = (User) session.getAttribute("memInfo");
			if(user.getMemberRatingCode() != 3) {
				return ".main";
			}
		}
		return ".dataSetInsertView";
	}
	//데이터 셋 리스트 화면
	@RequestMapping("/dataSetList")
	public String dataSetList(HttpSession session, Model model, Dataset dataset) throws Exception {
		User user = mainService.SelectMemberInfo(session);
		model.addAttribute("dataSetSearchWrd", dataset.getDataSetSearchWrd());
		if(user.getMemberRatingCode() == 2 || user.getMemberRatingCode() == 3 ) {
			model.addAttribute("userFlag",1);
			return ".dataSetList";
		}else {
			model.addAttribute("userFlag",0);
			return ".dataSetUserList";
		}
	}
//	//데이터 셋 리스트 화면(관리자)
//	@RequestMapping("/dataSetAdminList")
//	public String dataSetAdminList() {
//		return ".dataSetAdminList";
//	}
	//데이터 승인관리 > 시각화 승인관리 > 상세조회 화면
	@RequestMapping("/infoViewDataSetManagement")
    public String infoViewDataSetManagement(int dataCode, Model model, HttpSession session) throws Exception {
		if(session.getAttribute("memInfo")==null) {
			return ".login";
		} else {
			User user = (User) session.getAttribute("memInfo");
			if(user.getMemberRatingCode() != 3) {
				return ".main";
			}
		}
		model.addAttribute("dataCode", dataCode);
		return ".dataSetManagement";
   }
	//나의 데이터 관리 > 나의 data
	@RequestMapping("/mydataList")
    public String mydataList(HttpSession session, Model model, ReportDomain rvo) {
		System.out.println("snltnasdf@@@@@@@@@@@@@@@@@"+rvo.getReportDisplaySet());
		if(rvo.getReportDisplaySet() == 1) {
			System.out.println(rvo.getReportDisplaySet());
			model.addAttribute("last","last-tab");
			 return ".mydataList";
		} else
			 return ".mydataList";
     
	}
    //데이터 셋 상세조회 화면
	@RequestMapping("/dataSetListView")
    public String dataSetListView(int dataCode, int displaySet,  Model model, HttpSession session, Dataset dataset) throws Exception {
	  
		System.out.println(displaySet+" 화면 지정 ");
		int memberCode;
		int memberRatingCode;
		if(session.getAttribute("memInfo")!=null) {
			
			User memberInfo =  (User) session.getAttribute("memInfo"); 
			memberCode = memberInfo.getMemberCode();
			memberRatingCode = memberInfo.getMemberRatingCode();
		}else {
			memberCode=0;
			memberRatingCode=0;
		}
		model.addAttribute("displaySet", displaySet);
		model.addAttribute("memberCode", memberCode);
		model.addAttribute("memberRatingCode", memberRatingCode);
		model.addAttribute("dataCode", dataCode);
		System.out.println("typeNormalRegularly = "+dataset.getTypeNormalRegularly());
		model.addAttribute("typeNormalRegularly", dataset.getTypeNormalRegularly());
		System.out.println("확인확인" + dataset.getTypeNormalRegularly());
		System.out.println("확인확인123123" + dataCode);
		dataSetService.updateDatasetViews(dataCode);
      return ".dataSetListView";
   }
//	//나의 요청목록 > 시각화 
//	@RequestMapping("/dataSetVizRequestList")
//    public String dataSetVizRequestList() {
//      return ".dataSetVizRequestList";
//   }
    //데이터 셋 등록 화면(일반 사용자)
	@RequestMapping("/UserDataSetInsertView")
    public String UserDataSetInsertView(HttpSession session) {
		if(session.getAttribute("memInfo")==null) {
			return ".login";
		}else{
			return ".UserDataSetInsertView";
		}
	}
}
