package net.su.dialog.report.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import net.su.dialog.dataSet.domain.DataRequest;
import net.su.dialog.dataSet.domain.Dataset;
import net.su.dialog.main.domain.User;
import net.su.dialog.report.service.ReportService;

//리프토 페이지 전환 controller
@Controller
@RequestMapping(value="/report")
public class ReportController {
	@Autowired
    private ReportService reportService;
	
	//보고서 등록화면
	@RequestMapping("/reportInsert")
	public String reportInsert() {
		return ".reportInsert";
	}
	@RequestMapping("/adminReportInsert")
	public String adminReportInsert() {
		return ".adminReportInsert";
	}
	//보고서 조회화면
	@RequestMapping("/reportList")
	public String reportList() {
		return ".reportList";
	}
	//보고서 상세조회
	@RequestMapping("/reportView")
    public String reportView(int reportCode, int reportDisplaySet, Model model, HttpSession session) throws Exception {
		int memberCode;
		if(session.getAttribute("memInfo")!=null) {
			
			User memberInfo =  (User) session.getAttribute("memInfo"); 
			memberCode = memberInfo.getMemberCode();
		}else {
			memberCode=0;
		}
		model.addAttribute("reportDisplaySet", reportDisplaySet);
		model.addAttribute("uMemberCode", memberCode);
		model.addAttribute("reportCode", reportCode);
		reportService.updateReportViews(reportCode);
		return ".reportView";
   }
   //보고서 수정화면
	@RequestMapping("/reportUpdate")
    public String reportUpdate(int reportCode, Model model) {		
		 model.addAttribute("reportCode", reportCode);		
		 System.out.println("보고서 수정으로 가는 보고서 seq"+reportCode);
		return ".reportUpdate";
   }
	//관리자: 보고서 수정화면
	@RequestMapping("/adminReportUpdate")
    public String adminReportUpdate(int reportCode, Model model) {		
		 model.addAttribute("reportCode", reportCode);		
		 System.out.println("관리자 보고서 수정으로 가는 보고서 seq"+reportCode);
		return ".adminReportUpdate";
   }

}
